using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;
using EBC_Meeting_Centre_Tomas_Jerousek.Entities;
using EBC_Meeting_Centre_Tomas_Jerousek.Exceptions;

namespace EBC_Meeting_Centre_Tomas_Jerousek.Validation
{
    class ValidateMeetingCentre : ValidateLocation, IValidation<MeetingCentre>
    {
        
        public bool Validate(MeetingCentre meetingCentre)
        {
            string errors = BasicValidation(meetingCentre);
            if (!string.IsNullOrEmpty(errors))
            {
                throw new ExceptionValidation(errors);
            }
            return true;
        }
    }
}
