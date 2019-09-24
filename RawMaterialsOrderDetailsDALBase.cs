using System;
using System.Collections.Generic;
using System.IO;
using Capgemini.Inventory.Entities;
using Newtonsoft.Json;

namespace Capgemini.Inventory.Contracts.DALContracts
{
    /// <summary>
    /// This abstract class acts as a base for  RawMaterialorderdetailsDALclass
    /// </summary>
    public abstract class RawMaterialOrderDetailDALBase
    {
        
        protected static List<RawMaterialOrderDetail> RawMaterialorderlist = new List<RawMaterialOrderDetail>();
        private static string fileName = "RawMaterialOrderDetails.json";

        //Methods for CRUD operations


        public abstract bool AddRawMaterialOrderDetailDAL(RawMaterialOrderDetail orderdetail);
        public abstract bool DeleteRawMaterialOrderDetailDAL(Guid RawMaterialOrderID);
        public abstract bool UpdateRawMaterialOrderDetailDAL(RawMaterialOrderDetail updateorder);
        public abstract List<Entities.RawMaterialOrderDetail> GetAllRawMaterialOrderDetailsDAL();
        public abstract RawMaterialOrderDetail GetRawMaterialOrderDetailByRawMaterialOrderDetailIDDAL(Guid RawMaterialOrderDetailID);





        /// <summary>
        /// Writes collection to the file in JSON format.
        /// </summary>
        public static void Serialize()
        {
            string serializedJson = JsonConvert.SerializeObject(RawMaterialorderlist);
            using (StreamWriter streamWriter = new StreamWriter(fileName))
            {
                streamWriter.Write(serializedJson);
                streamWriter.Close();
            }
        }

        /// <summary>
        /// Reads collection from the file in JSON format.
        /// </summary>
        public static void Deserialize()
        {
            string fileContent = string.Empty;
            if (!File.Exists(fileName))
                File.Create(fileName).Close();

            using (StreamReader streamReader = new StreamReader(fileName))
            {
                fileContent = streamReader.ReadToEnd();
                streamReader.Close();
                var systemUserListFromFile = JsonConvert.DeserializeObject<List<RawMaterialOrderDetail>>(fileContent);
                if (systemUserListFromFile != null)
                {
                    RawMaterialorderlist = systemUserListFromFile;
                }
            }
        }

        /// <summary>
        /// Static Constructor.
        /// </summary>
        static RawMaterialOrderDetailDALBase()
        {
            Deserialize();
        }
    }
}
