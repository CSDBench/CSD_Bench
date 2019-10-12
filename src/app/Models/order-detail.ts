/**
 * Properties of RawMaterialOrderDetails named as OrderDetail

 * Developed by Ritwik Group-4(inventory)
 * 14th october 2019
 */
export class OrderDetail {
  id: number;
  orderDetailID: string;
  orderID: string;
  rawMaterialID: string;
  quantity: number;
  unitPrice: number;
  totalAmount: number;
  creationDateTime: string;
  lastModifiedDateTime: string;

   /**
 * Parametrised Constructor of OrderDetail

 */
  constructor(ID: number, OrderDetailID: string, OrderID: string, RawMaterialID: string, Quantity: number, UnitPrice: number, TotalAmount: number, CreationDateTime: string, LastModifiedDateTime: string) {
    this.id = ID;
    this.orderDetailID = OrderDetailID;
    this.orderID = OrderID;
    this.rawMaterialID = RawMaterialID;
    this.quantity = Quantity;
    this.unitPrice = UnitPrice;
    this.totalAmount = TotalAmount;
    this.creationDateTime = CreationDateTime;
    this.lastModifiedDateTime = LastModifiedDateTime;
  }
}
