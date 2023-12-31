﻿using Canyon.Game.States.Items;
using Canyon.Game.States.User;
using Canyon.Network.Packets;

namespace Canyon.Game.Sockets.Game.Packets
{
    public sealed class MsgItemInfo : MsgBase<Client>
    {
        public MsgItemInfo(Item item, ItemMode mode = ItemMode.Default)
        {
            if (mode == ItemMode.View)
            {
                Identity = item.PlayerIdentity;
            }
            else
            {
                Identity = item.Identity;
            }

            Itemtype = item.Type;
            Amount = item.Durability;
            AmountLimit = item.MaximumDurability;
            Mode = mode;
            Position = (ushort)item.Position;
            SocketProgress = item.SocketProgress;
            SocketOne = (byte)item.SocketOne;
            SocketTwo = (byte)item.SocketTwo;
            Effect = (byte)item.Effect;

            if (item.GetItemSubType() == 730)
            {
                Plus = (byte)(item.Type % 100);
            }
            else
            {
                Plus = item.Plus;
            }

            Bless = (byte)item.Blessing;
            Enchantment = item.Enchantment;
            Color = (byte)item.Color;
            IsLocked = item.IsLocked() || item.IsUnlocking();
            IsBound = item.IsBound;
            CompositionProgress = item.CompositionProgress;
            Inscribed = item.SyndicateIdentity != 0;
            AntiMonster = item.AntiMonster;
            PackageAmount = (ushort)item.AccumulateNum;
            ActivationTime = item.SaveTime;
            RemainingTime = item.RemainingSeconds;
        }

        public uint Identity { get; set; }
        public uint Itemtype { get; set; }
        public ushort Amount { get; set; }
        public ushort AmountLimit { get; set; }
        public ItemMode Mode { get; set; }
        public ushort Position { get; set; }
        public uint SocketProgress { get; set; }
        public byte SocketOne { get; set; }
        public byte SocketTwo { get; set; }
        public byte Effect { get; set; }
        public byte Plus { get; set; }
        public byte Bless { get; set; }
        public byte Enchantment { get; set; }
        public int AntiMonster { get; set; }
        public bool IsSuspicious { get; set; }
        public byte Color { get; set; }
        public bool IsLocked { get; set; }
        public bool IsBound { get; set; }
        public uint CompositionProgress { get; set; }
        public bool Inscribed { get; set; }
        public int RemainingTime { get; set; }
        public int ActivationTime { get; set; }
        public ushort PackageAmount { get; set; }

        /// <summary>
        ///     Encodes the packet structure defined by this message class into a byte packet
        ///     that can be sent to the client. Invoked automatically by the client's send
        ///     method. Encodes using byte ordering rules interoperable with the game client.
        /// </summary>
        /// <returns>Returns a byte packet of the encoded packet.</returns>
        public override byte[] Encode()
        {
            using var writer = new PacketWriter();
            writer.Write((ushort)PacketType.MsgItemInfo);
            writer.Write(Identity); // 4
            writer.Write(Itemtype); // 8
            writer.Write(Amount); // 12
            writer.Write(AmountLimit); // 14
            writer.Write((ushort)Mode); // 16
            writer.Write(Position); // 18
            writer.Write(SocketProgress); // 20
            writer.Write(SocketOne); // 24
            writer.Write(SocketTwo); // 25
            writer.Write((ushort)0); // 26
            writer.Write(Effect); // 28
            writer.Write(0); // 29
            writer.Write(Plus); // 33
            writer.Write(Bless); // 34
            writer.Write(IsBound); // 35
            writer.Write((int)Enchantment); // 36
            writer.Write(AntiMonster); // 40
            writer.Write(IsSuspicious); // 44
            writer.Write((byte)0); // 45
            writer.Write(IsLocked); // 46
            writer.Write((byte)0); // 47
            writer.Write((int)Color); // 48
            writer.Write(CompositionProgress); // 52
            writer.Write(Inscribed ? 1 : 0); // 56
            writer.Write(RemainingTime);
            writer.Write(ActivationTime);
            writer.Write(PackageAmount);
            return writer.ToArray();
        }

        public enum ItemMode : ushort
        {
            Default = 1,
            Trade = 2,
            Update = 3,
            View = 4,
            Active = 5,
            AddItemReturned = 8,
            Auction = 12
        }
    }
}
