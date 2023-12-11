﻿using Canyon.Database.Entities;
using Canyon.Game.Database;
using Canyon.Game.Services.Managers;
using Canyon.Game.Sockets.Ai.Packets;
using Canyon.Game.Sockets.Game.Packets;
using Canyon.Game.States.Magics;
using Canyon.Game.States.User;
using Canyon.Shared.Mathematics;
using System.Collections.Concurrent;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using static Canyon.Game.Sockets.Game.Packets.MsgAura;
using static Canyon.Game.States.Magics.Magic;

namespace Canyon.Game.States
{
    [StructLayout(LayoutKind.Sequential, Pack = 4, CharSet = CharSet.Ansi, Size = 16)]
    public struct StatusInfoStruct
    {
        public int Status;
        public int Power;
        public int Seconds;
        public int Times;

        public StatusInfoStruct(int status, int power, int secs, int times)
            : this()
        {
            Status = status;
            Power = power;
            Seconds = secs;
            Times = times;
        }
    }

    public sealed class StatusOnce : IStatus
    {
        private static readonly ILogger logger = LogFactory.CreateLogger<StatusOnce>();

        private Role owner;
        private TimeOutMS keep;
        private long autoFlash;
        private TimeOutMS interval;

        public StatusOnce()
        {
            owner = null;
            Identity = 0;
        }

        public StatusOnce(Role pOwner)
        {
            owner = pOwner;
            Identity = 0;
        }

        public int Identity { get; private set; }

        public bool IsValid => keep.IsActive() && !keep.IsTimeOut();

        public int Power { get; set; }

        public DbStatus Model { get; set; }

        public byte Level => Magic?.Level ?? 0;

        public int RemainingTimes => 0;

        public int Time => keep.GetInterval();

        public int RemainingTime => keep.GetRemain() / 1000;

        public bool GetInfo(ref StatusInfoStruct info)
        {
            info.Power = Power;
            info.Seconds = keep.GetRemain() / 1000;
            info.Status = Identity;
            info.Times = 0;

            return IsValid;
        }

