CREATE DATABASE Accountancy;
GO
USE Accountancy;
GO

CREATE SCHEMA Manager;
GO
CREATE SCHEMA Product;
GO
CREATE SCHEMA Customer;
GO

CREATE TABLE [Manager].[Admin]
(
	[Id]			int	identity(1,1)	PRIMARY KEY,
	[FirstName]		nvarchar(20)		NOT NULL,
	[LastName]		nvarchar(20)		NOT NULL,
	[Password]		varchar(128)		NOT NULL,
	[Email]			varchar(max)		NOT NULL,
	[PhoneNumber]	varchar(12)			NOT NULL,
	[Address]		nvarchar(max)		NULL,
	[ParentId]		int					NULL,
	[Date]			datetime			NOT NULL
	CONSTRAINT [DF_Manager_Admin_Date]
	DEFAULT getdate()
);
GO

CREATE TABLE [Manager].[Seller]
(
	[Id]			int	identity(1,1)	PRIMARY KEY,
	[FirstName]		nvarchar(20)		NOT NULL,
	[LastName]		nvarchar(20)		NOT NULL,
	[Password]		varchar(128)		NOT NULL,
	[Email]			varchar(max)		NOT NULL,
	[PhoneNumber]	varchar(12)			NOT NULL,
	[Date]			datetime			NOT NULL,
	[Active]		bit					NOT NULL,
	[AdminId]		int					NOT NULL,
	[Address]		nvarchar(max)		NULL,
);
GO

ALTER TABLE [Manager].[Seller]
ADD CONSTRAINT [DF_Manager_Seller_Date]	DEFAULT(getdate()) FOR [Date],
	CONSTRAINT [DF_Manager_Seller_Active] DEFAULT(1) FOR [Active],
	CONSTRAINT [FK_Manager_Seller_Manager_Admin_Id]	FOREIGN KEY([AdminId])
	REFERENCES [Manager].[Admin]([Id])
	ON DELETE NO ACTION;
GO

CREATE TABLE [Category]
(
	[Id]			int identity(0,1)	PRIMARY KEY,
	[Name]			nvarchar(25)		NOT NULL,
	[ParentId]		int					NULL
	CONSTRAINT [DF_Category_Parent_Id]
	DEFAULT 0
);
GO

INSERT INTO [Category]
VALUES
(
	N'Œ«‰Â',NULL
);
GO


CREATE TABLE [Product].[Product]
(
	[Id]			int identity(1,1)	PRIMARY KEY,
	[Name]		    nvarchar(100)		NOT NULL,
	[Date]			datetime			NOT NULL,
	[BuyPrice]		bigint				NOT NULL,
	[SellPrice]		bigint				NOT NULL,
	[LastInventory]	int					NOT NULL,
	[AdminId]		int					NOT NULL,
	[Description]	nvarchar(max)		NULL,
);
GO

ALTER TABLE [Product].[Product]
ADD CONSTRAINT [DF_Product_Product_Date] DEFAULT(getdate()) FOR [Date],
	CONSTRAINT [FK_Product_Product_Manager_Admin_Id] FOREIGN KEY([AdminId])
	REFERENCES [Manager].[Admin]([Id])
	ON DELETE NO ACTION;
GO

CREATE TABLE [Product].[Category]
(
	[Id]			int identity(1,1)	PRIMARY KEY,
	[ProductId]		int					NOT NULL,
	[CategoryId]	int					NOT NULL,
);
GO

ALTER TABLE [Product].[Category]
ADD CONSTRAINT [FK_Product_Category_Product_Product_Id] FOREIGN KEY([ProductId])
	REFERENCES [Product].[Product]([Id])
	ON DELETE NO ACTION,
	CONSTRAINT [FK_Product_Category_Category_Id] FOREIGN KEY([CategoryId])
	REFERENCES [Category]([Id])
	ON DELETE NO ACTION;
GO

CREATE TABLE [Product].[Image]
(
	[Id]			int identity(1,1)	PRIMARY KEY,
	[Image]			binary				NOT NULL,
	[Product_Id]	int					NOT NULL,
);
GO

ALTER TABLE [Product].[Image]
ADD CONSTRAINT [FK_Product_Image_Product_Product_Id] FOREIGN KEY([Product_Id])
	REFERENCES [Product].[Product]([Id])
	ON DELETE NO ACTION;
GO

CREATE TABLE [Product].[Price]
(
	[Id]			int identity(1,1)	PRIMARY KEY,
	[Price]			bigint				NOT NULL,
	[Date]			datetime			NOT NULL,
	[ProductId]		int					NOT NULL,
    [AdminId]       int                 NOT NULL,
	[Description]	nvarchar(max)		NULL,
);
GO

