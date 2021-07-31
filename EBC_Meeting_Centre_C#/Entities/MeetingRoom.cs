using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EBC_Meeting_Centre_Tomas_Jerousek.Entities
{
    public class MeetingRoom : Location
    {
        public bool isVideoConference { get; set; }
        public string meetingRoomCode { get; set; }

        public int capacity { get; set; }

        public MeetingRoom(string name, string code, string description, bool isVideoConference, string meetingRoomCode, int capacity) : base(name, code, description)
        {
            this.isVideoConference = isVideoConference;
            this.meetingRoomCode = meetingRoomCode;
            this.capacity = capacity;
        }

        public MeetingRoom() { }
    }
}
