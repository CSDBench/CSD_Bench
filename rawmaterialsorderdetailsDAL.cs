using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capgemini.Inventory.Contracts.DALContracts;
using Capgemini.Inventory.Entities;
using Capgemini.Inventory.Exceptions;
using Capgemini.Inventory.Helpers;

namespace Capgemini.Inventory.DataAccessLayer
{
    public class RawMaterialOrderDetailDAL : RawMaterialOrderDetailDALBase, IDisposable
    {
        /// <returns>Determinates whether the new systemUser is added.</returns>
        public override bool AddRawMaterialOrderDetailDAL(RawMaterialOrderDetail newRawMaterialOrderDetail)
        {
            bool RawMaterialOrderDetailAdded = false;
            try
            {
                newRawMaterialOrderDetail.RawMaterialOrderDetailID = Guid.NewGuid();

                RawMaterialorderlist.Add(newRawMaterialOrderDetail);

                RawMaterialOrderDetailAdded = true;
            }
            catch (Exception)
            {
                throw;
            }
            return RawMaterialOrderDetailAdded;
        }
        public override List<RawMaterialOrderDetail> GetAllRawMaterialOrderDetailsDAL()
        {
            return RawMaterialorderlist;
        }

        public override RawMaterialOrderDetail GetRawMaterialOrderDetailByRawMaterialOrderDetailIDDAL(Guid RawMaterialOrderDetailID)
        {
            RawMaterialOrderDetail matchingRawMaterialOrderDetail = null;
            try
            {
                //Find RawMaterialOrderDetail based on searchRawMaterialOrderDetailID
                matchingRawMaterialOrderDetail = RawMaterialorderlist.Find(
                    (item) => { return item.RawMaterialOrderDetailID == RawMaterialOrderDetailID; }
                );
            }
            catch (Exception)
            {
                throw;
            }
            return matchingRawMaterialOrderDetail;
        }
        public override bool UpdateRawMaterialOrderDetailDAL(RawMaterialOrderDetail updateRawMaterialOrderDetail)
        {
            bool RawMaterialOrderDetailUpdated = false;
            try
            {

                RawMaterialOrderDetail matchingRawMaterialOrderDetail = GetRawMaterialOrderDetailByRawMaterialOrderDetailIDDAL(updateRawMaterialOrderDetail.RawMaterialOrderDetailID);

                if (matchingRawMaterialOrderDetail != null)
                {

                    matchingRawMaterialOrderDetail = updateRawMaterialOrderDetail;


                    RawMaterialOrderDetailUpdated = true;
                }
            }
            catch (Exception)
            {
                throw;
            }
            return RawMaterialOrderDetailUpdated;
        }
        public override bool DeleteRawMaterialOrderDetailDAL(Guid deleteRawMaterialOrderDetailID)
        {
            bool RawMaterialOrderDetailDeleted = false;
            try
            {
                //Find RawMaterialOrderDetail based on searchRawMaterialOrderDetailID
                RawMaterialOrderDetail matchingRawMaterialOrderDetail = RawMaterialorderlist.Find(
                    (item) => { return item.RawMaterialOrderDetailID == deleteRawMaterialOrderDetailID; }
                );

                if (matchingRawMaterialOrderDetail != null)
                {
                    //Delete RawMaterialOrderDetail from the collection
                    RawMaterialorderlist.Remove(matchingRawMaterialOrderDetail);
                    RawMaterialOrderDetailDeleted = true;
                }
            }
            catch (Exception)
            {
                throw;
            }
            return RawMaterialOrderDetailDeleted;
        }

        public void Dispose()
        {
            //No unmanaged resources currently
        }

    }
}
