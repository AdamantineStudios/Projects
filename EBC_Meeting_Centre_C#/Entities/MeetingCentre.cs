using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EBC_Meeting_Centre_Tomas_Jerousek.Entities
{
    public class MeetingCentre : Location
    {
        public MeetingCentre(string name, string code, string description) : base(name, code, description)
        {

        }
    }
}
