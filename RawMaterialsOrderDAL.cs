using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capgemini.Inventory.Contracts.DALContracts;
using Capgemini.Inventory.Entities;
using Capgemini.Inventory.Helpers;

namespace Capgemini.Inventory.DataAccessLayer
{
    public class RawMaterialOrderDAL : RawMaterialOrderDALBase
    {
        /// <returns>Determinates whether the new systemUser is added.</returns>
        public override bool AddRawMaterialOrderDAL(RawMaterialOrder newRawMaterialOrder)
        {
            bool RawMaterialorderAdded = false;
            try
            {
                newRawMaterialOrder.RawMaterialOrderID = Guid.NewGuid();
                newRawMaterialOrder.RawMaterialOrderDate = DateTime.Now;
                newRawMaterialOrder.LastmodifiedDateTime = DateTime.Now;
                RawMaterialorderList.Add(newRawMaterialOrder);

                RawMaterialorderAdded = true;
            }
            catch (Exception)
            {
                throw;
            }
            return RawMaterialorderAdded;
        }
        public override List<RawMaterialOrder> GetAllRawMaterialOrdersDAL()
        {
            return RawMaterialorderList;
        }

        public override RawMaterialOrder GetRawMaterialOrderByRawMaterialOrderIDDAL(Guid RawMaterialorderID)

      {
            RawMaterialOrder matchingRawMaterialOrder = null;
            try
            {
                //Find RawMaterialOrder based on searchRawMaterialOrderID
                matchingRawMaterialOrder = RawMaterialorderList.Find(
                    (item) => { return item.RawMaterialOrderID == RawMaterialorderID; }
                );
            }
            catch (Exception)
            {
                throw;
            }
            return matchingRawMaterialOrder;
        }
        public override bool UpdateRawMaterialOrderDAL(RawMaterialOrder updateRawMaterialOrder)
        {
            bool RawMaterialorderUpdated = false;
            try
            {

                RawMaterialOrder matchingRawMaterialOrder = GetRawMaterialOrderByRawMaterialOrderIDDAL(updateRawMaterialOrder.RawMaterialOrderID);

                if (matchingRawMaterialOrder != null)
                {

                    matchingRawMaterialOrder = updateRawMaterialOrder;
                    matchingRawMaterialOrder.LastmodifiedDateTime= DateTime.Now;

                    RawMaterialorderUpdated = true;
                }
            }
            catch (Exception)
            {
                throw;
            }
            return RawMaterialorderUpdated;
        }
        public override bool DeleteRawMaterialOrderDAL(Guid deleteRawMaterialOrderID)
        {
            bool RawMaterialOrderDeleted = false;
            try
            {
                //Find RawMaterialOrder based on searchRawMaterialOrderID
                RawMaterialOrder matchingRawMaterialOrder = RawMaterialorderList.Find(
                    (item) => { return item.RawMaterialOrderID == deleteRawMaterialOrderID; }
                );

                if (matchingRawMaterialOrder != null)
                {
                    //Delete RawMaterialOrder from the collection
                    RawMaterialorderList.Remove(matchingRawMaterialOrder);
                    RawMaterialOrderDeleted = true;
                }
            }
            catch (Exception)
            {
                throw;
            }
            return RawMaterialOrderDeleted;
        }
        public override List<RawMaterialOrder> GetRawMaterialOrdersByDateDAL(DateTime RawMaterialorderDate)
        {
            List<RawMaterialOrder> matchingRawMaterialOrder = new List<RawMaterialOrder>();
            try
            {
                //Find ProductOrder based on searchProductOrderID
                foreach (RawMaterialOrder item in RawMaterialorderList)
                {
                    if (item.RawMaterialOrderDate == RawMaterialorderDate)
                    {
                        matchingRawMaterialOrder.Add(item);
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
            return matchingRawMaterialOrder;
        }
        public void Dispose()
        {
            //No unmanaged resources currently
        }

    }
}