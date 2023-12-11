﻿using Canyon.Database.Entities;

namespace Canyon.Ai.Database.Repositories
{
    public static class GeneratorRepository
    {
        public static async Task<List<DbGenerator>> GetAsync()
        {
            await using var context = new ServerDbContext();
            return context.Generator.ToList();
        }
    }
}
