﻿using Canyon.Game.States.Mails;
using Canyon.Network.Packets.Piglet;

namespace Canyon.Game.Sockets.Piglet.Packets
{
    public sealed class MsgPigletUserMassMail : MsgPigletUserMassMail<PigletActor>
    {
        public override async Task ProcessAsync(PigletActor client)
        {
            foreach (var user in Data.Users)
            {
                await MailBox.SendAsync(user,
                    Data.Mail.SenderName, 
                    Data.Mail.Subject, 
                    Data.Mail.Content, 
                    (uint)(UnixTimestamp.Now + Data.Mail.ExpirationSeconds),
                    (uint)Data.Mail.Money, 
                    Data.Mail.ConquerPoints, 
                    Data.Mail.IsMono, 
                    Data.Mail.ItemId, 
                    Data.Mail.ItemType, 
                    Data.Mail.ActionId);
            }
        }
    }
}
