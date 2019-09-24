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
using Capgemini.Inventory.Helpers;
using Capgemini.Inventory.Exceptions;

namespace Capgemini.Inventory.BusinessLayer
{
    public class RawMaterialOrderBL : BLBase<RawMaterialOrder>, IRawMaterialOrderBL, IDisposable

    {
        //fields
        RawMaterialOrderDALBase RawMaterialorderDAL;

        /// <summary>
        /// Constructor.
        /// </summary>
        public RawMaterialOrderBL()
        {
            this.RawMaterialorderDAL = new RawMaterialOrderDAL();
        }
        public async Task<bool> ValidateRawMaterialOrder(Entities.RawMaterialOrder RawMaterialOrder) //method to validate RawMaterial order
        {
            StringBuilder sb = new StringBuilder();
            bool validRawMaterial = await base.Validate(RawMaterialOrder);


            DateTime now = DateTime.Now;
            int res = DateTime.Compare(RawMaterialOrder.RawMaterialOrderDate, now);
            if (res > 0)
            {

                validRawMaterial = false;
                sb.Append(Environment.NewLine + $"invalid order date");

            }
            if (RawMaterialOrder.RawMaterialTotalPrice < 0.0)
            {
                validRawMaterial = false;
                sb.Append(Environment.NewLine + $"price should be greater than 0.0");

            }
            if (validRawMaterial == false)
                throw new InventoryException(sb.ToString());
            return validRawMaterial;

        }

        public async Task<bool> AddRawMaterialOrderBL(RawMaterialOrder RawMaterialOrder)
        {
            bool RawMaterialorderAdded = false;
            try
            {
                if (await Validate(RawMaterialOrder))
                {
                    await Task.Run(() =>
                    {
                        this.RawMaterialorderDAL.AddRawMaterialOrderDAL(RawMaterialOrder);
                        RawMaterialorderAdded = true;
                        Serialize();
                    });
                }
            }
            catch (Exception)
            {
                throw;
            }
            return RawMaterialorderAdded;
        }

        public async Task<List<RawMaterialOrder>> GetAllRawMaterialOrdersBL()
        {
            List<RawMaterialOrder> RawMaterialordersList = null;
            try
            {
                await Task.Run(() =>
                {
                    RawMaterialordersList = RawMaterialorderDAL.GetAllRawMaterialOrdersDAL();
                });
            }
            catch (Exception)
            {
                throw;
            }
            return RawMaterialordersList;
        }
        public async Task<RawMaterialOrder> GetRawMaterialOrderByRawMaterialOrderIDBL(Guid RawMaterialorderID)
        {
            RawMaterialOrder matchingRawMaterialOrder = null;
            try
            {
                await Task.Run(() =>
                {
                    matchingRawMaterialOrder = RawMaterialorderDAL.GetRawMaterialOrderByRawMaterialOrderIDDAL(RawMaterialorderID);
                });
            }
            catch (Exception)
            {
                throw;
            }
            return matchingRawMaterialOrder;
        }
        public async Task<bool> UpdateRawMaterialOrderBL(RawMaterialOrder updateRawMaterialOrder)
        {
            bool RawMaterialorderUpdated = false;
            try
            {
                if ((await Validate(updateRawMaterialOrder)) && (await GetRawMaterialOrderByRawMaterialOrderIDBL(updateRawMaterialOrder.RawMaterialOrderID)) != null)
                {
                    this.RawMaterialorderDAL.UpdateRawMaterialOrderDAL(updateRawMaterialOrder);
                    RawMaterialorderUpdated = true;
                    Serialize();
                }
            }
            catch (Exception)
            {
                throw;
            }
            return RawMaterialorderUpdated;
        }
        public async Task<bool> DeleteRawMaterialOrderBL(Guid deleteRawMaterialOrderID)
        {
            bool RawMaterialOrderDeleted = false;
            try
            {
                await Task.Run(() =>
                {
                    RawMaterialOrderDeleted = RawMaterialorderDAL.DeleteRawMaterialOrderDAL(deleteRawMaterialOrderID);
                    Serialize();
                });
            }
            catch (Exception)
            {
                throw;
            }
            return RawMaterialOrderDeleted;
        }
        public async Task<List<RawMaterialOrder>> GetRawMaterialOrderByRawMaterialOrderDateDBL(DateTime RawMaterialorderDate)
        {
            List<RawMaterialOrder> matchingRawMaterialOrder = new List<RawMaterialOrder>();
            try
            {
                await Task.Run(() =>
                {
                    matchingRawMaterialOrder = RawMaterialorderDAL.GetRawMaterialOrdersByDateDAL(RawMaterialorderDate);
                });
            }
            catch (Exception)
            {
                throw;
            }
            return matchingRawMaterialOrder;
        }
        public static void Serialize()
        {
            try
            {
                RawMaterialOrderDAL.Serialize();
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
                RawMaterialOrderDAL.Deserialize();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void Dispose()
        {
            ((RawMaterialOrderDAL)RawMaterialorderDAL).Dispose();
        }


    }

}