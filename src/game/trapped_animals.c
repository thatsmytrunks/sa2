#include "global.h"
#include "trig.h"
#include "game/game.h"
#include "game/stage_ui.h"

#include "constants/animations.h"
#include "constants/zones.h"

typedef struct {
    s32 vramOffset;
    u32 anim;
    u32 variant;
    s32 type;
} TrappedAnimalData;

typedef struct {
    s32 vramOffset;
    s32 anim;
    s32 variant;
    s32 x; // x
    s32 y; // y
} SpawnOptions;

typedef struct {
    Sprite sprite;
    s32 x;
    s32 y;
    s16 unk38;
    s8 flyingUp;
} FlyingAnimal;

typedef struct {
    Sprite sprite;
    s32 x;
    s32 y;
    s16 moveSpeed;
    s16 fallSpeed;
    s8 bouncing;
    u8 inAirTimer;
} BouncingAnimal;

typedef struct {
    Sprite sprite;
    s32 x;
    s32 y;
    s16 moveSpeed;
    s16 fallSpeed;
    u8 inAirTimer;
} StaticAnimal;

#define ANIMAL_VARIANTS_PER_ZONE 3

#define ANIMAL_GRAVITY           Q_24_8(0.1875)
#define ANIMAL_BOUNCE_SPEED      Q_24_8(4)
#define ANIMAL_BOUNCE_MOVE_SPEED Q_24_8(2)

#define ANIMAL_TYPE_STATIC   0
#define ANIMAL_TYPE_FLYING   1
#define ANIMAL_TYPE_BOUNCING 2

typedef void (*TrappedAnimalsFunc)(SpawnOptions *);

static void CreateStaticAnimal(SpawnOptions *);
static void CreateFlyingAnimal(SpawnOptions *);
static void CreateBouncingAnimal(SpawnOptions *);

static void Task_FlyingAnimal(void);
static void Task_StaticAnimalMain(void);
static void Task_BouncingAnimal(void);

#define IS_ANIMAL_OUT_OF_CAM_RANGE(x, y)                                                \
    ((x) < -32 || (x) > 272 || ((y) + 32) < 0 || (y) > 192)

const TrappedAnimalData gAnimsTrappedAnimals[][ANIMAL_VARIANTS_PER_ZONE] = {
    {
        { 192, SA2_ANIM_ANIMAL_SEA_OTTER, 0, ANIMAL_TYPE_STATIC },
        { 196, SA2_ANIM_ANIMAL_KOALA, 0, ANIMAL_TYPE_STATIC },
        { 200, SA2_ANIM_ANIMAL_KANGAROO, 0, ANIMAL_TYPE_BOUNCING },
    },
    {
        { 192, SA2_ANIM_ANIMAL_MOLE, 0, ANIMAL_TYPE_STATIC },
        { 196, SA2_ANIM_ANIMAL_SKUNK, 0, ANIMAL_TYPE_BOUNCING },
        { 200, SA2_ANIM_ANIMAL_ROBIN, 0, ANIMAL_TYPE_FLYING },
    },
    {
        { 192, SA2_ANIM_ANIMAL_LION, 0, ANIMAL_TYPE_STATIC },
        { 196, SA2_ANIM_ANIMAL_PEACOCK, 0, ANIMAL_TYPE_BOUNCING },
        { 200, SA2_ANIM_ANIMAL_PARROT, 0, ANIMAL_TYPE_FLYING },
    },
    {
        { 192, SA2_ANIM_ANIMAL_SEA_OTTER, 0, ANIMAL_TYPE_STATIC },
        { 196, SA2_ANIM_ANIMAL_SEAL, 0, ANIMAL_TYPE_STATIC },
        { 200, SA2_ANIM_ANIMAL_PENGUIN, 0, ANIMAL_TYPE_BOUNCING },
    },
    {
        { 192, SA2_ANIM_ANIMAL_ELEPHANT, 0, ANIMAL_TYPE_STATIC },
        { 196, SA2_ANIM_ANIMAL_LION, 0, ANIMAL_TYPE_STATIC },
        { 200, SA2_ANIM_ANIMAL_GORILLA, 0, ANIMAL_TYPE_BOUNCING },
    },
    {
        { 192, SA2_ANIM_ANIMAL_MOLE, 0, ANIMAL_TYPE_STATIC },
        { 196, SA2_ANIM_ANIMAL_DEER, 0, ANIMAL_TYPE_BOUNCING },
        { 200, SA2_ANIM_ANIMAL_RABBIT, 0, ANIMAL_TYPE_BOUNCING },
    },
    {
        { 192, SA2_ANIM_ANIMAL_SEA_OTTER, 0, ANIMAL_TYPE_STATIC },
        { 196, SA2_ANIM_ANIMAL_KOALA, 0, ANIMAL_TYPE_STATIC },
        { 200, SA2_ANIM_ANIMAL_KANGAROO, 0, ANIMAL_TYPE_BOUNCING },
    },
};

