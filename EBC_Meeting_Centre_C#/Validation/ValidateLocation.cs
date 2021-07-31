using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;
using EBC_Meeting_Centre_Tomas_Jerousek.Entities;

namespace EBC_Meeting_Centre_Tomas_Jerousek.Validation
{
    abstract class ValidateLocation
    {
        protected const int maxNameLength = 100;
        protected const int maxCodeLength = 50;
        protected const int maxDescLength = 300;
        protected const int minDescLength = 10;
        protected const int minCodeLength = 5; 
        protected const int minNameLength = 2;
        //special code na unikatni klice
        protected const string code = @"^[a-zA-Z0-9.\-:_]*$";
        
        protected Regex regex = new Regex(code);


        //Overovani zadanych hodnot uzivatelem a pripadne upozorneni
        protected string BasicValidation(Location x)
        {
            string errorsOnValidation = String.Empty;
            if(string.IsNullOrEmpty(x.code) || string.IsNullOrEmpty(x.description) || string.IsNullOrEmpty(x.name))
            {
                errorsOnValidation += "Every field have to be filled!\n";
            }
            if(x.name.Length < minNameLength || x.name.Length > maxNameLength)
            {
                errorsOnValidation += String.Format("Your name length has to be in range of {0} - {1} characters", minNameLength, maxNameLength);
            }
            if(x.code.Length < minCodeLength || x.code.Length > maxCodeLength)
            {
                errorsOnValidation += String.Format("Code has to be in range of {0} - {1}", minCodeLength, maxCodeLength);
            }
            if (!regex.IsMatch(x.code))
            {
                errorsOnValidation += "Your code contains invalid characters!\n";
            }
            return errorsOnValidation;
        }

    }
}
