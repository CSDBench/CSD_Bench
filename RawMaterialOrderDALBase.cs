using System;
using System.Collections.Generic;
using System.IO;
using Capgemini.Inventory.Entities;
using Newtonsoft.Json;

namespace Capgemini.Inventory.Contracts.DALContracts
{
    /// <summary>
    /// This abstract class acts as a base for raw material class
    /// </summary>
    public abstract class RawMaterialOrderDALBase
    {
        //Collection of 
        protected static List<RawMaterialOrder> RawMaterialorderList = new List<RawMaterialOrder>();
        private static string fileName = "RawMaterialOrder.json";

        //Methods for CRUD operations


        //public abstract  double generateTotalPrice(List<int> orders, List<int> quantity);
        public abstract bool AddRawMaterialOrderDAL(RawMaterialOrder order);
        public abstract bool DeleteRawMaterialOrderDAL(Guid RawMaterialOrderID);
        public abstract bool UpdateRawMaterialOrderDAL(RawMaterialOrder updateorder);
        public abstract List<RawMaterialOrder> GetAllRawMaterialOrdersDAL();
        public abstract List<RawMaterialOrder> GetRawMaterialOrdersByDateDAL(DateTime date);
        public abstract RawMaterialOrder GetRawMaterialOrderByRawMaterialOrderIDDAL(Guid OrderID);





        /// <summary>
        /// Writes collection to the file in JSON format.
        /// </summary>
        public static void Serialize()
        {
            string serializedJson = JsonConvert.SerializeObject(RawMaterialorderList);
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
                var systemUserListFromFile = JsonConvert.DeserializeObject<List<RawMaterialOrder>>(fileContent);
                if (systemUserListFromFile != null)
                {
                    RawMaterialorderList = systemUserListFromFile;
                }
            }
        }

        /// <summary>
        /// Static Constructor.
        /// </summary>
        static RawMaterialOrderDALBase()
        {
            Deserialize();
        }
    }
}