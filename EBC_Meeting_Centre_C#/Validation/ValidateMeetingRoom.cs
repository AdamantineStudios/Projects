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
    class ValidateMeetingRoom : ValidateLocation, IValidation<MeetingRoom>
    {
        protected const int minCapacity = 1;
        protected const int maxCapacity = 100;

        public bool Validate(MeetingRoom meetingRoom)
        {
            string errors = BasicValidation(meetingRoom);
            if(meetingRoom.capacity < minCapacity || meetingRoom.capacity > maxCapacity)
            {
                errors += String.Format("Your capacity has to be in range of {0} - {1}.", minCapacity, maxCapacity);
            }
            if (!string.IsNullOrEmpty(errors))
            {
                throw new ExceptionValidation(errors);
            }
            return true;
        }
    }
}
