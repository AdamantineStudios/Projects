using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.ObjectModel;
using EBC_Meeting_Centre_Tomas_Jerousek.Entities;
using System.Xml.Serialization;
using System.IO;
using System.Threading.Tasks;

namespace EBC_Meeting_Centre_Tomas_Jerousek.DataFileManagement.XML
{
    class XMLSerializer
    {
        public const string path = "reservations.xml";

        public void XMLSerialization<T>(ObservableCollection<T> reservations)
        {
            XmlSerializer xmlserializer = new XmlSerializer(typeof(ObservableCollection<T>));
            using (StreamWriter writer = new StreamWriter(path))
            {
                xmlserializer.Serialize(writer, reservations);
            }

        }
    }
}
