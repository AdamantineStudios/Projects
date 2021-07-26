using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EBC_Meeting_Centre_Tomas_Jerousek.Entities;

namespace EBC_Meeting_Centre_Tomas_Jerousek.Comparers
{
    class MeetingRoomComparer : IEqualityComparer<MeetingRoom>
    {
        public bool Equals(MeetingRoom x, MeetingRoom y)
        {
            return x.code == y.code && x.capacity == y.capacity &&
                x.description == y.description && x.isVideoConference == y.isVideoConference&&
                x.meetingRoomCode == y.meetingRoomCode && x.name == y.name;
        }

        public int GetHashCode(MeetingRoom obj)
        {
            int code = 53;
            code = code * 19 + obj.name.GetHashCode();
            code = code * 19 + obj.description.GetHashCode();
            code = code * 19 + obj.code.GetHashCode();
            code = code * 19 + obj.capacity.GetHashCode();
            code = code * 19 + obj.isVideoConference.GetHashCode();
            code = code * 19 + obj.meetingRoomCode.GetHashCode();
            return code;
        }


    }
}