ALTER TABLE [Product].[Price]
ADD CONSTRAINT [DF_Product_Price_Date] DEFAULT(getdate()) FOR [Date],
	CONSTRAINT [FK_Product_Price_Product_Product_Id] FOREIGN KEY(ProductId)
	REFERENCES [Product].[Product]([Id])
	ON DELETE NO ACTION,
    CONSTRAINT [FK_Product_Price_Manager_Admin_Id] FOREIGN KEY([AdminId])
    REFERENCES [Manager].[Admin]([Id])
	ON DELETE NO ACTION;
GO

CREATE TABLE [Product].[Inventory]
(
	[Id]			int identity(1,1)	PRIMARY KEY,
	[Qty]		    int					NOT NULL,
	[Date]			datetime			NOT NULL,
	[ProductId]		int					NOT NULL,
	[Description]	nvarchar(max)		NULL,
);
GO

ALTER TABLE [Product].[Inventory]
ADD CONSTRAINT [DF_Product_Inventory_Date] DEFAULT(getdate()) FOR [Date],
	CONSTRAINT [FK_Product_Inventory_Product_Product_Id] FOREIGN KEY([ProductId])
	REFERENCES [Product].[Product]([Id])
	ON DELETE NO ACTION;
GO

CREATE TABLE [Product].[InventoryAdmin]
(
	[Id]			int identity(1,1)	PRIMARY KEY,
	[InventoryId]	int					NOT NULL,
	[AdminId]		int					NOT NULL,
);
GO

ALTER TABLE [Product].[InventoryAdmin]
ADD CONSTRAINT [FK_Product_InventoryAdmin_Product_Inventory_Id] FOREIGN KEY([InventoryId])
	REFERENCES [Product].[Inventory]([Id])
	ON DELETE NO ACTION,
	CONSTRAINT [FK_Product_InventoryAdmin_Manager_Admin_Id] FOREIGN KEY ([AdminId])
	REFERENCES [Manager].[Admin]([Id])
	ON DELETE NO ACTION;
GO

CREATE TABLE [Product].[InventorySeller]
(
	[Id]			int identity(1,1)	PRIMARY KEY,
	[InventoryId]	int					NOT NULL,
	[SellerId]		int					NOT NULL,
	[OrderId]		int					NOT NULL
);
GO

CREATE TABLE [Customer].[Customer]
(
	[Id]			int identity(1,1)	PRIMARY KEY,
	[FirstName]		nvarchar(20)		NOT NULL,
	[LastName]		nvarchar(20)		NOT NULL,
	[Email]			varchar(max)		NULL,
	[Address]		nvarchar(max)		NULL,
	[PhoneNumber]	varchar(12)			NULL,
	[Date]			datetime			NOT NULL,
	[SellerId]		int					NOT NULL,
);
GO

ALTER TABLE [Customer].[Customer]
ADD CONSTRAINT [DF_Customer_Customer_Date] DEFAULT(getdate()) FOR [Date],
	CONSTRAINT [FK_Customer_Customer_Manager_Seller_Id] FOREIGN KEY([SellerId])
	REFERENCES [Manager].[Seller]([Id])
	ON DELETE NO ACTION;
GO

CREATE TABLE [Customer].[Order]
(
	[Id]			int identity(1,1)	PRIMARY KEY,
	[CustomerId]	int					NOT NULL,
	[SellerId]		int					NOT NULL,
	[ProductId]		int					NOT NULL,
	[Qty]			int					NOT NULL,
	[Price]			bigint				NOT NULL,
	[Date]			datetime			NOT NULL,
);
GO

ALTER TABLE [Customer].[Order]
ADD CONSTRAINT [DF_Customer_Order_Date] DEFAULT(getdate()) FOR [Date],
	CONSTRAINT [FK_Customer_Order_Customer_Customer_Id] FOREIGN KEY([CustomerId])
	REFERENCES [Customer].[Customer]([Id])
	ON DELETE NO ACTION,
	CONSTRAINT [FK_Customer_Order_Manager_Seller_Id] FOREIGN KEY([SellerId])
	REFERENCES [Manager].[Seller]([Id])
	ON DELETE NO ACTION,
	CONSTRAINT [FK_Customer_Order_Product_Product_Id] FOREIGN KEY([ProductId])
	REFERENCES [Product].[Product]([Id])
	ON DELETE NO ACTION;
GO