static TrappedAnimalsFunc const sTrappedAnimalSpawnFunctions[] = {
    CreateStaticAnimal,
    CreateFlyingAnimal,
    CreateBouncingAnimal,
};

static void CreateFlyingAnimal(SpawnOptions *init)
{
    struct Task *t
        = TaskCreate(Task_FlyingAnimal, sizeof(FlyingAnimal), 0x2000, 0, NULL);
    FlyingAnimal *animal = TaskGetStructPtr(t);
    Sprite *sprite;
    animal->x = Q_24_8(init->x);
    animal->y = Q_24_8(init->y);
    animal->unk38 = 576;
    animal->flyingUp = TRUE;

    sprite = &animal->sprite;
    sprite->x = init->x;
    sprite->y = init->y;
    sprite->graphics.dest = (void *)OBJ_VRAM0 + (init->vramOffset * TILE_SIZE_4BPP);
    sprite->unk1A = 0x440;
    sprite->graphics.size = 0;
    sprite->graphics.anim = init->anim;
    sprite->variant = init->variant;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 16;
    sprite->focused = 0;
    sprite->unk10 = SPRITE_FLAG_PRIORITY(2);
}

static void Task_FlyingAnimal(void)
{
    FlyingAnimal *animal = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &animal->sprite;

    s32 sin, cos;
    s32 x = animal->x;
    s32 y = animal->y;

    if (animal->flyingUp) {
        animal->unk38 += 6;
        if (animal->unk38 > 640) {
            animal->flyingUp = FALSE;
        }
    } else {
        animal->unk38 -= 6;
        if (animal->unk38 < 512) {
            animal->flyingUp = TRUE;
        }
    }

    x += Div(COS(animal->unk38 & ONE_CYCLE), 20) >> 3;
    y += Div(SIN(animal->unk38 & ONE_CYCLE), 20) >> 1;

    animal->x = x;
    animal->y = y;

    sprite->x = Q_24_8_TO_INT(x) - gCamera.x;
    sprite->y = Q_24_8_TO_INT(y) - gCamera.y;

    if (IS_ANIMAL_OUT_OF_CAM_RANGE(sprite->x, sprite->y)) {
        TaskDestroy(gCurTask);
        return;
    }

    sub_8004558(sprite);
    sub_80051E8(sprite);
}

static void CreateBouncingAnimal(SpawnOptions *init)
{
    struct Task *t
        = TaskCreate(Task_BouncingAnimal, sizeof(BouncingAnimal), 0x2000, 0, NULL);
    BouncingAnimal *animal = TaskGetStructPtr(t);
    Sprite *sprite;
    animal->x = Q_24_8(init->x);
    animal->y = Q_24_8(init->y);
    animal->moveSpeed = Q_24_8(0.00390625);
    animal->fallSpeed = -ANIMAL_BOUNCE_SPEED;
    animal->bouncing = FALSE;
    animal->inAirTimer = 42;

    sprite = &animal->sprite;
    sprite->x = init->x;
    sprite->y = init->y;
    sprite->graphics.dest = (void *)OBJ_VRAM0 + (init->vramOffset * TILE_SIZE_4BPP);
    sprite->unk1A = 0x440;
    sprite->graphics.size = 0;
    sprite->graphics.anim = init->anim;
    sprite->variant = init->variant;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk10 = SPRITE_FLAG_PRIORITY(2);
}

