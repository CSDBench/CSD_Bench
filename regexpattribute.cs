using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Capgemini.Inventory.Helpers.ValidationAttributes
{
    /// <summary>
    /// Represents that the property is mandatory (can't be blank or null or 0)
    /// </summary>
    public class RegexpAttribute : Attribute
    {
        public string ErrorMessage { get; set; }

        /* Constructor */
        public RegexpAttribute() : base()
        {
        }

        public RegexpAttribute(string errorMessage) : base()
        {
            ErrorMessage = errorMessage;
        }
    }
}