ALTER TABLE [Product].[InventorySeller]
ADD CONSTRAINT [FK_Product_Inventory_Product_Inventory_Id] FOREIGN KEY([InventoryId])
	REFERENCES [Product].[Inventory]([Id])
	ON DELETE NO ACTION,
	CONSTRAINT [FK_Product_Inventory_Manager_Seller_Id] FOREIGN KEY([SellerId])
	REFERENCES [Manager].[Seller]([Id])
	ON DELETE NO ACTION,
	CONSTRAINT [FK_Product_Inventory_Customer_Order_Id] FOREIGN KEY([OrderId])
	REFERENCES [Customer].[Order]([Id])
	ON DELETE NO ACTION;
GO



-- Trigger After Add A Product
CREATE TRIGGER [TRG_Product_Product_For_Insert]
ON [Product].[Product]
AFTER INSERT
AS
BEGIN
	DECLARE	@Inventory TABLE([Id] int)

	-- Insert Sell Price To Price Table
	INSERT INTO [Product].[Price]
	(
		[ProductId],
		[Price],
		[AdminId],
		[Date],
		[Description]
	)
	SELECT Id,
			SellPrice,
			AdminId,
			Date,
			NULL
	FROM inserted;

	-- Insert Last Inventory To Inventory Table
	INSERT INTO [Product].[Inventory]
	(
		[ProductId],
		[Qty],
		[Date],
		[Description]
	)
	OUTPUT inserted.Id INTO @Inventory
	SELECT [Id],
			[LastInventory],
			[Date],
			NULL
	FROM inserted;

	-- Who Added The Inventory
	INSERT INTO [Product].[InventoryAdmin]
	(
		[InventoryId],
		[AdminId]
	)
	SELECT t.Id,
	i.AdminId
	FROM @Inventory t
	CROSS JOIN
	inserted i;
END;
GO

-- Trigger If Change Price A Product
CREATE TRIGGER [TRG_Product_Price_For_Insert]
ON [Product].[Price]
AFTER INSERT
AS
BEGIN
	IF NOT EXISTS
	(
		SELECT 1
		FROM [Product].[Product] p
		WHERE [p].[Id] = (SELECT [i].[ProductId] FROM [inserted] i) AND
				[p].[Date] = (SELECT i.[Date] FROM [inserted] i)
	)
	BEGIN
		UPDATE [Product].[Product]
		SET [SellPrice] = [inserted].[Price]
		FROM [inserted]
		WHERE [Product].[Product].[Id] = [inserted].[ProductId]
	END
END;
GO

-- Trigger If Increase Or Decrease Inventory
CREATE TRIGGER [TRG_Product_Inventory_For_Insert]
ON [Product].[Inventory]
AFTER INSERT
AS
BEGIN
	IF NOT EXISTS
	(
		SELECT 1
		FROM [Product].[Product] p
		WHERE p.[Id] = (SELECT i.[ProductId] FROM inserted i) AND
				p.[Date]=(SELECT i.[Date] FROM inserted i)
				
	)
	BEGIN
		UPDATE [Product].[Product]
		SET [LastInventory] = [LastInventory] + [inserted].[Qty]
		FROM [inserted]
		WHERE [Product].[Product].[Id] = [inserted].[ProductId]
	END
END;
GO

-- Trigger After Order A Product
CREATE TRIGGER [TRG_Customer_Order_For_Insert]
ON [Customer].[Order]
AFTER INSERT
AS
BEGIN
	DECLARE @CustomerOrderQty int
	SET @CustomerOrderQty = (SELECT Qty FROM inserted);
	IF
	(
		SELECT [LastInventory]
		FROM [Product].[Product] p
		WHERE [p].[Id] = (SELECT [i].[ProductId] FROM [inserted] i)
	) < @CustomerOrderQty
	BEGIN
		PRINT('You Can Not Add Order Product With This Qty')
		ROLLBACK TRANSACTION;
	END
	ELSE
	BEGIN
		DECLARE @ProductInventory TABLE ([Id] int)
		INSERT INTO [Product].[Inventory]
		(
			[ProductId],
			[Qty],
			[Date],
			[Description]
		)
		OUTPUT inserted.Id INTO @ProductInventory
		SELECT [ProductId],
				-[Qty],
				[Date],
				N'›—ÊŒ Â ‘œ'
		FROM inserted

		INSERT INTO [Product].[InventorySeller]
		(
			[InventoryId],
			[SellerId],
			[OrderId]
		)
		SELECT p.Id,
				i.SellerId,
				i.Id
		FROM inserted i
		CROSS JOIN
		@ProductInventory p

	END
END;
GO