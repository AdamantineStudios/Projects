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
    class XMLDeserializer
    {
        public ObservableCollection<T> XMLDeserialization<T>(string path)
        {
            ObservableCollection<T> output = new ObservableCollection<T>();
            XmlSerializer serializer = new XmlSerializer(typeof(ObservableCollection<T>));

            using (StreamReader reader = new StreamReader(path))
            {
                output = serializer.Deserialize(reader) as ObservableCollection<T>;
            }
            return output;
        }
    }
}
