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
    class ValidateReservation : IValidation<Reservation>
    {
        protected const int minExpectedPersonCount = 1;
        protected const int minCustomerNameLength = 2;
        protected const int maxCustomerNameLength = 100;
        protected const int maxNoteLength = 300;
        public bool Validate(Reservation reservation){
            string errors = "";
            if(reservation.expectedPersonCount < minExpectedPersonCount || reservation.expectedPersonCount > reservation.meetingRoom.capacity)
            {
                errors += String.Format("Persons count must be in range of: {0} - {1}", minExpectedPersonCount, reservation.meetingRoom.capacity);
            }
            if(reservation.customer.Length > maxCustomerNameLength || reservation.customer.Length < minCustomerNameLength)
            {
                errors += String.Format("Your name has to be in range of {0} - {1} characters.", minCustomerNameLength, maxCustomerNameLength);
            }
            if(reservation.note.Length > maxNoteLength)
            {
                errors += String.Format("Your note has to contain maximum of: {0} characters.", maxNoteLength);

            }
            if (!string.IsNullOrEmpty(errors))
            {
                throw new ExceptionValidation(errors);
            }
            return true;
        }
    }
}
