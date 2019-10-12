/**
 * Properties of RawMaterialOrder named as Order

 * Developed by Ritwik Group-4(inventory)
 * 14th october 2019
 */
export class Order {
  id: number;
  orderID: string;
  orderDate: string;
  supperlID: string;
  totalQuantity: number;
  totalAmount: number;
  creationDateTime: string;
  lastModifiedDateTime: string;

  /**
 * Parametrised Constructor of Order

 */
  constructor(ID: number, OrderID: string, OrderDate: string, SupperID: string, TotalQuantity: number, TotalAmount: number, CreationDateTime: string, LastModifiedDateTime: string) {
    this.id = ID;
    this.orderID = OrderID;
    this.orderDate = OrderDate;
    this.supperlID = SupperID;
    this.totalQuantity = TotalQuantity;
    this.totalAmount = TotalAmount;
    this.creationDateTime = CreationDateTime;
    this.lastModifiedDateTime = LastModifiedDateTime;
  }
}

