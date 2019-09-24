using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capgemini.Inventory.Helpers.ValidationAttributes;

namespace Capgemini.Inventory.Entities
{

    public interface IRawMaterialOrderDetail //model class of RawMaterialsOrderdetail
    {
        Guid RawMaterialOrderDetailID { get; set; }
        Guid RawMaterialOrderID { get; set; }
        Guid RawMaterialID { get; set; }
        double RawMaterialUnitPrice { get; set; }
        double RawMaterialQuantity { get; set; }
        double RawMaterialTotalPrice { get; set; }
    }
        public class RawMaterialOrderDetail : IRawMaterialOrderDetail  //model class of RawMaterialOrderdetail
        {
            [Required("RawMaterialOrderDetail ID can't be blank.")]
           public Guid RawMaterialOrderDetailID { get; set; }
            [Required("RawMaterialOrder ID can't be blank.")]
            public Guid RawMaterialOrderID { get; set; }
            [Required("RawMaterial ID can't be blank.")]
            public Guid RawMaterialID { get; set; }

            public double RawMaterialUnitPrice { get; set; }
            public double RawMaterialQuantity { get; set; }
            public double RawMaterialTotalPrice { get; set; }
            
        }
           
    }

