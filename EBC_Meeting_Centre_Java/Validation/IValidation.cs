using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EBC_Meeting_Centre_Tomas_Jerousek.Validation
{
    interface IValidation<T>
    {
        bool Validate(T x);
    }
}
