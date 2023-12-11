﻿using Canyon.Database.Entities;

namespace Canyon.Ai.States
{
    public sealed class MonsterRatio
    {
        private readonly DbMonstertype monstertype;

        public MonsterRatio(DbMonstertype monstertype)
        {
            this.monstertype = monstertype;
        }

        public int Ratio { get; init; }
        public DbMonstertype MonsterType => monstertype;
    }
}
