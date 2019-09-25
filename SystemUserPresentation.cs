using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Console;
using System.Threading.Tasks;
using Capgemini.Inventory.BusinessLayer;
using Capgemini.Inventory.Entities;
using Capgemini.Inventory.Exceptions;
using Capgemini.Inventory.Contracts.BLContracts;

namespace Capgemini.Inventory.PresentationLayer
{
    public static class SystemUserPresentation
    {
        public static async Task<int> SystemUserMenu()
        {
            int choice = -2;

            do
            {
                //Menu
                WriteLine("\n***************SupplierMenu***********");
                WriteLine("1. Place Order");
                WriteLine("2. Delete Order");

                WriteLine("4. View Order");
                WriteLine("-----------------------");

                WriteLine("-----------------------");
                WriteLine("5. Change Password");
                WriteLine("0. Logout");
                WriteLine("-1. Exit");
                Write("Choice: ");

                //Accept and check choice
                bool isValidChoice = int.TryParse(ReadLine(), out choice);
                if (isValidChoice)
                {
                    switch (choice)
                    {
                        case 1: await PlaceOrder(); break;
                        case 2: await DeleteOrder(); break;
                        //case 3: await UpdateOrder(); break;
                        case 4: await ViewOrder(); break;

                        //case 5: await changepassword(); break;

                        case 0: break;
                        case -1: break;
                        default: WriteLine("Invalid Choice"); break;
                    }
                }
                else
                {
                    choice = -2;
                }
            } while (choice != 0 && choice != -1);
            return choice;
        }
        public static async Task PlaceOrder()
        {
            try
            {
                string choice1 = "N";
                List<RawMaterial> selectedRawMaterials = new List<RawMaterial>();
                List<double> quantitylist = new List<double>();
                RawMaterialOrder RawMaterialorder = new RawMaterialOrder();
                IRawMaterialOrderBL RawMaterialorderBL = new RawMaterialOrderBL();
                ISupplierBL SupplierBL = new SupplierBL();
                Supplier Supplier = new Supplier();
                RawMaterial RawMaterial = new RawMaterial();
                RawMaterialBL rawMaterialBL = new RawMaterialBL();
                IRawMaterialOrderDetailBL RawMaterialorderDetailBL = new RawMaterialOrderDetailBL();
                Supplier = await SupplierBL.GetSupplierByEmailBL(CommonData.CurrentUser.Email);
       
                    List<RawMaterial> RawMaterialList = new List<RawMaterial>();

                    
                            RawMaterialList = await rawMaterialBL.GetAllRawMaterialsBL();

                foreach (RawMaterial item in RawMaterialList)
                    {
                        WriteLine(item.RawMaterialName + "  " + item.RawMaterialCode);
                    }
                do
                {
                    WriteLine("Enter the code of the RawMaterial ");
                    string code = ReadLine();
                    RawMaterial rawMaterial = await rawMaterialBL.GetRawMaterialByRawMaterialCodeBL("code");
                    if (rawMaterial != null)


                    {
                        WriteLine("Enter the Quantity of the RawMaterial ");
                        RawMaterialorder.RawMaterialTotalQuantity = double.Parse(ReadLine());

                    }
                    else
                        WriteLine("wrong raw material code");

                   // RawMaterial rawMaterial1 = await rawMaterialBL.GetRawMaterialByRawMaterialCodeBL(code);
                    selectedRawMaterials.Add(rawMaterial);

                    double RawMaterialorderTotalPrice = rawMaterial.RawMaterialPrice * RawMaterialorder.RawMaterialTotalQuantity;
                    Console.WriteLine("Do you want to add more RawMaterials? Enter  Y/N");
                    choice1 = Console.ReadLine();
                } while (choice1 == "Y");

                int j = 0;
                double totalorderprice = 0.00;
                double totalquantity = 0.0;

                foreach (RawMaterial item in selectedRawMaterials)
                {
                    totalorderprice += item.RawMaterialPrice * quantitylist[j];
                    totalquantity += quantitylist[j];
                    j++;
                }
                Console.WriteLine("Total price of the order" + totalorderprice);
                Console.WriteLine("do you want to place the order? \n Enter 1 for yes 0 for no ");
                int m = int.Parse(Console.ReadLine());
                Guid orderID;
                if (m == 1)
                {
                    SupplierBL supplierBL = new SupplierBL();
                    List<Supplier> list1 = await supplierBL.GetAllSuppliersBL();


                    RawMaterialorder.RawMaterialTotalPrice = totalorderprice;

                    RawMaterialorder.SupplierID = 
                        
                   
                    RawMaterialorder.RawMaterialTotalQuantity = totalquantity;
                    orderID = await RawMaterialorderBL.AddRawMaterialOrderBL(RawMaterialorder);
                    for (int i = 0; i < selectedRawMaterials.Count; i++)

                    {
                        RawMaterialOrderDetail RawMaterialorderdetail = new RawMaterialOrderDetail();
                        RawMaterialorderdetail.RawMaterialOrderID = orderID;
                        RawMaterial = await rawMaterialBL.GetRawMaterialByRawMaterialCodeBL(selectedRawMaterials[i].RawMaterialCode);
                        RawMaterialorderdetail.RawMaterialID = RawMaterial.RawMaterialID;
                        RawMaterialorderdetail.RawMaterialQuantity = quantitylist[i];
                        RawMaterialorderdetail.RawMaterialUnitPrice = RawMaterial.RawMaterialPrice;
                        RawMaterialorderdetail.RawMaterialTotalPrice = quantitylist[i] * RawMaterial.RawMaterialPrice;

                        await RawMaterialorderDetailBL.AddRawMaterialOrderDetailBL(RawMaterialorderdetail);
                    }

                }
            }
            catch (Exception ex)
            {
                ExceptionLogger.LogException(ex);
                WriteLine(ex.Message);
            }


        }
        public static async Task DeleteOrder()
        {
            try
            {
                using (RawMaterialOrderBL RawMaterialorderBL = new RawMaterialOrderBL())
                {
                    //Read Sl.No
                    Write("Order #: ");
                    bool isNumberValid = int.TryParse(ReadLine(), out int serial);
                    if (isNumberValid)
                    {
                        serial--;
                        List<RawMaterialOrder> RawMaterialorders = await RawMaterialorderBL.GetAllRawMaterialOrdersBL();
                        if (serial <= RawMaterialorders.Count - 1)
                        {
                            //Confirmation
                            RawMaterialOrder RawMaterialorder = RawMaterialorders[serial];
                            Write("Are you sure? (Y/N): ");
                            string confirmation = ReadLine();

                            if (confirmation.Equals("Y", StringComparison.OrdinalIgnoreCase))
                            {
                                //Invoke DeleteSupplierBL method to delete
                                bool isDeleted = await RawMaterialorderBL.DeleteRawMaterialOrderBL(RawMaterialorder.RawMaterialOrderID);
                                if (isDeleted)
                                {
                                    WriteLine("Order Deleted");
                                }
                                RawMaterialOrderDetailBL RawMaterialorderDetailBL = new RawMaterialOrderDetailBL();
                                List<RawMaterialOrderDetail> detailsList = await RawMaterialorderDetailBL.GetAllRawMaterialOrderDetailsBL();
                                foreach (RawMaterialOrderDetail item in detailsList)
                                {
                                    if (item.RawMaterialOrderID == RawMaterialorder.RawMaterialOrderID)
                                    {
                                        await RawMaterialorderDetailBL.DeleteRawMaterialOrderDetailBL(item.RawMaterialOrderDetailID);
                                    }
                                }

                            }
                        }
                        else
                        {
                            WriteLine($"Invalid Order #.\nPlease enter a number between 1 to {RawMaterialorders.Count}");
                        }
                    }
                    else
                    {
                        WriteLine($"Invalid number.");
                    }
                }
            }
            catch (Exception ex)
            {
                ExceptionLogger.LogException(ex);
                WriteLine(ex.Message);
            }
        }

