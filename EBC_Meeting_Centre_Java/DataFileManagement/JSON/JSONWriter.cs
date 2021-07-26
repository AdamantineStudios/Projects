using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using System.IO;
using System.Web.Script.Serialization;
using Newtonsoft.Json.Linq;
using EBC_Meeting_Centre_Tomas_Jerousek.Entities;

namespace EBC_Meeting_Centre_Tomas_Jerousek.DataFileManagement.JSON
{
    class JSONWriter
    {
        private const string schema = "PLUS4U.EBC.MCS.MeetingRoom_Schedule_1.0";
        private const string uri = "ues:UCL-BT:UCL.INF/DEMO_REZERVACE:EBC.MCS.DEMO/MR001/SCHEDULE";
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        List<MeetingRoom> reservedRooms = new List<MeetingRoom>();

        public string BuildJSON(ObservableCollection<Reservation> reservations, List<MeetingRoom> meetingRooms)
        {
            foreach (Reservation reservation in reservations)
            {
                reservedRooms.Add(meetingRooms.Find(search => search.code == reservation.meetingRoom.code));
            }
            JObject output =
                new JObject(
                    new JProperty("schema", schema),
                    new JProperty("URI", uri),
                    new JProperty("data",
                    new JArray(
                        from meetinRoom in reservedRooms
                        orderby meetinRoom.meetingRoomCode
                        select new JObject(
                            from newReservation in reservations
                            orderby newReservation.reservationDate where newReservation.meetingRoom.code == meetinRoom.code
                            select new JProperty(newReservation.reservationDate.ToString("dd.MM.yyyy"),
                            new JArray(
                                from reservationDate in reservations
                                where reservationDate.reservationDate.Date == newReservation.reservationDate.Date && reservationDate.meetingRoom.code == newReservation.meetingRoom.code
                                select new JObject(
                                    new JProperty("from", reservationDate.timeFrom.ToString("HH:mm")),
                                    new JProperty("to", reservationDate.timeTo.ToString("HH:mm")),
                                    new JProperty("expectedPersonCount", reservationDate.expectedPersonCount),
                                    new JProperty("customer", reservationDate.customer),
                                    new JProperty("videoConference", reservationDate.videoConference),
                                    new JProperty("note", reservationDate.note)
                                    )
                                ))
                            )
                        )
                    ));
            return output.ToString();
        }

        public void SaveJSON(ObservableCollection<Reservation> reservations, List<MeetingRoom> meetingRooms, string path)
        {
            string json = BuildJSON(reservations, meetingRooms);
            using (StreamWriter writer = new StreamWriter(path))
            {
                writer.Write(json);
            }
        }
    }
}
