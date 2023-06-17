#include "global.h"
#include "game/entity.h"
#include "game/enemies/projectiles.h"
#include "malloc_vram.h"
#include "task.h"
#include "trig.h"

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s32 x;
    /* 0x34 */ s32 y;
    /* 0x38 */ s16 velocityX;
    /* 0x3A */ s16 velocityY;
} ProjectileA; /* size: 0x3C */

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ Vec2_32 positions[4];
    /* 0x50 */ s16 velocities[4][2];
    /* 0x60 */ u8 count;
    /* 0x61 */ bool8 isActive[4];
} ProjectileB; /* size: 0x68 */

void Task_805102C(void);
void Task_80510B0(void);
void Task_DestroyProjectileTask(void);
void TaskDestructor_80511EC(struct Task *);
void TaskDestructor_8051200(struct Task *);

void CreateProjectile(ProjInit *init)
{
    struct Task *t = TaskCreate(Task_805102C, sizeof(ProjectileA), 0x4000, 0,
                                TaskDestructor_80511EC);
    ProjectileA *proj = TaskGetStructPtr(t);
    s32 velocityX, velocityY;

    proj->x = init->x;
    proj->y = init->y;

    velocityX = (COS(init->rot) * init->speed) >> 14;
    proj->velocityX = velocityX;

    velocityY = (SIN(init->rot) * init->speed) >> 14;
    proj->velocityY = velocityY;

    proj->s.graphics.dest = VramMalloc(init->numTiles);
    proj->s.graphics.anim = init->anim;
    proj->s.variant = init->variant;
    proj->s.unk1A = 0x200;
    proj->s.graphics.size = 0;
    proj->s.x = 0;
    proj->s.y = 0;
    proj->s.unk14 = 0;
    proj->s.unk1C = 0;
    proj->s.unk21 = 0xFF;
    proj->s.unk22 = 0x10;
    proj->s.palId = 0;
    proj->s.unk28[0].unk0 = -1;
    proj->s.unk10 = SPRITE_FLAG(PRIORITY, 1);
}

void CreateSeveralProjectiles(ProjInit *init, u8 count, s8 spreadAngle)
{
    struct Task *t = TaskCreate(Task_80510B0, sizeof(ProjectileB), 0x4000, 0,
                                TaskDestructor_8051200);
    ProjectileB *proj = TaskGetStructPtr(t);
    u8 i;

    if (count > 4)
        count = 4;

    proj->count = count;

    for (i = 0; i < count; i++) {
        s16 rot;
        proj->positions[i].x = init->x;
        proj->positions[i].y = init->y;

        proj->velocities[i][0] = rot = ((i * spreadAngle) + init->rot) & ONE_CYCLE;

        proj->velocities[i][0] = (COS(rot) * init->speed) >> 14;
        proj->velocities[i][1] = (SIN(rot) * init->speed) >> 14;

        proj->isActive[i] = TRUE;
    }

    proj->s.graphics.dest = VramMalloc(init->numTiles);
    proj->s.graphics.anim = init->anim;
    proj->s.variant = init->variant;
    proj->s.unk1A = 0x200;
    proj->s.graphics.size = 0;
    proj->s.x = 0;
    proj->s.y = 0;
    proj->s.unk14 = 0;
    proj->s.unk1C = 0;
    proj->s.unk21 = 0xFF;
    proj->s.unk22 = 0x10;
    proj->s.palId = 0;
    proj->s.unk28->unk0 = -1;
    proj->s.unk10 = SPRITE_FLAG(PRIORITY, 1);
}

void Task_805102C(void)
{
    ProjectileA *proj = TaskGetStructPtr(gCurTask);
    Sprite *s = &proj->s;

    proj->x += proj->velocityX;
    proj->y += proj->velocityY;

    s->x = Q_24_8_TO_INT(proj->x) - gCamera.x;
    s->y = Q_24_8_TO_INT(proj->y) - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        TaskDestroy(gCurTask);
    } else {
        sub_800C84C(s, Q_24_8_TO_INT(proj->x), Q_24_8_TO_INT(proj->y));
        sub_8004558(s);
        sub_80051E8(s);
    }
}

void Task_80510B0(void)
{
    ProjectileB *proj = TaskGetStructPtr(gCurTask);
    Sprite *s = &proj->s;
    u8 count, i;

    sub_8004558(s);

    count = 0;
    for (i = 0; i < proj->count; i++) {
        if (!proj->isActive[i])
            continue;

        count++;

        proj->positions[i].x += proj->velocities[i][0];
        proj->positions[i].y += proj->velocities[i][1];

        s->x = Q_24_8_TO_INT(proj->positions[i].x) - gCamera.x;
        s->y = Q_24_8_TO_INT(proj->positions[i].y) - gCamera.y;

        if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
            proj->isActive[i] = FALSE;
        }

        sub_800C84C(s, Q_24_8_TO_INT(proj->positions[i].x),
                    Q_24_8_TO_INT(proj->positions[i].y));
        sub_80051E8(s);
    }

    if (count == 0) {
        gCurTask->main = Task_DestroyProjectileTask;
    }
}

void Task_DestroyProjectileTask(void) { TaskDestroy(gCurTask); }

void TaskDestructor_80511EC(struct Task *t)
{
    ProjectileA *proj = TaskGetStructPtr(t);
    VramFree(proj->s.graphics.dest);
}

void TaskDestructor_8051200(struct Task *t)
{
    ProjectileB *proj = TaskGetStructPtr(t);
    VramFree(proj->s.graphics.dest);
}