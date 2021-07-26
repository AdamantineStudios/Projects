using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EBC_Meeting_Centre_Tomas_Jerousek.Entities
{
    public abstract class Location
    {
        public string name { get; set; }
        public string code { get; set; }
        public string description { set; get; }

        public Location(string name, string code, string description)
        {
            this.name = name;
            this.code = code;
            this.description = description;
        }

        public Location() { }

        public override string ToString()
        {
            return this.code + " : " + this.name;
        }
    }
}
