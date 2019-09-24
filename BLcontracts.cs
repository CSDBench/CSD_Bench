using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capgemini.Inventory.Entities;

namespace Capgemini.Inventory.Contracts.BLContracts
{
    public interface IRawMaterialOrderBL
    {
        Task<bool> ValidateRawMaterialOrder(Entities.RawMaterialOrder productOrder);
        Task<bool> AddRawMaterialOrderBL(RawMaterialOrder RawMaterialOrder);
        Task<List<RawMaterialOrder>> GetAllRawMaterialOrdersBL();
        Task<RawMaterialOrder> GetRawMaterialOrderByRawMaterialOrderIDBL(Guid RawMaterialorderID);
        Task<bool> UpdateRawMaterialOrderBL(RawMaterialOrder updateRawMaterialOrder);
        Task<bool> DeleteRawMaterialOrderBL(Guid deleteRawMaterialOrderID);
        Task<List<RawMaterialOrder>> GetRawMaterialOrderByRawMaterialOrderDateDBL(DateTime RawMaterialorderDate);
    }
}
       