using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EBC_Meeting_Centre_Tomas_Jerousek.Entities;

namespace EBC_Meeting_Centre_Tomas_Jerousek.Comparers
{
    class MeetingCentreComparer : IEqualityComparer<MeetingCentre>
    {
        public bool Equals(MeetingCentre x, MeetingCentre y)
        {
            return x.code == y.code && x.description == y.description && x.name == y.name;
        }

        public int GetHashCode(MeetingCentre obj)
        {
            int code = 53;

            code = code * 19 + obj.name.GetHashCode();
            code = code * 19 + obj.description.GetHashCode();
            code = code * 19 + obj.code.GetHashCode();
            return code;
        }
    }
}
