using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EBC_Meeting_Centre_Tomas_Jerousek.Entities
{
    public class Reservation
    {
        public MeetingRoom meetingRoom { get; set; }
        public DateTime reservationDate { get; set; }
        public DateTime timeFrom { get; set; }
        public DateTime timeTo { get; set; }

        public int expectedPersonCount { get; set; }
        public string customer { get; set; }
        public bool videoConference { get; set; }
        public string note { get; set; }

        public Reservation(MeetingRoom meetingRoom, DateTime reservationDate, DateTime timeFrom, DateTime timeTo, int expectedPersonCount, string customer, bool videoConference, string note)
        {
            this.meetingRoom = meetingRoom;
            this.reservationDate = reservationDate;
            this.timeFrom = timeFrom;
            this.timeTo = timeTo;
            this.expectedPersonCount = expectedPersonCount;
            this.customer = customer;
            this.videoConference = videoConference;
            this.note = note;
        }

        public Reservation() { }

        public override string ToString()
        {
            return timeFrom.Hour.ToString("D2") + " : " + timeFrom.Minute.ToString("D2") + " - " + timeTo.Hour.ToString("D2") + " : " + timeTo.Minute.ToString("D2");

        }

    }
}
