using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capgemini.Inventory.Helpers.ValidationAttributes;



namespace Capgemini.Inventory.Entities
{
    public interface IRawMaterialOrder
    {
         Guid RawMaterialOrderID { get; set; }
        DateTime RawMaterialOrderDate { get; set; }
        
        Guid SupplierID { get; set; }
        double RawMaterialTotalPrice { get; set; }
        double RawMaterialTotalQuantity { get; set; }
        DateTime CreationDateTime { get; set; }
        DateTime LastmodifiedDateTime { get; set; }
        
    }
    public class RawMaterialOrder : IRawMaterialOrder  //model class of RawMaterialOrder
    {

        //properties


        
        [Required("RawMaterialOrder ID can't be blank.")]
        public Guid RawMaterialOrderID { get; set; }
       public  DateTime RawMaterialOrderDate { get; set; }

        [Required("Supplier ID can't be blank.")]
        public Guid SupplierID { get; set; }
       public double RawMaterialTotalPrice { get; set; }
       public  double RawMaterialTotalQuantity { get; set; }
        public  DateTime CreationDateTime { get; set; }
        public DateTime LastmodifiedDateTime { get; set; }
    }
}