static void Task_BouncingAnimal(void)
{
    BouncingAnimal *animal = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &animal->sprite;
    s32 y;

    animal->fallSpeed += ANIMAL_GRAVITY;
    y = animal->y + animal->fallSpeed;
    animal->y = y;
    animal->x += animal->moveSpeed;

    if (animal->inAirTimer > 0) {
        animal->inAirTimer--;
    } else {
        s32 clampedY = y
            + Q_24_8(sub_801F07C(Q_24_8_TO_INT(animal->y), Q_24_8_TO_INT(animal->x), 1,
                                 8, NULL, sub_801EE64));

        // if hit floor
        if (clampedY <= animal->y) {
            animal->fallSpeed = -ANIMAL_BOUNCE_SPEED;
            animal->y = clampedY;
            if (animal->bouncing == FALSE) {
                animal->moveSpeed = -ANIMAL_BOUNCE_MOVE_SPEED;
            }
            animal->bouncing = TRUE;
        }
    }

    sprite->x = Q_24_8_TO_INT(animal->x) - gCamera.x;
    sprite->y = Q_24_8_TO_INT(animal->y) - gCamera.y;

    if (IS_ANIMAL_OUT_OF_CAM_RANGE(sprite->x, sprite->y)) {
        TaskDestroy(gCurTask);
        return;
    }

    sub_8004558(sprite);
    sub_80051E8(sprite);
}

static void CreateStaticAnimal(SpawnOptions *init)
{
    struct Task *t
        = TaskCreate(Task_StaticAnimalMain, sizeof(StaticAnimal), 0x2000, 0, NULL);
    StaticAnimal *animal = TaskGetStructPtr(t);
    Sprite *sprite;
    animal->x = Q_24_8(init->x);
    animal->y = Q_24_8(init->y);
    // lol
    animal->moveSpeed = 0;

    animal->fallSpeed = -ANIMAL_BOUNCE_SPEED;
    animal->inAirTimer = 42;

    sprite = &animal->sprite;
    sprite->x = init->x;
    sprite->y = init->y;
    sprite->graphics.dest = (void *)OBJ_VRAM0 + (init->vramOffset * TILE_SIZE_4BPP);
    sprite->unk1A = 0x440;
    sprite->graphics.size = 0;
    sprite->graphics.anim = init->anim;
    sprite->variant = init->variant;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 16;
    sprite->focused = 0;
    sprite->unk10 = SPRITE_FLAG_PRIORITY(2);
}

static void Task_StaticAnimalMain(void)
{
    StaticAnimal *animal = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &animal->sprite;
    s32 y;

    animal->fallSpeed += ANIMAL_GRAVITY;
    y = animal->y + animal->fallSpeed;
    animal->y = y;
    animal->x += animal->moveSpeed;

    if (animal->inAirTimer > 0) {
        animal->inAirTimer--;
    } else {
        s32 clampedY = y
            + Q_24_8(sub_801F07C(Q_24_8_TO_INT(animal->y), Q_24_8_TO_INT(animal->x), 1,
                                 8, NULL, sub_801EE64));

        // if collided with floor
        if (clampedY <= animal->y) {
            animal->fallSpeed = 0;
            animal->y = clampedY;
        }
    }

    sprite->x = Q_24_8_TO_INT(animal->x) - gCamera.x;
    sprite->y = Q_24_8_TO_INT(animal->y) - gCamera.y;

    if (IS_ANIMAL_OUT_OF_CAM_RANGE(sprite->x, sprite->y)) {
        TaskDestroy(gCurTask);
        return;
    }

    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void CreateTrappedAnimal(s16 x, s16 y)
{
    SpawnOptions options;
    s8 zone = LEVEL_TO_ZONE(gCurrentLevel);
    s8 type;
    if (zone > ZONE_7) {
        zone = ZONE_7;
    }

    type = gAnimsTrappedAnimals[zone][gTrappedAnimalVariant].type;
    options.vramOffset = gAnimsTrappedAnimals[zone][gTrappedAnimalVariant].vramOffset;
    options.anim = gAnimsTrappedAnimals[zone][gTrappedAnimalVariant].anim;
    options.variant = gAnimsTrappedAnimals[zone][gTrappedAnimalVariant].variant;
    options.x = x;
    options.y = y;

    // gTrappedAnimalVariant %= ANIMAL_VARIANTS_PER_ZONE;
    if (++gTrappedAnimalVariant > (ANIMAL_VARIANTS_PER_ZONE - 1)) {
        gTrappedAnimalVariant = 0;
    }

    sTrappedAnimalSpawnFunctions[type](&options);
}