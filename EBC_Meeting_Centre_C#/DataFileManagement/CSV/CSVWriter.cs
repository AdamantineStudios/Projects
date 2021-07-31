using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EBC_Meeting_Centre_Tomas_Jerousek.Entities;

namespace EBC_Meeting_Centre_Tomas_Jerousek.DataFileManagement.CSV
{
    class CSVWriter
    {
        public const string path = "CSVData.csv";
        private const char separator = ',';

        public void SaveData(List<MeetingCentre> meetingCentres, List<MeetingRoom> meetingRooms)
        {
            using (StreamWriter writer = new StreamWriter(new FileStream(path, FileMode.Create, FileAccess.Write)))
            {
                writer.WriteLine("MEETING_CENTRES");
                foreach(MeetingCentre centre in meetingCentres)
                {
                    writer.WriteLine(centre.name + separator + centre.code + separator + centre.description);
                }

                writer.WriteLine("MEETING_ROOMS");

                foreach(MeetingRoom room in meetingRooms)
                {
                    writer.WriteLine(room.name + separator + room.code + separator + room.description + separator + room.capacity + separator + room.isVideoConference + separator + room.meetingRoomCode);
                }
            }
        }
    }
}
