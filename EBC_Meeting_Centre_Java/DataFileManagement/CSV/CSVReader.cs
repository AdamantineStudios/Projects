using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EBC_Meeting_Centre_Tomas_Jerousek.Entities;

namespace EBC_Meeting_Centre_Tomas_Jerousek.DataFileManagement.CSV
{
    //Classa ktera nam importuje csv file pouzita s jednim , separatorem i presto ze v  csv file je oddeleno ",,,,," toto funguje v obou pripadech, pro jistotu sem vlozil do 
    //projektovych souboru i upravene csv
    class CSVReader
    {
        private const char separator = ',';

        public void ParseCSV(string path, List<MeetingRoom> meetingRooms, List<MeetingCentre> meetingCentres)
        {
            using (StreamReader reader = new StreamReader(path))
            {
                string header = reader.ReadLine();
                while (!reader.EndOfStream)
                {
                    string row = reader.ReadLine();
                    string[] values = row.Split(separator);
                    if (row.Contains("MEETING_ROOMS"))
                    {
                        header = row;
                    }
                    else if(header.Contains("MEETING_CENTRES"))
                    {
                        meetingCentres.Add(new MeetingCentre(values[0], values[1], values[2]));
                    }
                    else
                    {
                        meetingRooms.Add(new MeetingRoom(values[0], values[1], values[2], values[4] == "YES" ? true : false, values[5], Convert.ToInt32(values[3])));
                    }

                }
                
            }
        }
    }
}
