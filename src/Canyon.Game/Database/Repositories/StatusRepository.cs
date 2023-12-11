﻿using Canyon.Database.Entities;
using Microsoft.EntityFrameworkCore;

namespace Canyon.Game.Database.Repositories
{
    public static class StatusRepository
    {
        public static async Task<List<DbStatus>> GetAsync(uint idUser)
        {
            await using var db = new ServerDbContext();
            return await db.Status.Where(x => x.OwnerId == idUser).ToListAsync();
        }
    }
}
