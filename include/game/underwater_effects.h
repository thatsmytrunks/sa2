#ifndef GUARD_GAME_2_H
#define GUARD_GAME_2_H

struct Task *SpawnDrowningCountdownNum(Player *p, s32 countdown);
struct Task *SpawnAirBubbles(s32 p0, s32 p1, s32 p2, s32 p3);
struct Task *SpawnBubblesAfterDrowning(Player *p);
bool32 RandomlySpawnAirBubbles(Player *p);

#endif // GUARD_GAME_2_H