        public async Task<bool> ChangeDataAsync(int power, int secs, int times = 0, uint caster = 0U)
        {
            try
            {
                Power = power;
                keep.SetInterval((int)Math.Min(int.MaxValue, (long)secs * 1000));
                keep.Update();

                await StatusSet.SubmitStatusDataAsync(this, owner);

                if (Model != null)
                {
                    Model.Power = power;
                    Model.IntervalTime = (uint)secs;
                    Model.EndTime = (uint)DateTime.Now.AddSeconds(secs).ToUnixTimestamp();
                    await ServerDbContext.SaveAsync(Model);
                }

                if (caster != 0)
                {
                    CasterId = caster;
                }

                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool IncTime(int ms, int limit)
        {
            int nInterval = Math.Min(ms + keep.GetRemain(), limit);
            keep.SetInterval(nInterval);
            return keep.Update();
        }

        public bool ToFlash()
        {
            if (!IsValid)
            {
                return false;
            }

            if (autoFlash == 0 && keep.GetRemain() <= 5000)
            {
                autoFlash = 1;
                return true;
            }

            return false;
        }

        public uint CasterId { get; private set; }

        public bool IsUserCast => CasterId == owner.Identity || CasterId == 0;

        public Magic Magic { get; private set; }

        public async Task OnTimerAsync()
        {
            if (!IsValid)
            {
                return;
            }

            try
            {
                switch (Identity)
                {
                    case StatusSet.LUCKY_DIFFUSE:
                        {
                            if (owner is not Character user)
                                return;

                            if (!interval.ToNextTime(1000))
                                return;

                            await user.ChangeLuckyTimerAsync(3);
                            break;
                        }
                    case StatusSet.LUCKY_ABSORB:
                        {
                            if (owner is not Character user)
                                return;

                            if (!interval.ToNextTime(1000))
                                return;

                            Role sender = user.QueryRole(CasterId);
                            if (sender == null || sender.GetDistance(user) > 3)
                            {
                                keep.Clear(); // cancel
                                return;
                            }

                            await user.ChangeLuckyTimerAsync(1);
                            break;
                        }
                }
            }
            catch (Exception ex)
            {
                logger.LogCritical(ex, "StatusOnce.OnTimerAsync: {Message}", ex.Message);
            }
        }

        public async Task<bool> CreateAsync(Role role, int status, int power, int secs, int times, uint caster = 0,
                                            Magic magic = null, bool save = false)
        {
            owner = role;
            CasterId = caster;
            Identity = status;
            Power = power;
            keep = new TimeOutMS(Math.Min(int.MaxValue, secs * 1000));
            keep.Startup((int)Math.Min((long)secs * 1000, int.MaxValue));
            keep.Update();
            interval = new TimeOutMS(1000);
            interval.Update();
            Magic = magic;

            if (save && owner is Character)
            {
                Model = new DbStatus
                {
                    Status = (uint)status,
                    Power = power,
                    IntervalTime = (uint)secs,
                    LeaveTimes = 0,
                    RemainTime = (uint)secs,
                    EndTime = (uint)DateTime.Now.AddSeconds(secs).ToUnixTimestamp(),
                    OwnerId = owner.Identity,
                    Sort = 0
                };
                await ServerDbContext.SaveAsync(Model);
            }

            return true;
        }
    }

    public sealed class StatusMore : IStatus
    {
        private static readonly ILogger logger = LogFactory.CreateLogger<StatusMore>();

        private Role owner;
        private TimeOut keep;
        private long autoFlash;

        public StatusMore()
        {
            owner = null;
            Identity = 0;
        }

        public StatusMore(Role owner)
        {
            this.owner = owner;
            Identity = 0;
        }

        public int Identity { get; private set; }

        public bool IsValid => RemainingTimes > 0;

        public int Power { get; set; }

        public DbStatus Model { get; set; }

        public byte Level => Magic?.Level ?? 0;

        public int RemainingTimes { get; private set; }

        public int RemainingTime => keep.GetRemain();

        public int Time => keep.GetInterval();

        public bool GetInfo(ref StatusInfoStruct info)
        {
            info.Power = Power;
            info.Seconds = keep.GetRemain();
            info.Status = Identity;
            info.Times = RemainingTimes;

            return IsValid;
        }

        public async Task<bool> ChangeDataAsync(int power, int secs, int times = 0, uint caster = 0U)
        {
            try
            {
                Power = power;
                keep.SetInterval(secs);
                keep.Update();
                CasterId = caster;

                if (times > 0)
                {
                    RemainingTimes = times;
                }

                if (Model != null)
                {
                    Model.Power = power;
                    Model.LeaveTimes = (uint)times;
                    Model.IntervalTime = (uint)secs;
                    Model.EndTime = (uint)DateTime.Now.AddSeconds(secs).ToUnixTimestamp();
                    await ServerDbContext.SaveAsync(Model);
                }

                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool IncTime(int ms, int limit)
        {
            int nInterval = Math.Min(ms + keep.GetRemain(), limit);
            keep.SetInterval(nInterval);
            return keep.Update();
        }

        public bool ToFlash()
        {
            if (!IsValid)
            {
                return false;
            }

            if (autoFlash == 0 && keep.GetRemain() <= 5000)
            {
                autoFlash = 1;
                return true;
            }

            return false;
        }

        public uint CasterId { get; private set; }

        public bool IsUserCast => CasterId == owner.Identity || CasterId == 0;

        public Magic Magic { get; private set; }

        public async Task OnTimerAsync()
        {
            try
            {
                if (!IsValid || !keep.ToNextTime())
                {
                    return;
                }

                if (owner != null)
                {
                    var user = owner as Character;
                    var currentEvent = user?.GetCurrentEvent();
                    var loseLife = 0;
                    switch (Identity)
                    {
                        case StatusSet.POISONED: // poison
                            {
                                if (!owner.IsAlive)
                                    return;

                                loseLife = (int)Calculations.CutOverflow(200, owner.Life - 1);
                                
                                if (currentEvent != null)
                                {
                                    Role attacker = RoleManager.GetRole(CasterId);
                                    await currentEvent.OnBeAttackAsync(attacker, owner, (int)Math.Min(owner.Life, loseLife));
                                }

                                if (loseLife > 0)
                                {
                                    await owner.AddAttributesAsync(ClientUpdateType.Hitpoints, loseLife * -1);

                                    if (user != null)
                                    {
                                        await user.BroadcastTeamLifeAsync();
                                    }
                                }

                                var msg = new MsgMagicEffect
                                {
                                    AttackerIdentity = owner.Identity,
                                    MagicIdentity = MagicData.POISON_MAGIC_TYPE
                                };
                                msg.Append(owner.Identity, loseLife, true);
                                await owner.BroadcastRoomMsgAsync(msg, true);

                                if (!owner.IsAlive)
                                    await owner.BeKillAsync(null);
                                break;
                            }

                        case StatusSet.TOXIC_FOG:
                            {
                                if (!owner.IsAlive)
                                {
                                    RemainingTimes = 1;
                                    break;
                                }

                                loseLife = Calculations.AdjustData((int)owner.Life, Power);
                                if (owner.Life - loseLife <= 0)
                                    loseLife = 0;

                                int percent = 100 - Math.Max(0, Math.Min(100, owner.Detoxication));
                                loseLife = (int)(loseLife * percent / 100d);

                                if (currentEvent != null)
                                {
                                    Role attacker = RoleManager.GetRole(CasterId);
                                    await currentEvent.OnBeAttackAsync(attacker, owner, (int)Math.Min(owner.Life, loseLife));
                                }

                                if (loseLife > 0)
                                {
                                    await owner.AddAttributesAsync(ClientUpdateType.Hitpoints, loseLife * -1);

                                    if (user != null)
                                    {
                                        await user.BroadcastTeamLifeAsync();
                                    }
                                }

                                var msg = new MsgMagicEffect
                                {
                                    AttackerIdentity = owner.Identity,
                                    MagicIdentity = MagicData.POISON_MAGIC_TYPE
                                };
                                msg.Append(owner.Identity, loseLife, true);
                                await owner.Map.BroadcastRoomMsgAsync(owner.X, owner.Y, msg);
                                break;
                            }

                        case StatusSet.SHURIKEN_VORTEX:
                            {
                                if (!owner.IsAlive)
                                {
                                    RemainingTimes = 1;
                                    break;
                                }

                                await owner.ProcessMagicAttackAsync(6010, 0, owner.X, owner.Y);
                                break;
                            }

                        case StatusSet.DRAGON_FLOW:
                            {
                                if (!owner.IsAlive || Magic == null)
                                {
                                    RemainingTimes = 1;
                                    break;
                                }

                                if (user != null)
                                {
                                    await user.AddAttributesAsync(ClientUpdateType.Stamina, Magic.Power);
                                }
                                break;
                            }
                    }

                    RemainingTimes--;
                }
            }
            catch (Exception ex)
            {
                logger.LogCritical(ex, "StatusMore.OnTimerAsync: {Message}", ex.Message);
            }
        }

        ~StatusMore()
        {
            // todo destroy and detach status
        }

        public async Task<bool> CreateAsync(Role role, int status, int power, int secs, int times, uint caster = 0,
                                            Magic magic = null, bool save = false)
        {
            owner = role;
            Identity = status;
            Power = power;
            keep = new TimeOut(secs);
            keep.Update(); // no instant start
            RemainingTimes = times;
            CasterId = caster;
            Magic = magic;

            if (save && owner is Character)
            {
                Model = new DbStatus
                {
                    Status = (uint)status,
                    Power = power,
                    IntervalTime = (uint)secs,
                    LeaveTimes = (uint)times,
                    RemainTime = (uint)secs,
                    EndTime = (uint)DateTime.Now.AddSeconds(secs).ToUnixTimestamp(),
                    OwnerId = owner.Identity,
                    Sort = 0
                };
                await ServerDbContext.SaveAsync(Model);
            }

            return true;
        }
    }

    public sealed class StatusSet
    {
        public const int NONE = 0,
            CRIME = 1,
            POISONED = 2,
            FULL_INVISIBLE = 3,
            FADE = 4,
            START_XP = 5,
            GHOST = 6,
            TEAM_LEADER = 7,
            STAR_OF_ACCURACY = 8,
            SHIELD = 9,
            STIGMA = 10,
            DEAD = 11,
            INVISIBLE = 12,
            UNKNOWN13 = 13,
            UNKNOWN14 = 14,
            RED_NAME = 15,
            BLACK_NAME = 16,
            UNKNOWN17 = 17,
            UNKNOWN18 = 18,
            SUPERMAN = 19,
            REFLECTTYPE_THING = 20,
            DIF_REFLECT_THING = 21,
            FREEZE = 22,
            PARTIALLY_INVISIBLE = 23,
            CYCLONE = 24,
            JUMPING = 25,
            UNKNOWN26 = 26,
            DODGE = 27,
            FLY = 28,
            INTENSIFY = 29,
            UNKNOWN30 = 30,
            LUCKY_DIFFUSE = 31,
            LUCKY_ABSORB = 32,
            CURSED = 33,
            HEAVEN_BLESS = 34,
            TOP_GUILD_LEADER = 35,
            TOP_DEPUTY_LEADER = 36,
            TOP_MONTHLY_PK = 37,
            TOP_WEEKLY_PK = 38,
            TOP_CLASS_WARRIOR = 39,
            TOP_CLASS_TROJAN = 40,
            TOP_CLASS_ARCHER = 41,
            TOP_CLASS_WATER = 42,
            TOP_CLASS_FIRE = 43,
            TOP_CLASS_NINJA = 44,
            POISON_STAR = 45,
            TOXIC_FOG = 46,
            SHURIKEN_VORTEX = 47,
            FATAL_STRIKE = 48,
            ORANGE_HALO_GLOW = 49,
            UNKNOWN50 = 50,
            LOW_VIGOR_UNABLE_TO_JUMP = 51,
            RIDING = 51,
            TOP_SPOUSE = 52,
            ACCELERATED = 53,
            DECELERATED = 54,
            FRIGHTENED = 55,
            HEAVEN_SPARKLE = 56,
            INCREASE_MOVE_SPEED = 57,
            GODLY_SHIELD = 58,
            DIZZY = 59,
            FROZEN = 60,
            CONFUSED = 61,
            UNKNOWN62 = 62,
            UNKNOWN63 = 63,
            UNKNOWN64 = 64,
            WEEKLY_TOP8_PK = 65,
            WEEKLY_TOP2_PK_GOLD = 66,
            WEEKLY_TOP2_PK_BLUE = 67,
            MONTHLY_TOP8_PK = 68,
            MONTHLY_TOP2_PK = 69,
            MONTHLY_TOP3_PK = 70,
            TOP8_FIRE = 71,
            TOP2_FIRE = 72,
            TOP3_FIRE = 73,
            TOP8_WATER = 74,
            TOP2_WATER = 75,
            TOP3_WATER = 76,
            TOP8_NINJA = 77,
            TOP2_NINJA = 78,
            TOP3_NINJA = 79,
            TOP8_WARRIOR = 80,
            TOP2_WARRIOR = 81,
            TOP3_WARRIOR = 82,
            TOP8_TROJAN = 83,
            TOP2_TROJAN = 84,
            TOP3_TROJAN = 85,
            TOP8_ARCHER = 86,
            TOP2_ARCHER = 87,
            TOP3_ARCHER = 88,
            TOP3_SPOUSE_BLUE = 89,
            TOP2_SPOUSE_BLUE = 90,
            TOP3_SPOUSE_YELLOW = 91,
            CONTESTANT = 92,
            CHAIN_BOLT_ACTIVE = 93,
            AZURE_SHIELD = 94,
            AZURE_SHIELD_FADE = 95,
            CARRYING_FLAG = 96,
            UNKNOWN97 = 97,
            TYRANT_AURA_TEAM = 98,
            TYRANT_AURA = 99,
            FEND_AURA_TEAM = 100,
            FEND_AURA = 101,
            METAL_AURA_TEAM = 102,
            METAL_AURA = 103,
            WOOD_AURA_TEAM = 104,
            WOOD_AURA = 105,
            WATER_AURA_TEAM = 106,
            WATER_AURA = 107,
            FIRE_AURA_TEAM = 108,
            FIRE_AURA = 109,
            EARTH_AURA_TEAM = 110,
            EARTH_AURA = 111,
            SOUL_SHACKLE = 112,
            OBLIVION = 113,
            UNKNOWN114 = 114,
            TOP_MONK = 115,
            TOP8_MONK = 116,
            TOP2_MONK = 117,
            TOP3_MONK = 118,
            CTF_FLAG = 119,
            SCURVY_BOMB = 120,
            CANNON_BARRAGE = 121,
            BLACK_BEARDS_RAGE = 122,
            TOP_PIRATE = 123,
            TOP_PIRATE8 = 124,
            TOP_PIRATE2 = 125,
            TOP_PIRATE3 = 126,
            DEFENSIVE_INSTANCE = 127,
            MAGIC_DEFENDER = 129,
            BUFF_PSTRIKE = 133,
            BUFF_MSTRIKE = 134,
            BUFF_IMMUNITY = 135,
            BUFF_BREAK = 136,
            BUFF_COUNTERACTION = 137,
            BUFF_MAX_HEALTH = 138,
            BUFF_PATTACK = 139,
            BUFF_MATTACK = 140,
            BUFF_FINAL_PDAMAGE = 141,
            BUFF_FINAL_MDAMAGE = 142,
            BUFF_FINAL_PDMGREDUCTION = 143,
            BUFF_FINAL_MDMGREDUCTION = 144,
            PATH_OF_SHADOW = 146,
            BLADE_FLURRY = 147,
            KINETIC_SPARK = 148,
            DRAGON_FLOW = 149,
            SUPER_CYCLONE = 151,
            SUPREME_GUILD_YELLOW = 152,
            SUPREME_GUID_BLUE = 153,
            SUPREME_GUILD_UNDER_BLUE = 154,
            TOP_DRAGON_WARRIOR = 155,
            DRAGON_FURY = 159,
            DRAGON_CYCLONE = 160,
            DRAGON_SWING = 161,
            MISTER_CONQUER = 167,
            MISS_CONQUER = 168,
            DESTROYED_STAGE_01 = 169,
            DESTROYED_STAGE_02 = 170,
            DESTROYED_STAGE_03 = 171,
            DESTROYED_STAGE_04 = 172,
            AURORA_LOTUS = 173,
            FLAME_LOTUS = 174;

        public static int GetRealStatus(int status)
        {
            switch (status)
            {
                case 2: return POISONED;
                case 5: return STAR_OF_ACCURACY;
                case 6: return SHIELD;
                case 7: return STIGMA;
                case 13: return SUPERMAN;
                case 17: return PARTIALLY_INVISIBLE;
                case 18: return CYCLONE;
                case 21: return DODGE;
                case 22: return FLY;
                case 23: return INTENSIFY;
                case 25: return LUCKY_DIFFUSE;
                case 29: return TOP_GUILD_LEADER;
                case 30: return TOP_DEPUTY_LEADER;
                case 31: return TOP_MONTHLY_PK;
                case 32: return TOP_WEEKLY_PK;
                case 33: return TOP_CLASS_WARRIOR;
                case 34: return TOP_CLASS_TROJAN;
                case 35: return TOP_CLASS_ARCHER;
                case 36: return TOP_CLASS_WATER;
                case 37: return TOP_CLASS_FIRE;
                case 38: return TOP_CLASS_NINJA;
                case 39: return SHURIKEN_VORTEX;
                case 40: return FATAL_STRIKE;
                case 42: return POISON_STAR;
                case 43: return POISONED;
                case 44: return SHIELD;
                case 47: return RIDING;
                case 49: return ACCELERATED;
                case 50: return DECELERATED;
                case 51: return FRIGHTENED;
                case 52: return HEAVEN_SPARKLE;
                case 53: return INCREASE_MOVE_SPEED;
                case 54: return GODLY_SHIELD;
                case 55: return DIZZY;
                case 56: return FROZEN;
                case 57: return CONFUSED;
                case 88: return CHAIN_BOLT_ACTIVE;
                case 89: return AZURE_SHIELD;
                case 92: return TYRANT_AURA;
                case 94: return FEND_AURA;
                case 96: return METAL_AURA;
                case 98: return WOOD_AURA;
                case 100: return WATER_AURA;
                case 102: return FIRE_AURA;
                case 104: return EARTH_AURA;
                case 106: return SOUL_SHACKLE;
                case 111: return TOP_MONK;
                case 116: return SHIELD;
                case 118: return SCURVY_BOMB;
                case 129: return CANNON_BARRAGE;
                case 120: return BLACK_BEARDS_RAGE;
                case 121: return TOP_PIRATE;
                case 125: return DEFENSIVE_INSTANCE;
                case 126: return MAGIC_DEFENDER;
                case 145: return PATH_OF_SHADOW;
                case 146: return BLADE_FLURRY;
                case 147: return KINETIC_SPARK;
                case 148: return DRAGON_FLOW;
                case 150: return SUPER_CYCLONE;
                case 151: return SUPREME_GUILD_YELLOW;
                case 152: return SUPREME_GUID_BLUE;
                case 153: return SUPREME_GUILD_UNDER_BLUE;
                case 154: return TOP_DRAGON_WARRIOR;
                case 158: return DRAGON_FURY;
                case 159: return DRAGON_CYCLONE;
                case 160: return DRAGON_SWING;
            }
            return status;
        }

        private static readonly ILogger logger = LogFactory.CreateLogger<StatusSet>();

        private readonly Role owner;
        public ConcurrentDictionary<int, IStatus> Status;

        public StatusSet(Role role)
        {
            if (role == null)
            {
                return;
            }

            owner = role;

            Status = new ConcurrentDictionary<int, IStatus>(5, 64);
        }

        private ulong StatusFlag1
        {
            get => owner.StatusFlag1;
            set => owner.StatusFlag1 = value;
        }

        private ulong StatusFlag2
        {
            get => owner.StatusFlag2;
            set => owner.StatusFlag2 = value;
        }

        private ulong StatusFlag3
        {
            get => owner.StatusFlag3;
            set => owner.StatusFlag3 = value;
        }

        public IStatus this[int nKey]
        {
            get
            {
                try
                {
                    return Status.TryGetValue(nKey, out IStatus ret) ? ret : null;
                }
                catch
                {
                    return null;
                }
            }
        }

        public int GetAmount()
        {
            return Status.Count;
        }

        public IStatus GetObjByIndex(int nKey)
        {
            return Status.TryGetValue(nKey, out IStatus ret) ? ret : null;
        }

        public IStatus GetObj(ulong nKey, bool b64 = false)
        {
            return Status.TryGetValue(InvertFlag(nKey, b64), out IStatus ret) ? ret : null;
        }

        public async Task<bool> AddObjAsync(IStatus status)
        {
            var info = new StatusInfoStruct();
            status.GetInfo(ref info);
            if (Status.ContainsKey(info.Status))
            {
                return false; // status already exists
            }

            int flagRef = (info.Status - 1) % 64;
            ulong flag = 1UL << flagRef;
            if (info.Status < 65)
            {
                StatusFlag1 |= flag;
            }
            else if (info.Status < 129)
            {
                StatusFlag2 |= flag;
            }
            else if (info.Status < 193) // this check has been done so we support special types
            {
                StatusFlag3 |= flag;
            }

            Status.TryAdd(info.Status, status);

            await BroadcastNpcMsgAsync(new MsgAiRoleStatusFlag
            {
                Identity = owner.Identity,
                Caster = status.CasterId,
                Duration = status.RemainingTime,
                Steps = status.RemainingTimes,
                Flag = status.Identity
            });

            switch (status.Identity)
            {
                case FRIGHTENED:
                case DIZZY:
                case CONFUSED:
                case FREEZE:
                case FROZEN:
                    {
                        owner.BattleSystem.ResetBattle();
                        await owner.MagicData.AbortMagicAsync(true);
                        break;
                    }
            }

            await SubmitStatusDataAsync(status, owner);

            await owner.SynchroAttributesAsync(ClientUpdateType.StatusFlag, StatusFlag1, StatusFlag2, StatusFlag3, true);
            return true;
        }

        public async Task<bool> DelObjAsync(int flag)
        {
            if (flag > 192)
            {
                return false;
            }

            if (!Status.TryRemove(flag, out IStatus status))
            {
                return false;
            }

            int flagRef = (flag - 1) % 64;
            ulong uFlag = 1UL << flagRef;
            if (flag < 65)
            {
                StatusFlag1 &= ~uFlag;
            }
            else if (flag < 129)
            {
                StatusFlag2 &= ~uFlag;
            }
            else if (flag < 193)
            {
                StatusFlag3 &= ~uFlag;
            }

            if (status?.Model != null)
            {
                await ServerDbContext.DeleteAsync(status.Model);
            }

            await BroadcastNpcMsgAsync(new MsgAiRoleStatusFlag
            {
                Identity = owner.Identity,
                Flag = flag,
                Mode = 1
            });
            await owner.SynchroAttributesAsync(ClientUpdateType.StatusFlag, StatusFlag1, StatusFlag2, StatusFlag3, true);

            AuraType auraType = 0;
            switch (status.Identity)
            {
                case TYRANT_AURA:
                    {
                        auraType = AuraType.Tyrant;
                        break;
                    }
                case FEND_AURA:
                    {
                        auraType = AuraType.Fend;
                        break;
                    }
                case WATER_AURA:
                    {
                        auraType = AuraType.Water;
                        break;
                    }
                case FIRE_AURA:
                    {
                        auraType = AuraType.Fire;
                        break;
                    }
                case METAL_AURA:
                    {
                        auraType = AuraType.Metal;
                        break;
                    }
                case WOOD_AURA:
                    {
                        auraType = AuraType.Wood;
                        break;
                    }
                case EARTH_AURA:
                    {
                        auraType = AuraType.Earth;
                        break;
                    }
                case MAGIC_DEFENDER:
                    {
                        auraType = AuraType.MagicDefender;
                        break;
                    }
            }

            switch (status.Identity)
            {
                case ACCELERATED:
                case DECELERATED:
                case FRIGHTENED:
                case HEAVEN_SPARKLE:
                case INCREASE_MOVE_SPEED:
                case GODLY_SHIELD:
                case DIZZY:
                case FROZEN:
                case CONFUSED:
                    {
                        MsgRaceTrackStatus msg = new()
                        {
                            Identity = owner.Identity,
                            Effects = new List<MsgRaceTrackStatus.PropEffects>
                            {
                                new MsgRaceTrackStatus.PropEffects
                                {
                                    Attribute = (AttrUpdateType)(status.Identity - 1),
                                    Active = 0,
                                    Amount = 0,
                                    Display = 0,
                                    Time = 0
                                }
                            }
                        };
                        await owner.SendAsync(msg);
                        break;
                    }

                case TYRANT_AURA:
                case FEND_AURA:
                case WATER_AURA:
                case FIRE_AURA:
                case METAL_AURA:
                case WOOD_AURA:
                case EARTH_AURA:
                case MAGIC_DEFENDER:
                    {
                        MsgAura aura = new()
                        {
                            Action = AuraAction.Detach,
                            Aura = auraType,
                            Identity = status.CasterId,
                            Level = status.Level,
                            Power0 = status.Power
                        };
                        await owner.SendAsync(aura);

                        if (status.Identity >= TYRANT_AURA_TEAM
                            && status.Identity <= EARTH_AURA)
                        {
                            await owner.DetachStatusAsync(status.Identity - 1);
                        }
                        break;
                    }

                case SOUL_SHACKLE:
                    {
                        await owner.SynchroAttributesAsync(ClientUpdateType.SoulShackleTimer, 111u, 0);
                        break;
                    }

                case OBLIVION:
                    {
                        if (owner is Character user)
                        {
                            await user.AwardOblivionExperienceAsync();
                        }
                        break;
                    }

                case PATH_OF_SHADOW:
                    {
                        await owner.DetachStatusAsync(KINETIC_SPARK);
                        break;
                    }
            }
            return true;
        }

        public static async Task SubmitStatusDataAsync(IStatus status, Role role)
        {
            AuraType auraType = 0;
            switch (status.Identity)
            {
                case TYRANT_AURA:
                    {
                        auraType = AuraType.Tyrant;
                        break;
                    }
                case FEND_AURA:
                    {
                        auraType = AuraType.Fend;
                        break;
                    }
                case WATER_AURA:
                    {
                        auraType = AuraType.Water;
                        break;
                    }
                case FIRE_AURA:
                    {
                        auraType = AuraType.Fire;
                        break;
                    }
                case METAL_AURA:
                    {
                        auraType = AuraType.Metal;
                        break;
                    }
                case WOOD_AURA:
                    {
                        auraType = AuraType.Wood;
                        break;
                    }
                case EARTH_AURA:
                    {
                        auraType = AuraType.Earth;
                        break;
                    }
                case MAGIC_DEFENDER:
                    {
                        auraType = AuraType.MagicDefender;
                        break;
                    }
            }

            switch (status.Identity)
            {
                case ACCELERATED:
                case DECELERATED:
                case FRIGHTENED:
                case HEAVEN_SPARKLE:
                case INCREASE_MOVE_SPEED:
                case GODLY_SHIELD:
                case DIZZY:
                case FROZEN:
                case CONFUSED:
                    {
                        int active = 1 << 8; // display icon
                        int power = status.Power;
                        AttrUpdateType statusId = (AttrUpdateType)(status.Identity - 1);
                        if (status.Identity == DECELERATED)
                        {
                            power *= -1;
                            active |= 0x2; // apply slow
                        }
                        else if (status.Identity != ACCELERATED)
                        {
                            power = 0;
                        }

                        MsgRaceTrackStatus msg = new()
                        {
                            Identity = role.Identity,
                            Effects = new List<MsgRaceTrackStatus.PropEffects>
                            {
                                new MsgRaceTrackStatus.PropEffects
                                {
                                    Attribute = statusId,
                                    Active = active,
                                    Amount = power,
                                    Display = power,
                                    Time = status.RemainingTime
                                }
                            }
                        };
                        await role.SendAsync(msg);
                        break;
                    }

                case TYRANT_AURA:
                case FEND_AURA:
                case WATER_AURA:
                case FIRE_AURA:
                case METAL_AURA:
                case WOOD_AURA:
                case EARTH_AURA:
                    {
                        if (role is Character user)
                        {
                            int power = status.Power;
                            MsgAura aura = new()
                            {
                                Action = AuraAction.Attach,
                                Aura = auraType,
                                Identity = status.CasterId,
                                Level = status.Level,
                                Power0 = 30,
                                Power1 = power
                            };
                            await user.SendAsync(aura);
                            if (status.IsUserCast)
                            {
                                await user.AttachStatusAsync(status.Identity - 1, status.Power, status.Time, status.RemainingTimes, status.Magic);
                            }
                        }
                        break;
                    }
                case MAGIC_DEFENDER:
                    {
                        await role.SynchroAttributesAsync(ClientUpdateType.AzureShield, (uint)(status.Time / 1000), 0x80, status.Level, (uint)status.Power);
                        break;
                    }

                case SOUL_SHACKLE:
                    {
                        await role.SynchroAttributesAsync(ClientUpdateType.SoulShackleTimer, (uint)(status.Time / 1000), 111u, 0, 0);
                        break;
                    }

                case AZURE_SHIELD:
                    {
                        await role.SynchroAttributesAsync(ClientUpdateType.AzureShield, (uint)(status.Time / 1000), 93u, status.Level, (uint)status.Power);
                        break;
                    }
            }
        }

        /// <summary>
        ///     Gotta check if there is a faster way to do this.
        /// </summary>
        /// <param name="flag">The flag that will be checked.</param>
        /// <param name="b64">If it's a effect 2 flag, you should set this true.</param>
        /// <param name="b128">If it's a effect 3 flag, you should set this true.</param>
        /// <returns></returns>
        public static int InvertFlag(ulong flag, bool b64 = false, bool b128 = false)
        {
            ulong inv = flag;
            int ret = -1;
            for (var i = 0; inv > 1; i++)
            {
                inv = flag >> i;
                ret++;
            }

            return !b64 ? ret : !b128 ? ret + 64 : ret + 128;
        }

        public async Task SendAllStatusAsync()
        {
            if (owner is Character)
            {
                await owner.SynchroAttributesAsync(ClientUpdateType.StatusFlag, StatusFlag1, StatusFlag2, StatusFlag3, true);
            }
        }

        public static ulong GetFlag(int status)
        {
            return 1UL << (status - 1);
        }
    }

    public interface IStatus
    {
        /// <summary>
        ///     This method will get the status id.
        /// </summary>
        int Identity { get; }

        /// <summary>
        ///     This method will check if the status still valid and running.
        /// </summary>
        bool IsValid { get; }

        /// <summary>
        ///     This method will return the power of the status. This wont make percentage checks. The value is a short.
        /// </summary>
        int Power { get; set; }

        int Time { get; }

        int RemainingTimes { get; }

        int RemainingTime { get; }
        Magic Magic { get; }
        byte Level => Magic?.Level ?? 0;
        uint CasterId { get; }
        bool IsUserCast { get; }

        /// <summary>
        ///     This method will get the status information into another param.
        /// </summary>
        /// <param name="info">The structure that will be filled with the information.</param>
        bool GetInfo(ref StatusInfoStruct info);

        /// <summary>
        ///     This method will override the old values from the status.
        /// </summary>
        /// <param name="power">The new power of the status.</param>
        /// <param name="secs">The remaining time to the status.</param>
        /// <param name="times">How many times the status will appear. If StatusMore.</param>
        /// <param name="caster">The identity of the caster.</param>
        Task<bool> ChangeDataAsync(int power, int secs, int times = 0, uint caster = 0);

        bool IncTime(int ms, int limit);
        bool ToFlash();
        Task OnTimerAsync();

        DbStatus Model { get; set; }
    }
}