        public static async Task ViewOrder()
        {
            try
            {
                Supplier Supplier = new Supplier();
                ISupplierBL SupplierBL = new SupplierBL();

                Supplier = await SupplierBL.GetSupplierByEmailBL(CommonData.CurrentUser.Email);

                using (RawMaterialOrderBL RawMaterialorderdetailBL = new RawMaterialOrderBL())
                {
                    //Get and display list of system users.
                    List<RawMaterialOrder> details = await RawMaterialorderdetailBL.GetAllRawMaterialOrdersBL();
                    int serial = 0;

                    WriteLine("Orders:");
                    if (details != null && details?.Count > 0)
                    {
                        WriteLine("#\tRawMaterialOrderID\tRawMaterialTotalPrice\t SupplierID\tRawMaterialTotalQuantity\tRawMaterialOrderDate\tCreationDateTime\tLastmodifiedDateTime");
                        foreach (RawMaterialOrder item in details)
                        {
                            if (item.SupplierID == Supplier.SupplierID)
                            {
                                serial++;
                                WriteLine($"{serial}\t{item.RawMaterialOrderID}\t{item.RawMaterialTotalPrice}\t{item.RawMaterialTotalQuantity}\t{item.SupplierID}\t{item.RawMaterialOrderDate}\t{item.CreationDateTime}\t{item.LastmodifiedDateTime}");
                            }

                        }


                    }
                }
            }

            catch (Exception ex)
            {
                ExceptionLogger.LogException(ex);
                WriteLine(ex.Message);
            }

        }

    }
}

