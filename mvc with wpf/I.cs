using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Inventory.WCFService
{
    // Developed by Rohit Kumar (Group 4)
    // Creation Date : 2019/10/30
    // Last Modified Date : 

    //Interface for RawMaterialsService class
    [ServiceContract]
    public interface IRawMaterialOrderService
    {
        [OperationContract]
        List<RawMaterialOrderDataContract> GetAllRawMaterialOrder();
    }

    //RawMaterialDataContract class
    [DataContract]
    public class RawMaterialOrderDataContract
    {
        //Data members
        [DataMember]
        public Guid RawMaterialOrderID { get; set; }

        [DataMember]
        public string RawMaterialName { get; set; }
        [DataMember]
        public Guid SupplierID { get; set; }

        [DataMember]
        public double RawMaterialTotalQuantity { get; set; }

        [DataMember]
        public double RawMaterialTotalPrice { get; set; }
        [DataMember]
        public string SupplierName { get; internal set; }
    }
}
