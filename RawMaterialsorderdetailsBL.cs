using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Capgemini.Inventory.Contracts.BLContracts;
using Capgemini.Inventory.Contracts.DALContracts;
using Capgemini.Inventory.DataAccessLayer;
using Capgemini.Inventory.Entities;
using Capgemini.Inventory.Exceptions;
using Capgemini.Inventory.Helpers;

namespace Capgemini.Inventory.BusinessLayer
{
    public class RawMaterialOrderDetailBL : BLBase<RawMaterialOrderDetail>, IRawMaterialOrderDetailBL, IDisposable

    {

        RawMaterialOrderDetailDALBase rawMaterialOrderDetailDAL;
        public RawMaterialOrderDetailBL()
        {
            this.rawMaterialOrderDetailDAL = new RawMaterialOrderDetailDAL();
        }

        /// <summary>
        /// Constructor.
        /// </summary>

        public async Task<bool> ValidateRawMaterialOrderDetail(Entities.RawMaterialOrderDetail RawMaterialOrderDetail) //method to validate product order
        {
            StringBuilder sb = new StringBuilder();
            bool validProduct = await base.Validate(RawMaterialOrderDetail);





            if (RawMaterialOrderDetail.RawMaterialUnitPrice<= 0.00)
            {
                validProduct = false;
                sb.Append(Environment.NewLine + "product unit price should be greater than 0");

            }
            if (RawMaterialOrderDetail.RawMaterialQuantity <= 0.00)
            {
                validProduct = false;
                sb.Append(Environment.NewLine + "product quantity should be greater than 0");

            }
            if (RawMaterialOrderDetail.RawMaterialTotalPrice <= 0.00)
            {
                validProduct = false;
                sb.Append(Environment.NewLine + "product  total price should be greater than 0");

            }
            if (validProduct == false)
                throw new InventoryException(sb.ToString());
            return validProduct;

        }

        public async Task<bool> AddRawMaterialOrderDetailBL(RawMaterialOrderDetail RawMaterialOrderDetail)
        {
            bool RawMaterialOrderDetailAdded = false;
            try
            {
                if (await Validate(RawMaterialOrderDetail))
                {
                    await Task.Run(() =>
                    {

                        rawMaterialOrderDetailDAL.AddRawMaterialOrderDetailDAL(RawMaterialOrderDetail);
                        RawMaterialOrderDetailAdded = true;
                        Serialize();
                    });
                }
            }
            catch (Exception)
            {
                throw;
            }
            return RawMaterialOrderDetailAdded;
        }

        public async Task<List<RawMaterialOrderDetail>> GetAllRawMaterialOrderDetailsBL()
        {
            List<RawMaterialOrderDetail> RawMaterialOrderDetailsList = null;
            try
            {
                await Task.Run(() =>
                {
                    RawMaterialOrderDetailsList = rawMaterialOrderDetailDAL.GetAllRawMaterialOrderDetailsDAL();
                });
            }
            catch (Exception)
            {
                throw;
            }
            return RawMaterialOrderDetailsList;
        }
        public async Task<RawMaterialOrderDetail> GetRawMaterialOrderDetailByRawMaterialOrderDetailIDBL(Guid RawMaterialOrderDetailID)
        {
            RawMaterialOrderDetail matchingRawMaterialOrderDetail = null;
            try
            {
                await Task.Run(() =>
                {
                    matchingRawMaterialOrderDetail = rawMaterialOrderDetailDAL.GetRawMaterialOrderDetailByRawMaterialOrderDetailIDDAL(RawMaterialOrderDetailID);
                });
            }
            catch (Exception)
            {
                throw;
            }
            return matchingRawMaterialOrderDetail;
        }
        public async Task<bool> UpdateRawMaterialOrderDetailBL(RawMaterialOrderDetail updateRawMaterialOrderDetail)
        {
            bool RawMaterialOrderDetailUpdated = false;
            try
            {
                if ((await Validate(updateRawMaterialOrderDetail)) && (await GetRawMaterialOrderDetailByRawMaterialOrderDetailIDBL(updateRawMaterialOrderDetail.RawMaterialOrderDetailID)) != null)
                {
                    this.rawMaterialOrderDetailDAL.UpdateRawMaterialOrderDetailDAL(updateRawMaterialOrderDetail);
                    RawMaterialOrderDetailUpdated = true;
                    Serialize();
                }
            }
            catch (Exception)
            {
                throw;
            }
            return RawMaterialOrderDetailUpdated;
        }
        public async Task<bool> DeleteRawMaterialOrderDetailBL(Guid deleteRawMaterialOrderDetailID)
        {
            bool RawMaterialOrderDetailDeleted = false;
            try
            {
                await Task.Run(() =>
                {
                    RawMaterialOrderDetailDeleted = rawMaterialOrderDetailDAL.DeleteRawMaterialOrderDetailDAL(deleteRawMaterialOrderDetailID);
                    Serialize();
                });
            }
            catch (Exception)
            {
                throw;
            }
            return RawMaterialOrderDetailDeleted;
        }

        public static void Serialize()
        {
            try
            {
                RawMaterialOrderDetailDAL.Serialize();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public static void Deserialize()
        {
            try
            {
                RawMaterialOrderDetailDAL.Deserialize();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void Dispose()
        {
            ((RawMaterialOrderDetailDAL)rawMaterialOrderDetailDAL).Dispose();
        }


    }

}