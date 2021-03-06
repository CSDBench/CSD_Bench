USE [13th Aug CLoud PT Immersive]
GO
/****** Object:  Table [Team_D].[Admin]    Script Date: 06-11-2019 09:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Team_D].[Admin](
	[Id] [uniqueidentifier] NOT NULL,
	[AdminEmail] [varchar](30) NULL,
	[AdminPassword] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Team_D].[Cart]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Team_D].[Cart](
	[ID] [uniqueidentifier] NOT NULL,
	[ProductID] [uniqueidentifier] NOT NULL,
	[Quantity] [decimal](18, 0) NULL,
	[unitPrice] [decimal](18, 0) NULL,
	[TotalPrice] [decimal](18, 0) NULL,
	[DistributorID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Team_D].[Distributor]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Team_D].[Distributor](
	[DistributorID] [uniqueidentifier] NOT NULL,
	[DistributorName] [varchar](40) NOT NULL,
	[DistributorMobile] [char](10) NOT NULL,
	[DistributorEmail] [varchar](30) NOT NULL,
	[DistributorPassword] [varchar](15) NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[LastModifiedDateTime] [datetime] NOT NULL,
 CONSTRAINT [Distributor_pk] PRIMARY KEY CLUSTERED 
(
	[DistributorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DistributorMobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DistributorName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DistributorPassword] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DistributorEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Team_D].[DistributorAddress]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Team_D].[DistributorAddress](
	[DistributoraddressID] [uniqueidentifier] NOT NULL,
	[DistributorID] [uniqueidentifier] NULL,
	[AddressLine1] [varchar](30) NOT NULL,
	[AddressLine2] [varchar](30) NULL,
	[Pincode] [char](6) NULL,
	[City] [varchar](10) NULL,
	[DistributorState] [varchar](10) NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[LastModifiedDateTime] [datetime] NOT NULL,
 CONSTRAINT [Distributoraddress_pk] PRIMARY KEY CLUSTERED 
(
	[DistributoraddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[AddressLine1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Team_D].[Product]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Team_D].[Product](
	[ProductID] [uniqueidentifier] NOT NULL,
	[ProductName] [varchar](30) NOT NULL,
	[ProductCode] [varchar](5) NOT NULL,
	[ProductUnitPrice] [decimal](18, 0) NOT NULL,
	[ProductType] [varchar](12) NOT NULL,
	[CreationDateTime] [datetime2](7) NULL,
	[LastUpdateDateTime] [datetime2](7) NULL,
 CONSTRAINT [ProductPK] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [PCodeUnique] UNIQUE NONCLUSTERED 
(
	[ProductCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Team_D].[ProductOrderDetails]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Team_D].[ProductOrderDetails](
	[ProductOrderDetailID] [uniqueidentifier] NOT NULL,
	[ProductOrderID] [uniqueidentifier] NOT NULL,
	[ProductID] [uniqueidentifier] NOT NULL,
	[ProductTotalPrice] [decimal](18, 0) NULL,
	[ProductQuantity] [decimal](18, 0) NULL,
	[ProductUnitPrice] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductOrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Team_D].[ProductOrders]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Team_D].[ProductOrders](
	[ProductOrderID] [uniqueidentifier] NOT NULL,
	[ProductOrderDate] [datetime] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[DistributorID] [uniqueidentifier] NULL,
	[ProductOrderAmount] [decimal](18, 0) NULL,
	[PaymentStatus] [bit] NOT NULL,
	[TotalQuantity] [decimal](18, 0) NULL,
	[DistributorAddressID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Team_D].[RawMaterial]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Team_D].[RawMaterial](
	[RawMaterialID] [uniqueidentifier] NOT NULL,
	[RawMaterialName] [varchar](30) NOT NULL,
	[RawMaterialCode] [varchar](5) NOT NULL,
	[RawMaterialUnitPrice] [decimal](18, 0) NOT NULL,
	[CreationDateTime] [datetime2](7) NULL,
	[LastUpdateDateTime] [datetime2](7) NULL,
 CONSTRAINT [RawMaterialPK] PRIMARY KEY CLUSTERED 
(
	[RawMaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [RMCodeUnique] UNIQUE NONCLUSTERED 
(
	[RawMaterialCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Team_D].[Rawmaterialorder]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Team_D].[Rawmaterialorder](
	[CreationDateTime] [datetime] NULL,
	[LastmodifiedDateTime] [datetime] NULL,
	[RawMaterialOrderID] [uniqueidentifier] NOT NULL,
	[SupplierID] [uniqueidentifier] NOT NULL,
	[RawMaterialTotalPrice] [decimal](18, 0) NULL,
	[RawMaterialTotalQuantity] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[RawMaterialOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Team_D].[Supplier]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Team_D].[Supplier](
	[SupplierID] [uniqueidentifier] NOT NULL,
	[SupplierName] [varchar](40) NOT NULL,
	[SupplierMobile] [char](10) NOT NULL,
	[SupplierEmail] [varchar](50) NOT NULL,
	[SupplierPassword] [varchar](15) NOT NULL,
	[creationDateTime] [datetime] NULL,
	[lastModifiedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SupplierEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Team_D].[SupplierAddress]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Team_D].[SupplierAddress](
	[supplierAddressID] [uniqueidentifier] NOT NULL,
	[supplierID] [uniqueidentifier] NOT NULL,
	[AddressLine1] [varchar](255) NOT NULL,
	[AddressLine2] [varchar](255) NOT NULL,
	[PinCode] [char](6) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[state] [varchar](50) NOT NULL,
	[creationDateTime] [datetime] NULL,
	[lastModifiedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[supplierAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PinCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Team_D].[SystemUser]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Team_D].[SystemUser](
	[SystemUserID] [uniqueidentifier] NOT NULL,
	[SystemUserName] [varchar](30) NULL,
	[SystemUserEmail] [varchar](30) NULL,
	[SystemUserPassword] [varchar](15) NULL,
	[CreationDateTime] [datetime] NULL,
	[LastModifiedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SystemUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [Team_D].[Cart]  WITH CHECK ADD FOREIGN KEY([DistributorID])
REFERENCES [Team_D].[Distributor] ([DistributorID])
GO
ALTER TABLE [Team_D].[Cart]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [Team_D].[Product] ([ProductID])
GO
ALTER TABLE [Team_D].[DistributorAddress]  WITH CHECK ADD FOREIGN KEY([DistributorID])
REFERENCES [Team_D].[Distributor] ([DistributorID])
GO
ALTER TABLE [Team_D].[ProductOrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductOrderID])
REFERENCES [Team_D].[ProductOrders] ([ProductOrderID])
GO
ALTER TABLE [Team_D].[ProductOrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [Team_D].[Product] ([ProductID])
GO
ALTER TABLE [Team_D].[ProductOrders]  WITH CHECK ADD FOREIGN KEY([DistributorID])
REFERENCES [Team_D].[Distributor] ([DistributorID])
GO
ALTER TABLE [Team_D].[ProductOrders]  WITH CHECK ADD FOREIGN KEY([DistributorAddressID])
REFERENCES [Team_D].[DistributorAddress] ([DistributoraddressID])
GO
ALTER TABLE [Team_D].[Rawmaterialorder]  WITH CHECK ADD FOREIGN KEY([SupplierID])
REFERENCES [Team_D].[Supplier] ([SupplierID])
GO
ALTER TABLE [Team_D].[SupplierAddress]  WITH CHECK ADD FOREIGN KEY([supplierID])
REFERENCES [Team_D].[Supplier] ([SupplierID])
GO
ALTER TABLE [Team_D].[Product]  WITH CHECK ADD  CONSTRAINT [PPriceNotNegative] CHECK  (([ProductUnitPrice]>(0)))
GO
ALTER TABLE [Team_D].[Product] CHECK CONSTRAINT [PPriceNotNegative]
GO
ALTER TABLE [Team_D].[Product]  WITH CHECK ADD  CONSTRAINT [PTypeIN] CHECK  (([ProductType]='Tonic Water' OR [ProductType]='Juice' OR [ProductType]='Energy Drink' OR [ProductType]='Soft Drink' OR [ProductType]='Mocktail'))
GO
ALTER TABLE [Team_D].[Product] CHECK CONSTRAINT [PTypeIN]
GO
ALTER TABLE [Team_D].[ProductOrderDetails]  WITH CHECK ADD  CONSTRAINT [Price_constraint] CHECK  (([ProductTotalPrice]>(0.0)))
GO
ALTER TABLE [Team_D].[ProductOrderDetails] CHECK CONSTRAINT [Price_constraint]
GO
ALTER TABLE [Team_D].[ProductOrderDetails]  WITH CHECK ADD  CONSTRAINT [Prod_quantity_constraint] CHECK  (([ProductQuantity]>(0.0)))
GO
ALTER TABLE [Team_D].[ProductOrderDetails] CHECK CONSTRAINT [Prod_quantity_constraint]
GO
ALTER TABLE [Team_D].[ProductOrderDetails]  WITH CHECK ADD  CONSTRAINT [Unit_price_constraint] CHECK  (([ProductUnitPrice]>(0.0)))
GO
ALTER TABLE [Team_D].[ProductOrderDetails] CHECK CONSTRAINT [Unit_price_constraint]
GO
ALTER TABLE [Team_D].[ProductOrders]  WITH CHECK ADD  CONSTRAINT [Amount_constraint] CHECK  (([ProductOrderAmount]>(0.0)))
GO
ALTER TABLE [Team_D].[ProductOrders] CHECK CONSTRAINT [Amount_constraint]
GO
ALTER TABLE [Team_D].[ProductOrders]  WITH CHECK ADD  CONSTRAINT [quantity_constraint] CHECK  (([TotalQuantity]>(0.0)))
GO
ALTER TABLE [Team_D].[ProductOrders] CHECK CONSTRAINT [quantity_constraint]
GO
ALTER TABLE [Team_D].[RawMaterial]  WITH CHECK ADD  CONSTRAINT [RMPriceNotNegative] CHECK  (([RawMaterialUnitPrice]>(0)))
GO
ALTER TABLE [Team_D].[RawMaterial] CHECK CONSTRAINT [RMPriceNotNegative]
GO
ALTER TABLE [Team_D].[Rawmaterialorder]  WITH CHECK ADD  CONSTRAINT [k_RM_price] CHECK  (([RawMaterialTotalPrice]>(0)))
GO
ALTER TABLE [Team_D].[Rawmaterialorder] CHECK CONSTRAINT [k_RM_price]
GO
ALTER TABLE [Team_D].[Rawmaterialorder]  WITH CHECK ADD  CONSTRAINT [k_RM_quantity] CHECK  (([RawMaterialTotalQuantity]>(0)))
GO
ALTER TABLE [Team_D].[Rawmaterialorder] CHECK CONSTRAINT [k_RM_quantity]
GO
/****** Object:  StoredProcedure [Team_D].[AddDistributor]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [Team_D].[AddDistributor]
 ( @disId uniqueidentifier,
 @disName varchar(40),
  @disMob char(10),
  @disEmail varchar(30),
  @disPas varchar(15),
  @creationDateTime datetime ,
   @lastModifiedDate datetime
)
 as 
 --Procedure to add Distributor into the table.
--Developed by Sowrasree Banerjee on 01-10-2019
 begin
 
		if @disName=''
		throw 50001, 'Distributor name cannot be empty',1
		if @disMob=''
		throw 50002, 'Distributor Mobile cannot be empty',1
		if @disEmail=''
		throw 50003, 'Distributor Email cannot be empty',1
		if @disPas=''
		throw 50003, 'Distributor Password cannot be empty',1

	insert into Team_D.Distributor values (@disId,@disName,@disMob,@disEmail,@disPas, @creationDateTime,@lastModifiedDate)
end

GO
/****** Object:  StoredProcedure [Team_D].[AddDistributorAddress]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[AddDistributorAddress]
(@disAddId uniqueidentifier,
 @disID uniqueidentifier,
 @addline1 varchar(30),
 @addline2 char(30),
  @pincode varchar(6),
 @city varchar(10),
 @state varchar(10)

)
 as 
 --Procedure to add Distributor into the table.
--Developed by Sowrasree Banerjee on 01-10-2019
 begin
		
		if @addline1=''
		throw 50002, 'Address Line1 cannot be empty',1
		if @addline2=''
		throw 50003, 'Address Line2 cannot be empty',1
		if @pincode=''
		throw 50003, 'Pincode cannot be empty',1
		if @city=''
		throw 50003, 'City cannot be empty',1
		if @state=''
		throw 50003, 'State cannot be empty',1
	
	insert into Team_D.DistributorAddress (DistributoraddressID,DistributorID,AddressLine1,AddressLine2,Pincode,City,DistributorState,CreateDateTime,LastModifiedDateTime)
	values (@disAddId,@disID,@addline1,@addline2,@pincode,@city,@state,getdate(),getdate())
end
GO
/****** Object:  StoredProcedure [Team_D].[AddingSupplierAddress]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[AddingSupplierAddress](@supAdID uniqueidentifier,@supID uniqueidentifier, @AdLine1 varchar(255),@AdLine2 varchar(255) ,@pcode varchar(15),@city varchar(20),@state varchar(20) )
--Created by Pushpraj kaushik on 4/10/19
--created procedure for adding the supplier address 
as 
begin

if @supID IS NULL
throw 50001,'Invalid Supplier ID',2
if @AdLine1 IS NULL OR @AdLine1=''
throw 50001,'Invalid Adress line1',3
if @AdLine2 IS NULL OR @AdLine2=''
throw 50001,'Invalid Address line2',4
if @pcode IS NULL OR @pcode=''
throw 50001,'Invalid PinCode',5
if @city IS NULL OR @city=''
throw 50001,'Invalid City name',6
if @State IS NULL OR @state=''
throw 50001,'Invalid State name',7



insert into Team_D.SupplierAddress(SupplierAddressID,SupplierID,AddressLine1,AddressLine2,PinCode,City,[State],creationDateTime,lastmodifiedDateTime )
values (@supAdID,@supID,@AdLine1,@AdLine2,@pcode,@city,@state,sysdatetime(),sysdatetime())
end

GO
/****** Object:  StoredProcedure [Team_D].[AddProduct]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[AddProduct](@productid uniqueidentifier, @producttype varchar(20), @productname varchar(30), @productcode varchar(5), 
	@productunitprice decimal)
as
--Developed by Rohit Kumar on 30/09/2019
--procedure to add a product into the table
begin
	if @productname = ''
	throw 50001, 'Product Name cannot be empty', 1
	if exists (Select ProductName from Team_D.Product where ProductName = @productname)
	throw 50002, 'Product with same name already exists', 1
	if @productcode = ''
	throw 50003, 'Product Code cannot be empty', 1
	if exists (Select ProductCode from Team_D.Product where ProductCode = @productcode)
	throw 50004, 'Product with same code already exists', 1
	if @productunitprice <= 0
	throw 50005, 'Product Price cannot be less than or equal to zero', 1

	insert into Team_D.Product(ProductID,ProductType, ProductName, ProductCode, ProductUnitPrice, CreationDateTime, LastUpdateDateTime)
	values(@productid, @producttype, @productname, @productcode,@productunitprice, sysdatetime(), sysdatetime())
end
GO
/****** Object:  StoredProcedure [Team_D].[AddProductOrder]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[AddProductOrder](@ProductOrderID uniqueidentifier ,@DistributorID uniqueidentifier, @ProductOrderAmount decimal,@paymentStatus bit , @TotalQuantity decimal, @distributorAddressID uniqueidentifier )
--Procedure to add all the product orders
--Developed by Maski Saijahnavi on 01/10/19
as 
begin
if @ProductOrderID IS NULL --OR @ProductOrderID =''
throw 500001,'Invalid ProductOrderID',1
if @DistributorID IS NULL --OR @DistributorID=''
throw 500001,'Invalid Distributor ID',2
if @ProductOrderAmount<=0
throw 500001,'Product Order amount should be greater than or equal to zero',3
if @paymentStatus IS NULL
throw 500001,'Payment status should not be null',4
if @TotalQuantity<=0 
throw 500001,'Total quantity should be greater than or equal to zero',5
if @distributorAddressID IS NULL-- OR @distributorAddressID =''
throw 500001,'Invalid ProductOrderID',1

insert into Team_D.ProductOrders values (@ProductOrderID,GetDate(),GetDate(),@DistributorID,@ProductOrderAmount,@paymentStatus,@TotalQuantity,@distributorAddressID)
end
--PROCEDURE CREATED

GO
/****** Object:  StoredProcedure [Team_D].[AddProductOrderDetail]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--procedure to add product order details
CREATE procedure [Team_D].[AddProductOrderDetail](@ProductOrderDetailID uniqueidentifier,@ProductOrderID uniqueidentifier, @ProductID uniqueidentifier , @ProductTotalPrice decimal,@ProductQuantity decimal, @ProductUnitPrice decimal)
as 
begin
if @ProductOrderDetailID IS NULL
throw 500001,'Invalid ProductOrderDetailID',1
if @ProductOrderID IS NULL 
throw 500001,'Invalid ProductOrderID',1

if @ProductTotalPrice<=0
throw 500001,'Product Total Price should be greater than or equal to zero',3
if @ProductQuantity <=0
throw 500001,'Product Quantity should be greater than or equal to zero',4
if @ProductUnitPrice<=0 
throw 500001,'ProductUnitPrice should be greater than or equal to zero',5


insert into Team_D.ProductOrderDetails
values (@ProductOrderDetailID,@ProductOrderID,@ProductID,@ProductTotalPrice,@ProductQuantity,@ProductUnitPrice)
end
GO
/****** Object:  StoredProcedure [Team_D].[AddProductOrderDetails]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[AddProductOrderDetails](@ProductOrderDetailID uniqueidentifier,@ProductOrderID uniqueidentifier, @ProductID uniqueidentifier , @ProductTotalPrice decimal,@ProductQuantity decimal, @ProductUnitPrice decimal)
as 
begin
if @ProductOrderDetailID IS NULL
throw 500001,'Invalid ProductOrderDetailID',1
if @ProductOrderID IS NULL 
throw 500001,'Invalid ProductOrderID',1

if @ProductTotalPrice<=0
throw 500001,'Product Total Price should be greater than or equal to zero',3
if @ProductQuantity <=0
throw 500001,'Product Quantity should be greater than or equal to zero',4
if @ProductUnitPrice<=0 
throw 500001,'ProductUnitPrice should be greater than or equal to zero',5


insert into Prod.ProductOrderDetails
values (@ProductOrderDetailID,@ProductOrderID,@ProductID,@ProductTotalPrice,@ProductQuantity,@ProductUnitPrice)
end
GO
/****** Object:  StoredProcedure [Team_D].[AddProductOrderDetails1]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[AddProductOrderDetails1](@ProductOrderDetailID uniqueidentifier,@ProductOrderID uniqueidentifier, @ProductID uniqueidentifier , @ProductTotalPrice decimal,@ProductQuantity decimal, @ProductUnitPrice decimal)
as 
begin
if @ProductOrderDetailID IS NULL
throw 500001,'Invalid ProductOrderDetailID',1
if @ProductOrderID IS NULL 
throw 500001,'Invalid ProductOrderID',1

if @ProductTotalPrice<=0
throw 500001,'Product Total Price should be greater than or equal to zero',3
if @ProductQuantity <=0
throw 500001,'Product Quantity should be greater than or equal to zero',4
if @ProductUnitPrice<=0 
throw 500001,'ProductUnitPrice should be greater than or equal to zero',5


insert into Prod.ProductOrderDetails
values (@ProductOrderDetailID,@ProductOrderID,@ProductID,@ProductTotalPrice,@ProductQuantity,@ProductUnitPrice)
end
GO
/****** Object:  StoredProcedure [Team_D].[AddProductToCart]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[AddProductToCart](@ID uniqueidentifier,@ProductID uniqueidentifier, @Quantity decimal, @UnitPrice decimal, @TotalPrice decimal,@DistributorID uniqueidentifier)
as 
begin


insert into Team_D.Cart
values (@ID,@ProductID, @Quantity,@UnitPrice,@TotalPrice,@DistributorID )
end

GO
/****** Object:  StoredProcedure [Team_D].[AddRawMaterial]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[AddRawMaterial](@rawmaterialid uniqueidentifier, @rawmaterialname varchar(30), @rawmaterialcode varchar(5), 
	@rawmaterialunitprice decimal, @creationdatetime datetime, @lastmodifiedatetime datetime)
as
--Developed by Rohit Kumar on 30/09/2019
--procedure to add a raw material into table
begin
	if @rawmaterialname = ''
	throw 50001, 'Raw Material Name cannot be empty', 1
	if exists (Select RawMaterialName from Team_D.RawMaterial where RawMaterialName = @rawmaterialname)
	throw 50002, 'Raw Material with same name already exists', 1
	if @rawmaterialcode = ''
	throw 50003, 'Raw Material Code cannot be empty', 1
	if exists (Select RawMaterialCode from Team_D.RawMaterial where RawMaterialCode = @rawmaterialcode)
	throw 50004, 'Raw Material with same code already exists', 1
	if @rawmaterialunitprice <= 0
	throw 50005, 'Raw material Price cannot be less than or equal to zero', 1

	insert into Team_D.RawMaterial(RawMaterialID, RawMaterialName, RawMaterialCode, RawMaterialUnitPrice, CreationDateTime, LastUpdateDateTime)
	values(@rawmaterialid, @rawmaterialname, @rawmaterialcode, @rawmaterialunitprice, @creationdatetime, @lastmodifiedatetime)
end

GO
/****** Object:  StoredProcedure [Team_D].[AddRawmaterialOrder]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [Team_D].[AddRawmaterialOrder] (@CreationDateTime datetime,@LastmodifiedDateTime datetime,@RawMaterialOrderID uniqueidentifier,@SupplierID uniqueidentifier,
 @RawMaterialOrderTotalPrice decimal, @RawMaterialOrderTotalQuantity decimal)
 as 
 --Developed by Ritwik on 30/09/2019
 --procedure to add a raw material order into table
 begin

 if @RawMaterialOrderTotalQuantity is null 
   throw 50001, 'raw material total price cannot be 0 or empty ', 2
 if @RawMaterialOrderTotalPrice is null 
 throw 50002, 'raw material total  cannot be 0', 3
 if @RawMaterialOrderTotalPrice <0
   throw 50003, 'raw material total price cannot be negative or empty ', 4
 if @RawMaterialOrderTotalQuantity <0 
 throw 50004, 'raw material total quantity cannot be negative', 5
 insert into Team_D.Rawmaterialorder(CreationDateTime, LastmodifiedDateTime,RawMaterialOrderID ,SupplierID ,
 RawMaterialTotalPrice , RawMaterialTotalQuantity)
 values ( @CreationDateTime, @LastmodifiedDateTime, @RawMaterialOrderID,@SupplierID ,
 @RawMaterialOrderTotalPrice, @RawMaterialOrderTotalQuantity)
 end
GO
/****** Object:  StoredProcedure [Team_D].[AddSupplier]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[AddSupplier](@supID uniqueidentifier,@supName varchar(40), @supMob char(10),@supEmail varchar(50) ,@supPass varchar(15))
as 
begin
if @supName IS NULL OR @supName=''
throw 50001,'Invalid Supplier name',2
if exists (select SupplierName from Team_D.supplier where supplierName=@supName)
if @supMob IS NULL OR @supMob=''
throw 50001,'Invalid Mobile number',3
if exists (select supplierMobile from Team_D.supplier where supplierMobile=@supMob)
if @supEmail IS NULL OR @supEmail=''
throw 50001,'Invalid Supplier Email',4
if exists (select supplierEmail from Team_D.supplier where supplierEmail=@supEmail)
if @supPass IS NULL OR @supPass=''
throw 50001,'Invalid Supplier password',5

insert into Team_D.supplier(supplierID,supplierName,supplierMobile,supplierEmail, supplierPassword,creationDateTime,lastmodifiedDateTime)
values (@supID ,@supName,@supMob,@supEmail,@supPass,sysdatetime(),sysdatetime())

end


GO
/****** Object:  StoredProcedure [Team_D].[AddSystemUser]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[AddSystemUser](@SystemUserID uniqueidentifier,@SystemUserName varchar(40), @SystemUserEmail varchar(40), @SystemUserPassword varchar(15) , @Creationdate datetime,@LastModified datetime)
as 
begin
if @SystemUserID IS NULL 
throw 500001,'Invalid ProductOrderID',1


insert into Team_D.SystemUser
values (@SystemUserID,@SystemUserName,@SystemUserEmail,@SystemUserPassword,GetDate(),GetDate())
end
GO
/****** Object:  StoredProcedure [Team_D].[AddToCart]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[AddToCart](@ID uniqueidentifier,@ProductID uniqueidentifier, @Quantity decimal, @UnitPrice decimal, @TotalPrice decimal,@DistributorID uniqueidentifier)
as 
begin


insert into Team_D.Cart
values (@ID,@ProductID, @Quantity,@UnitPrice,@TotalPrice,@DistributorID )
end

GO
/****** Object:  StoredProcedure [Team_D].[DeleteDistributor]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[DeleteDistributor](@distributorID uniqueidentifier)
as
 --Procedure to delete distributor from table.
--Developed by Sowrasree Banerjee on 01-10-2019 
begin
begin try
DELETE FROM Team_D.Distributor WHERE DistributorID=@distributorID
end try
begin catch
PRINT @@ERROR;
throw 500001,'invalid values fetched',3
return 0
end catch
end

GO
/****** Object:  StoredProcedure [Team_D].[DeleteDistributorAddress]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[DeleteDistributorAddress](@distributoraddID uniqueidentifier)
as
 --Procedure to delete distributor from table.
--Developed by Sowrasree Banerjee on 01-10-2019 
begin
begin try
DELETE FROM Team_D.DistributorAddress WHERE DistributorAddressID=@distributoraddID
end try
begin catch
PRINT @@ERROR;
throw 500001,'invalid values fetched',3
return 0
end catch
end

GO
/****** Object:  StoredProcedure [Team_D].[DeleteProduct]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[DeleteProduct](@productid varchar(36))
as
--Developed by Rohit Kumar on 30/09/2019
--procedure to delete a product
begin
	if exists (select ProductID from Team_D.Product where ProductID = @productid)
		begin
			delete from Team_D.Product
			where ProductID = @productid
		end
	else
		throw 50004, 'Product Code does not exists', 1
end
GO
/****** Object:  StoredProcedure [Team_D].[DeleteProductOrder]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[DeleteProductOrder](@ProductOrderID uniqueidentifier )
--Procedure to delete Product Order
--Developed by Maski Saijahnavi on 01/10/19
as 
begin
	begin try
		DELETE FROM Team_D.ProductOrders where ProductOrderID=@ProductOrderID
	end try
	begin catch
	PRINT @@ERROR;
		throw 500001,'Invalid Values Fetched',3
		return 0
    end catch
end

GO
/****** Object:  StoredProcedure [Team_D].[DeleteRawMaterial]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[DeleteRawMaterial](@rawmaterialid varchar(36))
as
--Developed by Rohit Kumar on 30/09/2019
--procedure to delete a raw material
begin
	if exists (select RawMaterialID from Team_D.RawMaterial where RawMaterialID = @rawmaterialid)
		begin
			delete from Team_D.RawMaterial
			where RawMaterialID = @rawmaterialid
		end
	else
		throw 50004, 'Raw Material Code does not exists', 1
end
GO
/****** Object:  StoredProcedure [Team_D].[DeleteRawMaterialOrder]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[DeleteRawMaterialOrder](@RawMaterialOrderID uniqueidentifier )
as 
--Procedure to delete RawMaterial Order
--Developed by Ritwik on 30/09/2019
begin
	begin try
		DELETE FROM Team_D.RawMaterialOrder where RawMaterialOrderID=@RawMaterialOrderID
	end try
	begin catch
	PRINT @@ERROR;
		throw 500001,'Invalid Values Fetched',3
		return 0
    end catch
end

GO
/****** Object:  StoredProcedure [Team_D].[DeleteSupplier]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[DeleteSupplier](@supID uniqueidentifier)
as 
--Created by Pushpraj kaushik on 4/10/19
--created procedure for deleting existing supplier
begin
	if exists (select supplierID from Team_D.supplier where supplierID=@supID)
	begin
	DELETE FROM Team_D.supplier where supplierID=@supID
	end
	else
	throw 50001,'Invalid Values Fetched',3
	
end

GO
/****** Object:  StoredProcedure [Team_D].[DeleteSupplierAddress]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[DeleteSupplierAddress](@supAdID uniqueidentifier)
--Created by Pushpraj kaushik on 4/10/19
--created procedure for deleting the supplier address
as 
begin
	if exists (select supplierAddressID from Team_D.supplierAddress where supplierAddressID=@supAdID)
	begin
	DELETE FROM Team_D.supplierAddress where supplierAddressID=@supAdID
	end
	else
	throw 50001,'Invalid Values Fetched',3
end

GO
/****** Object:  StoredProcedure [Team_D].[GetAllDistributorAddress]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [Team_D].[GetAllDistributorAddress]
as
 --Procedure to get all distributor Address.
--Developed by Sowrasree Banerjee on 01-10-2019 
begin
begin try
select*from Team_D.DistributorAddress
end try
begin catch
PRINT @@ERROR;
throw 500001 ,'invalid values fetched ',2
return 0
end catch
end 

GO
/****** Object:  StoredProcedure [Team_D].[GetAllDistributors]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetAllDistributors]
as
 --Procedure to get all distributors.
--Developed by Sowrasree Banerjee on 01-10-2019 
begin
begin try
select*from Team_D.Distributor
end try
begin catch
PRINT @@ERROR;
throw 500001 ,'invalid values fetched ',2
return 0
end catch
end 

GO
/****** Object:  StoredProcedure [Team_D].[GetAllProductOrderDetails]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetAllProductOrderDetails]
--Procedure to get all the product order details
--Developed by Maski Saijahnavi on 01/10/19
as 
begin 
	begin try 
	select*from Team_D.ProductOrderDetails
	end try
	begin catch
		PRINT @@ERROR;
		throw 500001,'Invalid Values Fetched',2
		return 0
    end catch
end

GO
/****** Object:  StoredProcedure [Team_D].[GetAllProductOrders]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[GetAllProductOrders]
--Procedure to get all the product orders
--Developed by Maski Saijahnavi on 01/10/19
as 
begin 
	begin try 
	select * from Team_D.ProductOrders
	end try
	begin catch
		PRINT @@ERROR;
		throw 500001,'Invalid Values Fetched',2
		return 0
    end catch
end

GO
/****** Object:  StoredProcedure [Team_D].[GetAllProducts]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetAllProducts]
as
--Developed by Rohit Kumar on 30/09/2019
--procedure to list all the products
begin
	select * from Team_D.Product
end
GO
/****** Object:  StoredProcedure [Team_D].[GetAllRawMaterialOrder]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [Team_D].[GetAllRawMaterialOrder]
as 
--Developed by Ritwik on 30/09/2019
--Procedure to get all the RawMaterial orders
begin 
	begin try 
	select * from Team_D.RawMaterialOrder
	end try
	begin catch
		PRINT @@ERROR;
		throw 500001,'Invalid Values Fetched',2
		return 0
    end catch
end
GO
/****** Object:  StoredProcedure [Team_D].[GetAllRawMaterials]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetAllRawMaterials]
as
--Developed by Rohit Kumar on 30/09/2019
--procedure to list all the raw materials
begin
	select * from Team_D.RawMaterial
end

GO
/****** Object:  StoredProcedure [Team_D].[GetAllSupplier]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetAllSupplier]
--Created by Pushpraj kaushik on 4/10/19
--created procedure for getting all the suppliers

as 
begin 
	begin try 
	select*from Team_D.supplier
	end try
	begin catch
		PRINT @@ERROR;
		throw 50001,'Invalid Values Fetched',2
		return 0
    end catch
end

GO
/****** Object:  StoredProcedure [Team_D].[GetAllSupplierAddress]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[GetAllSupplierAddress]
--Created by Pushpraj kaushik on 4/10/19
--created procedure for getting all the supplier address
as 
begin 
Select * FROM Team_D.supplierAddress 
end

GO
/****** Object:  StoredProcedure [Team_D].[GetAllSupplierAddressbySupplierID]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[GetAllSupplierAddressbySupplierID](@supID uniqueidentifier)
--Created by Pushpraj kaushik on 4/10/19
--created procedure for getting all the supplier address
as 
begin 

	begin try
	Select * FROM Team_D.supplierAddress where supplierID=@supID
	end try
	begin catch
	Print @@ERROR;
	throw 50001,'Invalid values fetched',8
	return 0
	end catch
	end

GO
/****** Object:  StoredProcedure [Team_D].[GetDistributoraddressByDistributorAddressID]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetDistributoraddressByDistributorAddressID](@disAddId uniqueidentifier )
 as
  --Procedure to get distributor Address by distributor Address ID.
--Developed by Sowrasree Banerjee on 01-10-2019 
 begin 
 begin try
 SELECT * FROM Team_D.DistributorAddress where DistributorAddressID=@disAddId
 end try
 begin catch
Print  @@ERROR;
throw 5001,'invalid values fetched',5
return 0
end catch
end 

GO
/****** Object:  StoredProcedure [Team_D].[GetDistributorByDistributorEmail]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE procedure [Team_D].[GetDistributorByDistributorEmail](@Email varchar(40))
as
 --Procedure to get Distributor by distributor name.
--Developed by Sowrasree Banerjee on 01-10-2019
begin
begin try
select *from Team_D.Distributor where DistributorEmail=@Email
end try
begin catch
Print @@ERROR;
throw 5001,'invalid values fetched',6
return 0
end catch
end 

GO
/****** Object:  StoredProcedure [Team_D].[GetDistributorByDistributorEmailPassword]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetDistributorByDistributorEmailPassword](@Email varchar(40),@Password varchar(15) )
as
 --Procedure to get Distributor by distributor email & password.
--Developed by Sowrasree Banerjee on 01-10-2019
begin
begin try
select *from Team_D.Distributor where DistributorEmail=@Email and DistributorPassword= @Password
end try
begin catch
Print @@ERROR;
throw 5001,'invalid values fetched',6
return 0
end catch
end 

GO
/****** Object:  StoredProcedure [Team_D].[GetDistributorByDistributorID]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetDistributorByDistributorID](@disId uniqueidentifier)
 as
  --Procedure to get distributor by distributor ID.
--Developed by Sowrasree Banerjee on 01-10-2019 
 begin 
 begin try
 SELECT * FROM Team_D.Distributor where DistributorID=@disId
 end try
 begin catch
Print  @@ERROR;
throw 5001,'invalid values fetched',5
return 0
end catch
end 

GO
/****** Object:  StoredProcedure [Team_D].[GetProductByProductCode]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetProductByProductCode](@productcode varchar (5))
as
--Developed by Rohit Kumar on 30/09/2019
--procedure to search product by Code
begin
	if exists (select ProductCode from Team_D.Product where ProductCode = @productcode)
		begin
			select * from Team_D.Product
			where ProductCode = @productcode
		end
	else
		throw 50004, 'Product Code does not exists', 1
end
GO
/****** Object:  StoredProcedure [Team_D].[GetProductByProductID]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetProductByProductID](@productid varchar (36))
as
--Developed by Rohit Kumar on 30/09/2019
--procedure to search product by ID
begin
	if exists (select ProductID from Team_D.Product where ProductID = @productid)
		begin
			select * from Team_D.Product
			where ProductID = @productid
		end
	else
		throw 50004, 'Product ID does not exists', 1
end
GO
/****** Object:  StoredProcedure [Team_D].[GetProductByProductName]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetProductByProductName](@productname varchar (30))
as
--Developed by Rohit Kumar on 30/09/2019
--procedure to search product by Name
begin
	if exists (select ProductName from Team_D.Product where ProductName = @productname)
		begin
			select * from Team_D.Product
			where ProductName = @productname
		end
	else
		throw 50004, 'Product Name does not exists', 1
end
GO
/****** Object:  StoredProcedure [Team_D].[GetProductOrderbyProductOrderID]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [Team_D].[GetProductOrderbyProductOrderID](@ProductOrderID uniqueidentifier)
--Procedure to get order by OrderID
--Developed by Maski Saijahnavi on 01/10/19
as 
begin
	begin try
		SELECT* FROM Team_D.ProductOrders where ProductOrderID=@ProductOrderID
	end try
	begin catch
	PRINT @@ERROR;
		throw 5001,'Invalid Values Fetched',6
		return 0
    end catch
end

GO
/****** Object:  StoredProcedure [Team_D].[GetProductOrdersByDistributorID]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetProductOrdersByDistributorID](@DistributorID uniqueidentifier)
as 
begin
	begin try
		SELECT * FROM Team_D.ProductOrders where DistributorID=@DistributorID
	end try
	begin catch
	PRINT @@ERROR;
		throw 5000001,'Invalid Values Fetched',6
		return 0
    end catch
end

GO
/****** Object:  StoredProcedure [Team_D].[GetProductOrdersByOrderDate]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[GetProductOrdersByOrderDate](@ProductOrderDate datetime)
--Procedure to get Product Orders by Date
--Developed by Maski Saijahnavi on 01/10/19
as 
begin
	begin try
		SELECT * FROM Team_D.ProductOrders where ProductOrderDate=@ProductOrderDate
	end try
	begin catch
	PRINT @@ERROR;
		throw 5001,'Invalid Values Fetched',6
		return 0
    end catch
end

GO
/****** Object:  StoredProcedure [Team_D].[GetProductsByProductType]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetProductsByProductType](@producttype varchar (12))
as
--Developed by Rohit Kumar on 30/09/2019
--procedure to search product by Code
begin
	if exists (select ProductType from Team_D.Product where ProductType = @producttype)
		begin
			select * from Team_D.Product
			where ProductType = @producttype
		end
	else
		throw 50004, 'Product Type does not exists', 1
end
GO
/****** Object:  StoredProcedure [Team_D].[GetRawMaterialByRawMaterialCode]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetRawMaterialByRawMaterialCode](@rawmaterialcode varchar (5))
as
--Developed by Rohit Kumar on 30/09/2019
--procedure to search raw material by code
begin
	if exists (select RawMaterialCode from Team_D.RawMaterial where RawMaterialCode = @rawmaterialcode)
		begin
			select * from Team_D.RawMaterial
			where RawMaterialCode = @rawmaterialcode
		end
	else
		throw 50004, 'Raw Material Code does not exists', 1
end
GO
/****** Object:  StoredProcedure [Team_D].[GetRawMaterialByRawMaterialID]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetRawMaterialByRawMaterialID](@rawmaterialid varchar (36))
as
--Developed by Rohit Kumar on 30/09/2019
--procedure to search raw material by id
begin
	if exists (select RawMaterialName from Team_D.RawMaterial where RawMaterialID = @rawmaterialid)
		begin
			select * from Team_D.RawMaterial
			where RawMaterialID = @rawmaterialid
		end
	else
		throw 50004, 'Raw Material ID does not exists', 1
end
GO
/****** Object:  StoredProcedure [Team_D].[GetRawMaterialByRawMaterialName]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetRawMaterialByRawMaterialName](@rawmaterialname varchar (40))
as
--Developed by Rohit Kumar on 30/09/2019
--procedure to search raw material by name
begin
	if exists (select RawMaterialName from Team_D.RawMaterial where RawMaterialName = @rawmaterialname)
		begin
			select * from Team_D.RawMaterial
			where RawMaterialName = @rawmaterialname
		end
	else
		throw 50004, 'Raw Material Name does not exists', 1
end
GO
/****** Object:  StoredProcedure [Team_D].[GetSupplierAddressbySupplierAddressID]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetSupplierAddressbySupplierAddressID](@supAdID uniqueidentifier)
--Created by Pushpraj kaushik on 4/10/19
--created procedure for getting the supplier address by suppplier address ID
as 
begin
	if exists (select supplierAddressID from Team_D.supplierAddress where supplierAddressID=@supAdID)
	begin
	SELECT * FROM Team_D.supplierAddress where supplierAddressID=@supAdID
	end
	else
	throw 50001,'Invalid Values Fetched',3
end

GO
/****** Object:  StoredProcedure [Team_D].[GetSupplierbyEmail]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetSupplierbyEmail](@supEmail varchar(50))
--Created by Pushpraj kaushik on 4/10/19
--created procedure for getting the supplier by email
as
begin
if exists (select supplierEmail from Team_D.supplier where supplierEmail = @supEmail)
		begin
			select* from Team_D.supplier
			where supplierEmail = @supEmail
		end
	else 
		throw 50003, 'supplier Email does not exists', 1			
end

GO
/****** Object:  StoredProcedure [Team_D].[GetSupplierbySupplierEmailandPass]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[GetSupplierbySupplierEmailandPass](@supEmail varchar(50) ,@supPass varchar(15))
--Created by Pushpraj kaushik on 4/10/19
--created procedure for getting the supplier by email and password
as
begin
if exists (select supplierEmail,supplierPassword from Team_D.supplier where supplierEmail = @supEmail and supplierPassword = @supPass)
		begin
			SELECT* FROM Team_D.supplier where supplierEmail=@supEmail and supplierPassword=@supPass

		end
	else 
		throw 50003, 'supplier Email and password does not exists', 1			
end

GO
/****** Object:  StoredProcedure [Team_D].[GetSupplierbySupplierID]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetSupplierbySupplierID](@supID uniqueidentifier)
--Created by Pushpraj kaushik on 4/10/19
--created procedure for getting supplier by supplier ID
as
begin
if exists (select supplierID from Team_D.supplier where supplierID = @supID)
		begin
			select* from Team_D.supplier
			where supplierID = @supID
		end
	else 
		throw 50003, 'supplier id does not exists', 1			
end

GO
/****** Object:  StoredProcedure [Team_D].[GetSupplierbySupplierName]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[GetSupplierbySupplierName]( @supName varchar(40))
--Created by Pushpraj kaushik on 4/10/19
--created procedure for getting all the suppliers by their name
as
begin
if exists (select supplierName from Team_D.supplier where supplierName = @supName)
		begin
			select* from Team_D.supplier
			where supplierName = @supName
		end
	else 
		throw 50003, 'supplier name does not exists', 1			
end

GO
/****** Object:  StoredProcedure [Team_D].[UpdateDistributor]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[UpdateDistributor](@disId uniqueidentifier,
 @disName varchar(40),
  @disMob char(10),
  @disEmail varchar(30)
  )
 as
 --Procedure to update distributor in table.
--Developed by Sowrasree Banerjee on 01-10-2019 
 begin
 begin try
 UPDATE Team_D.Distributor
 SET DistributorName=@disName, DistributorMobile=@disMob,DistributorEmail=@disEmail
 WHERE DistributorID=@disId
 end try
 begin catch
 Print @@ERROR;
 throw 500001,'invalid values fetched',4
 return 0
 end catch
 end 

GO
/****** Object:  StoredProcedure [Team_D].[UpdateDistributorAddress]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [Team_D].[UpdateDistributorAddress](@disAdID uniqueidentifier,@AdLine1 varchar(255),@AdLine2 varchar(255),@pcode char(6),@city varchar(20),@state varchar(20))
--Created by Sowrasree on 4/10/19
--created procedure for updating the supplier address
as
begin
    if @disAdID IS NULL
	throw 50003, 'Distributor Address ID cannot be empty', 1
	--if @supID IS NULL
	--throw 50003, 'DistributorID cannot be empty', 1
	if @AdLine1 IS NULL OR @AdLine1=''
	throw 50001,'Invalid Adress line1',3
	if @AdLine2 IS NULL OR @AdLine2=''
	throw 50001,'Invalid Address line2',4
	if @pcode IS NULL OR @pcode=''
	throw 50001,'Invalid PinCode',5
	if @city IS NULL OR @city=''
	throw 50001,'Invalid City name',6
	if @State IS NULL OR @State=''
	throw 50001,'Invalid State name',7

	
	if exists (select DistributoraddressID from Team_D.DistributorAddress where DistributoraddressID = @disAdID)
		begin
			update Team_D.DistributorAddress
			set	 AddressLine1=@AdLine1,AddressLine2=@AdLine2,PinCode=@pcode,City=@city,DistributorState=@state
			where DistributoraddressID = @disAdID
		end
	else 
		throw 50003, 'distributor address id does not exists', 1			
end
GO
/****** Object:  StoredProcedure [Team_D].[UpdateProduct]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Team_D].[UpdateProduct](@productid varchar(36), @productname varchar(30), @productcode varchar(5),
	@productunitprice int, @lastmodifieddatetime datetime)
as
--Developed by Rohit Kumar on 30/09/2019
--procedure to update a product
begin
	if @productname = ''
	throw 50001, 'Product Name cannot be empty', 1
	if exists (Select ProductName from Team_D.Product where ProductName = @productname)
	throw 50002, 'Product with same name already exists', 1
	if @productcode = ''
	throw 50003, 'Product Code cannot be empty', 1
	if exists (Select ProductCode from Team_D.Product where ProductCode = @productcode)
	throw 50004, 'Product with same code already exists', 1
	if @productunitprice <= 0
	throw 50005, 'Product Price cannot be less than or equal to zero', 1
	
	if exists (select ProductID from Team_D.Product where ProductID = @productid)
		begin
			update Team_D.Product
			set	ProductName = @productname,
				ProductCode = @productcode,
				ProductUnitPrice = @productunitprice,
				LastUpdateDateTime = sysdatetime()
			where ProductID = @productid
		end
	else 
		throw 50003, 'Raw material id does not exists', 1			
end
GO
/****** Object:  StoredProcedure [Team_D].[UpdateProductOrder]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[UpdateProductOrder](@ProductOrderID uniqueidentifier,@ProductOrderAmount decimal, @PaymentStatus bit,@TotalQuantity decimal)
--Procedure to update product order
--Developed by Maski Saijahnavi on 01/10/19
as 
begin
	begin try
		UPDATE Team_D.ProductOrders
		SET ProductOrderAmount=@ProductOrderAmount,PaymentStatus =@PaymentStatus, TotalQuantity= @TotalQuantity
		WHERE ProductOrderID=@ProductOrderID
	end try
	begin catch
	PRINT @@ERROR;
		throw 500001,'Invalid Values Fetched',4
		return 0
    end catch
end

GO
/****** Object:  StoredProcedure [Team_D].[UpdateRawMaterial]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[UpdateRawMaterial](@rawmaterialid uniqueidentifier, @rawmaterialname varchar(30), @rawmaterialcode varchar(5),
	@rawmaterialunitprice int, @lastmodifieddatetime datetime)
as
--Developed by Rohit Kumar on 30/09/2019
--procedure to update a raw material
begin
	if @rawmaterialname = ''
	throw 50001, 'Raw Material Name cannot be empty', 1
	if exists (Select RawMaterialName from Team_D.RawMaterial where RawMaterialName = @rawmaterialname)
	throw 50002, 'Raw Material with same name already exists', 1
	if @rawmaterialcode = ''
	throw 50003, 'Raw Material Code cannot be empty', 1
	if exists (Select RawMaterialCode from Team_D.RawMaterial where RawMaterialCode = @rawmaterialcode)
	throw 50004, 'Raw Material with same code already exists', 1
	if @rawmaterialunitprice <= 0
	throw 50005, 'Raw material Price cannot be less than or equal to zero', 1
	
	if exists (select RawMaterialID from Team_D.RawMaterial where RawMaterialID = @rawmaterialid)
		begin
			update Team_D.RawMaterial
			set	RawMaterialName = @rawmaterialname,
				RawMaterialCode = @rawmaterialcode,
				RawMaterialUnitPrice = @rawmaterialunitprice,
				LastUpdateDateTime = sysdatetime()
			where RawMaterialID = @rawmaterialid
		end
	else 
		throw 50003, 'Raw material id does not exists', 1			
end
GO
/****** Object:  StoredProcedure [Team_D].[UpdateSupplier]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[UpdateSupplier]( @supID uniqueidentifier,@supName varchar(40), @supMob char(10),@supEmail varchar(50) )
--Created by Pushpraj kaushik on 4/10/19
--created procedure for updating the supplier details
as 
begin
	if @supName = ''
	throw 50003, 'SupplierName cannot be empty', 1
	
	if @supEmail = ''
	throw 50003, 'SupplierEmail cannot be empty', 1
		
	
	if exists (select supplierID from Team_D.supplier where supplierID = @supID)
		begin
			update Team_D.supplier
			set	supplierName = @supname,
				supplierID = @supID,
				supplierEmail = @supEmail,
				supplierMobile= @supMob
			where supplierID = @supID
		end
	else 
		throw 50003, 'supplier id does not exists', 1			
end
	select @@ROWCOUNT


GO
/****** Object:  StoredProcedure [Team_D].[UpdateSupplierAddress]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[UpdateSupplierAddress](@supAdID uniqueidentifier,@AdLine1 varchar(255),@AdLine2 varchar(255),@pcode char(6),@city varchar(20),@state varchar(20))
--Created by Pushpraj kaushik on 4/10/19
--created procedure for updating the supplier address
as
begin
    if @supAdID IS NULL
	throw 50003, 'Supplier Address ID cannot be empty', 1
	--if @supID IS NULL
	--throw 50003, 'SupplierID cannot be empty', 1
	if @AdLine1 IS NULL OR @AdLine1=''
	throw 50001,'Invalid Adress line1',3
	if @AdLine2 IS NULL OR @AdLine2=''
	throw 50001,'Invalid Address line2',4
	if @pcode IS NULL OR @pcode=''
	throw 50001,'Invalid PinCode',5
	if @city IS NULL OR @city=''
	throw 50001,'Invalid City name',6
	if @State IS NULL OR @State=''
	throw 50001,'Invalid State name',7

	
	if exists (select supplierAddressID from Team_D.supplierAddress where supplierAddressID = @supAdID)
		begin
			update Team_D.supplierAddress
			set	 AddressLine1=@AdLine1,AddressLine2=@AdLine2,PinCode=@pcode,City=@city,State=@state
			where supplierAddressID = @supAdID
		end
	else 
		throw 50003, 'supplier address id does not exists', 1			
end
GO
/****** Object:  StoredProcedure [Team_D].[UpdateSupplierPass]    Script Date: 06-11-2019 09:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Team_D].[UpdateSupplierPass](@supID uniqueidentifier, @supName varchar(40))--@supPass varchar(15))
--Created by Pushpraj kaushik on 4/10/19
--created procedure for updating the supplier by password 
as
begin
		if exists (select supplierID from Team_D.supplier where supplierID = @supID)
		begin
			update supplier
			set	supplierName = @supname,
				supplierID = @supID
				--supplierPassword = @supPass
			where supplierID = @supID
		end
	else 
		throw 50003, 'supplier id does not exists', 1			
end


GO
