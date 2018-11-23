USE Accountancy;
GO

-- Manager Admin Id Inserted
DECLARE @IdentityOutputManagerAdmin1 TABLE([Id] int)
DECLARE @IdentityOutputManagerAdmin2 TABLE([Id] int)
DECLARE @IdentityOutputManagerAdmin3 TABLE([Id] int)
DECLARE @IdentityOutputManagerAdmin4 TABLE([Id] int)
DECLARE @IdentityOutputManagerAdmin5 TABLE([Id] int)

-- Manager Seller Id Inserted
DECLARE @IdentityOuputManagerSeller1 TABLE([Id] int)
DECLARE @IdentityOuputManagerSeller2 TABLE([Id] int)
DECLARE @IdentityOuputManagerSeller3 TABLE([Id] int)
DECLARE @IdentityOuputManagerSeller4 TABLE([Id] int)
DECLARE @IdentityOuputManagerSeller5 TABLE([Id] int)

-- Category Id Inserted
DECLARE @IdentityOutputCategory1 TABLE([Id] int)
DECLARE @IdentityOutputCategory2 TABLE([Id] int)
DECLARE @IdentityOutputCategory3 TABLE([Id] int)
DECLARE @IdentityOutputCategory4 TABLE([Id] int)
DECLARE @IdentityOutputCategory5 TABLE([Id] int)
DECLARE @IdentityOutputCategory6 TABLE([Id] int)
DECLARE @IdentityOutputCategory7 TABLE([Id] int)
DECLARE @IdentityOutputCategory8 TABLE([Id] int)

-- Product Product Id Inserted
DECLARE @IdentityOutputProductProduct1 TABLE([Id] int)
DECLARE @IdentityOutputProductProduct2 TABLE([Id] int)
DECLARE @IdentityOutputProductProduct3 TABLE([Id] int)
DECLARE @IdentityOutputProductProduct4 TABLE([Id] int)
DECLARE @IdentityOutputProductProduct5 TABLE([Id] int)

-- Customer Customer Id Inserted
DECLARE @IdentityOutputCustomerCustomer1 TABLE([Id] int)
DECLARE @IdentityOutputCustomerCustomer2 TABLE([Id] int)
DECLARE @IdentityOutputCustomerCustomer3 TABLE([Id] int)
DECLARE @IdentityOutputCustomerCustomer4 TABLE([Id] int)
DECLARE @IdentityOutputCustomerCustomer5 TABLE([Id] int)

-- Insert Manager.Admin 1
INSERT INTO [Manager].[Admin]
(
	[FirstName],
	[LastName],
	[Password],
	[Email],
	[PhoneNumber],
	[Address],
	[ParentId],
	[Date]
)
OUTPUT inserted.Id INTO @IdentityOutputManagerAdmin1
VALUES
(
	N'بهرام',
	N'رجبی',
	'00001111222233334444',
	'bahram.rajabiws@gmail.com',
	'09213972466',
	N'تهران / خیابان گلستان / کوچه ی شکوفه ساختمان آذر پلاک 41',
	NULL,
	DEFAULT
);

-- Insert Manager.Admin 2
INSERT INTO [Manager].[Admin]
(
	[FirstName],
	[LastName],
	[Password],
	[Email],
	[PhoneNumber],
	[Address],
	[ParentId],
	[Date]
)
OUTPUT inserted.Id INTO @IdentityOutputManagerAdmin2
VALUES
(
	N'مجید',
	N'زنجیران',
	'Majid147',
	'Majid271998@gmail.com',
	'09024648776',
	N'قم / نیروگاه / انتهای بلوار یادگار امام / کوچه ۶۱ / پلاک ۵۲',
	(SELECT [Id] FROM @IdentityOutputManagerAdmin1),
	DEFAULT
);

--Insert Manager.Admin 3
INSERT INTO [Manager].[Admin]
(
	[FirstName],
	[LastName],
	[Password],
	[Email],
	[PhoneNumber],
	[Address],
	[ParentId],
	[Date]
)
OUTPUT inserted.Id INTO @IdentityOutputManagerAdmin3
VALUES
(
	N'علی',
	N'مرادی',
	'M147159123',
	'AliMoradi@gmail.com',
	'09102345678',
	N'قم / نیروگاه / انتهای بلوار یادگار امام / کوچه 34 / پلاک 20',
	(SELECT [Id] FROM @IdentityOutputManagerAdmin1),
	DEFAULT
);

-- Insert Manager.Admin 4
INSERT INTO [Manager].[Admin]
(
	[FirstName],
	[LastName],
	[Password],
	[Email],
	[PhoneNumber],
	[Address],
	[ParentId],
	[Date]
)
OUTPUT inserted.Id INTO @IdentityOutputManagerAdmin4
VALUES
(
	N'رضا',
	N'فراهانی',
	'Reza343536',
	'Rezafarahani23@gmail.com',
	'09191474546',
	N'قم / نیروگاه / انتهای بلوار یادگار امام / کوچه 1 / پلاک 1',
	(SELECT [Id] FROM @IdentityOutputManagerAdmin3),
	DEFAULT
);

-- Insert Manager.Admin 5
INSERT INTO [Manager].[Admin]
(
	[FirstName],
	[LastName],
	[Password],
	[Email],
	[PhoneNumber],
	[Address],
	[ParentId],
	[Date]
)
OUTPUT inserted.Id INTO @IdentityOutputManagerAdmin5
VALUES
(
	N'علیرضا',
	N'فراهانی',
	'AReza23124',
	'Alifarahan12344@gmail.com',
	'09126499979',
	N'قم / نیروگاه / انتهای بلوار یادگار امام /  کوچه ۳۵/ پلاک ۳۲',
	(SELECT [Id] FROM @IdentityOutputManagerAdmin2),
	DEFAULT
);

-- Insert Manager Seller 1
INSERT INTO [Manager].[Seller]
(
	[FirstName],
	[LastName],
	[Password],
	[Email],
	[PhoneNumber],
	[Date],
	[Active],
	[AdminId],
	[Address]
)
OUTPUT inserted.Id INTO @IdentityOuputManagerSeller1
VALUES
(
	N'حسن',
	N'جبالی',
	'111122223333444455556666',
	'hasanjebali@gmail.com',
	'09191111222',
	DEFAULT,
	DEFAULT,
	(SELECT [Id] FROM @IdentityOutputManagerAdmin1),
	N'قم / صفاییه /خیابان فردوس / کوچه ی حکیم / پلاک 4'
 );

-- Insert Manager Seller 2
INSERT INTO [Manager].[Seller]
(
	[FirstName],
	[LastName],
	[Password],
	[Email],
	[PhoneNumber],
	[Date],
	[Active],
	[AdminId],
	[Address]
)
OUTPUT inserted.Id INTO @IdentityOuputManagerSeller2
VALUES
(
	N'میثم',
	N'بختیاری',
	'1234567891190',
	'meysambakhtiari@gmail.com',
	'09131211222',
	DEFAULT,
	DEFAULT,
	(SELECT [Id] FROM @IdentityOutputManagerAdmin2),
	N'قم / صفاییه /خیابان فردوس / کوچه ی فرشته / پلاک 6'
 );

-- Insert Manager Seller 3
INSERT INTO [Manager].[Seller]
(
	[FirstName],
	[LastName],
	[Password],
	[Email],
	[PhoneNumber],
	[Date],
	[Active],
	[AdminId],
	[Address]
)
OUTPUT inserted.Id INTO @IdentityOuputManagerSeller3
VALUES
(
	N'محمد',
	N'حبیبی',
	'17181920304050',
	'mohammad.habibi@gmail.com',
	'09221213422',
	DEFAULT,
	DEFAULT,
	(SELECT [Id] FROM @IdentityOutputManagerAdmin3),
	N'قم / صفاییه /خیابان شهید باکری / کوچه ی بنفشه / پلاک 18'
);

-- Insert Manager Seller 4
INSERT INTO [Manager].[Seller]
(
	[FirstName],
	[LastName],
	[Password],
	[Email],
	[PhoneNumber],
	[Date],
	[Active],
	[AdminId],
	[Address]
)
OUTPUT inserted.Id INTO @IdentityOuputManagerSeller4
VALUES
(
	N'فریبرز',
	N'رجبی',
	'9090k03nnt',
	'fariborzrajabi@gmail.com',
	'09221157822',
	DEFAULT,
	DEFAULT,
	(SELECT [Id] FROM @IdentityOutputManagerAdmin1),
	N'قم / صفاییه /خیابان فرمانیه / کوچه ی تختی / پلاک 30'
);

-- Insert Manager Seller 5
INSERT INTO [Manager].[Seller]
(
	[FirstName],
	[LastName],
	[Password],
	[Email],
	[PhoneNumber],
	[Date],
	[Active],
	[AdminId],
	[Address]
)
OUTPUT inserted.Id INTO @IdentityOuputManagerSeller5
VALUES
(
	N'مونا',
	N'برزویی',
	'mona124568',
	'monaborzoie@gmail.com',
	'09228585753',
	DEFAULT,
	DEFAULT,
	(SELECT [Id] FROM @IdentityOutputManagerAdmin5),
	N'قم / صفاییه /خیابان حکیمیه / کوچه ی مازنی / پلاک 50'
);

-- Insert Category 1
INSERT INTO Category
(
	[Name],
	[ParentId]
)
OUTPUT inserted.Id INTO @IdentityOutputCategory1
VALUES
(
	N'کالای دیجیتال',
	DEFAULT
);

-- Insert Category 2
INSERT INTO Category
(
	[Name],
	[ParentId]
)
OUTPUT inserted.Id INTO @IdentityOutputCategory2
VALUES
(
	N'موبایل',
	(SELECT [Id] FROM @IdentityOutputCategory1)
);

-- Insert Category 3
INSERT INTO Category
(
	[Name],
	[ParentId]
)
OUTPUT inserted.Id INTO @IdentityOutputCategory3
VALUES
(
	N'تبلت و کتابخوان',
	(SELECT [Id] FROM @IdentityOutputCategory1)
);

-- Insert Category 4
INSERT INTO Category
(
	[Name],
	[ParentId]
)
OUTPUT inserted.Id INTO @IdentityOutputCategory4
VALUES
(
	N'لپ تاپ',
	(SELECT [Id] FROM @IdentityOutputCategory1)
);

-- Insert Category 5
INSERT INTO Category
(
	[Name],
	[ParentId]
)
OUTPUT inserted.Id INTO @IdentityOutputCategory5
VALUES
(
	N'دوربین',
	(SELECT [Id] FROM @IdentityOutputCategory1)
);

-- Insert Category 6
INSERT INTO Category
(
	[Name],
	[ParentId]
)
OUTPUT inserted.Id INTO @IdentityOutputCategory6
VALUES
(
	'Samsung',
	(SELECT [Id] FROM @IdentityOutputCategory2)
);

-- Insert Category 7
INSERT INTO Category
(
	[Name],
	[ParentId]
)
OUTPUT inserted.Id INTO @IdentityOutputCategory7
VALUES
(
	'Asus',
	(SELECT [Id] FROM @IdentityOutputCategory4)
);

-- Insert Category 8
INSERT INTO Category
(
	[Name],
	[ParentId]
)
OUTPUT inserted.Id INTO @IdentityOutputCategory8
VALUES
(
	'Canon',
	(SELECT [Id] FROM @IdentityOutputCategory5)
);

-- Insert Product Product 1
INSERT INTO [Product].[Product]
(
	[Name],
	[BuyPrice],
	[SellPrice],
	[LastInventory],
	[Date],
	[Description],
	[AdminId]
)
OUTPUT inserted.Id INTO @IdentityOutputProductProduct1
VALUES
(
	N'گوشي موبايل سامسونگ مدل Galaxy Note 8  SM-N950FD دو سيم‌کارت ظرفيت 64 گيگابايت',
	4000000,
	4100000,
	10,
	DEFAULT,
	NULL,
	(SELECT [Id] FROM @IdentityOutputManagerAdmin1)
);

-- Insert Product Category Of Product 1
INSERT INTO [Product].[Category]
(
	[CategoryId],
	[ProductId]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCategory1),
	(SELECT [Id] FROM @IdentityOutputProductProduct1)
),
(
	(SELECT [Id] FROM @IdentityOutputCategory2),
	(SELECT [Id] FROM @IdentityOutputProductProduct1)
),
(
	(SELECT [Id] FROM @IdentityOutputCategory6),
	(SELECT [Id] FROM @IdentityOutputProductProduct1)
);

-- Insert Product Product 2
INSERT INTO [Product].[Product]
(
	[Name],
	[BuyPrice],
	[SellPrice],
	[LastInventory],
	[Date],
	[Description],
	[AdminId]
)
OUTPUT inserted.Id INTO @IdentityOutputProductProduct2
VALUES
(
	N'گوشي موبايل سامسونگ مدل Galaxy S9 Plus دو سيم کارت ظرفيت 64 گيگابايت',
	4200000,
	4440000,
	15,
	DEFAULT,
	NULL,
	(SELECT [Id] FROM @IdentityOutputManagerAdmin2)
);

-- Insert Product Category Of Product 2
INSERT INTO [Product].[Category]
(
	[CategoryId],
	[ProductId]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCategory1),
	(SELECT [Id] FROM @IdentityOutputProductProduct2)
),
(
	(SELECT [Id] FROM @IdentityOutputCategory2),
	(SELECT [Id] FROM @IdentityOutputProductProduct2)
),
(
	(SELECT [Id] FROM @IdentityOutputCategory6),
	(SELECT [Id] FROM @IdentityOutputProductProduct2)
);

-- Insert Product Product 3
INSERT INTO [Product].[Product]
(
	[Name],
	[BuyPrice],
	[SellPrice],
	[LastInventory],
	[Date],
	[Description],
	[AdminId]
)
OUTPUT inserted.Id INTO @IdentityOutputProductProduct3
VALUES
(
	N'لپ تاپ 15 اينچي ايسوس مدل ROG FX553VE - E',
	5200000,
	5969000,
	7,
	DEFAULT,
	NULL,
	(SELECT [Id] FROM @IdentityOutputManagerAdmin3)
);

-- Insert Product Category Of Product 3
INSERT INTO [Product].[Category]
(
	[CategoryId],
	[ProductId]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCategory1),
	(SELECT [Id] FROM @IdentityOutputProductProduct3)
),
(
	(SELECT [Id] FROM @IdentityOutputCategory4),
	(SELECT [Id] FROM @IdentityOutputProductProduct3)
),
(
	(SELECT [Id] FROM @IdentityOutputCategory7),
	(SELECT [Id] FROM @IdentityOutputProductProduct3)
);

-- Insert Product Product 4
INSERT INTO [Product].[Product]
(
	[Name],
	[BuyPrice],
	[SellPrice],
	[LastInventory],
	[Date],
	[Description],
	[AdminId]
)
OUTPUT inserted.Id INTO @IdentityOutputProductProduct4
VALUES
(
	N'لپ تاپ 15 اینچی ایسوس مدل ROG GL553VE - B',
	6700000,
	7050000,
	30,
	DEFAULT,
	NULL,
	(SELECT [Id] FROM @IdentityOutputManagerAdmin3)
);

-- Insert Product Category Of Product 4
INSERT INTO [Product].[Category]
(
	[CategoryId],
	[ProductId]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCategory1),
	(SELECT [Id] FROM @IdentityOutputProductProduct4)
),
(
	(SELECT [Id] FROM @IdentityOutputCategory4),
	(SELECT [Id] FROM @IdentityOutputProductProduct4)
),
(
	(SELECT [Id] FROM @IdentityOutputCategory7),
	(SELECT [Id] FROM @IdentityOutputProductProduct4)
);

-- Insert Product Product 5
INSERT INTO [Product].[Product]
(
	[Name],
	[BuyPrice],
	[SellPrice],
	[LastInventory],
	[Date],
	[Description],
	[AdminId]
)
OUTPUT inserted.Id INTO @IdentityOutputProductProduct5
VALUES
(
	N'دوربين ديجيتال کانن مدل PowerShot SX540 HS',
	1050000,
	1260000,
	11,
	DEFAULT,
	NULL,
	(SELECT [Id] FROM @IdentityOutputManagerAdmin1)
);

-- Insert Product Category Of Product 5
INSERT INTO [Product].[Category]
(
	[CategoryId],
	[ProductId]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCategory1),
	(SELECT [Id] FROM @IdentityOutputProductProduct5)
),
(
	(SELECT [Id] FROM @IdentityOutputCategory5),
	(SELECT [Id] FROM @IdentityOutputProductProduct5)
),
(
	(SELECT [Id] FROM @IdentityOutputCategory8),
	(SELECT [Id] FROM @IdentityOutputProductProduct5)
);

-- Insert Customer Customer 1
INSERT INTO [Customer].[Customer]
(
	[FirstName],
	[LastName],
	[Email],
	[PhoneNumber],
	[Address],
	[Date],
	[SellerId]
)
OUTPUT inserted.Id INTO @IdentityOutputCustomerCustomer1
VALUES
(
	N'علی',
	N'نصیری',
	'alinasiri@gmail.com',
	'09213972466',
	N'تهران / حکیمیه / خیابان صدرا / کوچه 25 / پلاک 3',
	DEFAULT,
	(SELECT [Id] FROM @IdentityOuputManagerSeller1)
);

-- Insert Customer Customer 2
INSERT INTO [Customer].[Customer]
(
	[FirstName],
	[LastName],
	[Email],
	[PhoneNumber],
	[Address],
	[Date],
	[SellerId]
)
OUTPUT inserted.Id INTO @IdentityOutputCustomerCustomer2
VALUES
(
	N'حمید',
	N'پالیزوان',
	'hamidpalizvan@gmail.com',
	'09112224567',
	N'تهران / قیطریه / خیابان آذر / کوچه 52 / پلاک 40',
	DEFAULT,
	(SELECT [Id] FROM @IdentityOuputManagerSeller3)
);

-- Insert Customer Customer 3
INSERT INTO [Customer].[Customer]
(
	[FirstName],
	[LastName],
	[Email],
	[PhoneNumber],
	[Address],
	[Date],
	[SellerId]
)
OUTPUT inserted.Id INTO @IdentityOutputCustomerCustomer3
VALUES
(
	N'محمد',
	N'دلدار',
	'mohammaddeldar@gmail.com',
	'09380007585',
	N'تهران / تجریش / خیابان فروردین / کوچه 7 / پلاک 1',
	DEFAULT,
	(SELECT [Id] FROM @IdentityOuputManagerSeller1)
);

-- Insert Customer Customer 4
INSERT INTO [Customer].[Customer]
(
	[FirstName],
	[LastName],
	[Email],
	[PhoneNumber],
	[Address],
	[Date],
	[SellerId]
)
OUTPUT inserted.Id INTO @IdentityOutputCustomerCustomer4
VALUES
(
	N'کیاوش',
	N'نوری',
	'kiavashnori@gmail.com',
	'09371112226',
	N'قم / صفاشهر / کوچه 47 / پلاک 60',
	DEFAULT,
	(SELECT [Id] FROM @IdentityOuputManagerSeller2)
);

-- Insert Customer Customer 5
INSERT INTO [Customer].[Customer]
(
	[FirstName],
	[LastName],
	[Email],
	[PhoneNumber],
	[Address],
	[Date],
	[SellerId]
)
OUTPUT inserted.Id INTO @IdentityOutputCustomerCustomer5
VALUES
(
	N'زهرا',
	N'کریمی',
	'zahrakarimi@gmail.com',
	'09105726820',
	N'قم / زنبیل آباد / کوچه 12 / پلاک 8',
	DEFAULT,
	(SELECT [Id] FROM @IdentityOuputManagerSeller4)
);

-- Insert Customer Order 1
INSERT INTO [Customer].[Order]
(
	[CustomerId],
	[Price],
	[ProductId],
	[Qty],
	[SellerId],
	[Date]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCustomerCustomer1),
	(SELECT [SellPrice] FROM [Product].[Product] WHERE [Id] = (SELECT [Id] FROM @IdentityOutputProductProduct1)),
	(SELECT [Id] FROM @IdentityOutputProductProduct1),
	1,
	(SELECT [Id] FROM @IdentityOuputManagerSeller1),
	DEFAULT
);

-- Insert Customer Order 2
INSERT INTO [Customer].[Order]
(
	[CustomerId],
	[Price],
	[ProductId],
	[Qty],
	[SellerId],
	[Date]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCustomerCustomer2),
	(SELECT [SellPrice] FROM [Product].[Product] WHERE [Id] = (SELECT [Id] FROM @IdentityOutputProductProduct5)),
	(SELECT [Id] FROM @IdentityOutputProductProduct5),
	1,
	(SELECT [Id] FROM @IdentityOuputManagerSeller3),
	DEFAULT
);

-- Insert Customer Order 3
INSERT INTO [Customer].[Order]
(
	[CustomerId],
	[Price],
	[ProductId],
	[Qty],
	[SellerId],
	[Date]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCustomerCustomer3),
	(SELECT [SellPrice] FROM [Product].[Product] WHERE [Id] = (SELECT [Id] FROM @IdentityOutputProductProduct5)),
	(SELECT [Id] FROM @IdentityOutputProductProduct5),
	3,
	(SELECT [Id] FROM @IdentityOuputManagerSeller3),
	DEFAULT
);

-- Insert Customer Order 4
INSERT INTO [Customer].[Order]
(
	[CustomerId],
	[Price],
	[ProductId],
	[Qty],
	[SellerId],
	[Date]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCustomerCustomer2),
	(SELECT [SellPrice] FROM [Product].[Product] WHERE [Id] = (SELECT [Id] FROM @IdentityOutputProductProduct2)),
	(SELECT [Id] FROM @IdentityOutputProductProduct2),
	2,
	(SELECT [Id] FROM @IdentityOuputManagerSeller5),
	DEFAULT
);

-- Insert Customer Order 5
INSERT INTO [Customer].[Order]
(
	[CustomerId],
	[Price],
	[ProductId],
	[Qty],
	[SellerId],
	[Date]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCustomerCustomer4),
	(SELECT [SellPrice] FROM [Product].[Product] WHERE [Id] = (SELECT [Id] FROM @IdentityOutputProductProduct3)),
	(SELECT [Id] FROM @IdentityOutputProductProduct3),
	2,
	(SELECT [Id] FROM @IdentityOuputManagerSeller2),
	DEFAULT
);

-- Insert Customer Order 6
INSERT INTO [Customer].[Order]
(
	[CustomerId],
	[Price],
	[ProductId],
	[Qty],
	[SellerId],
	[Date]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCustomerCustomer5),
	(SELECT [SellPrice] FROM [Product].[Product] WHERE [Id] = (SELECT [Id] FROM @IdentityOutputProductProduct4)),
	(SELECT [Id] FROM @IdentityOutputProductProduct4),
	3,
	(SELECT [Id] FROM @IdentityOuputManagerSeller4),
	DEFAULT
);

-- Insert Customer Order 7
INSERT INTO [Customer].[Order]
(
	[CustomerId],
	[Price],
	[ProductId],
	[Qty],
	[SellerId],
	[Date]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCustomerCustomer5),
	(SELECT [SellPrice] FROM [Product].[Product] WHERE [Id] = (SELECT [Id] FROM @IdentityOutputProductProduct1)),
	(SELECT [Id] FROM @IdentityOutputProductProduct1),
	3,
	(SELECT [Id] FROM @IdentityOuputManagerSeller2),
	DEFAULT
);

-- Insert Customer Order 8
INSERT INTO [Customer].[Order]
(
	[CustomerId],
	[Price],
	[ProductId],
	[Qty],
	[SellerId],
	[Date]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCustomerCustomer3),
	(SELECT [SellPrice] FROM [Product].[Product] WHERE [Id] = (SELECT [Id] FROM @IdentityOutputProductProduct4)),
	(SELECT [Id] FROM @IdentityOutputProductProduct4),
	2,
	(SELECT [Id] FROM @IdentityOuputManagerSeller4),
	DEFAULT
);

-- Insert Customer Order 9
INSERT INTO [Customer].[Order]
(
	[CustomerId],
	[Price],
	[ProductId],
	[Qty],
	[SellerId],
	[Date]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCustomerCustomer4),
	(SELECT [SellPrice] FROM [Product].[Product] WHERE [Id] = (SELECT [Id] FROM @IdentityOutputProductProduct4)),
	(SELECT [Id] FROM @IdentityOutputProductProduct4),
	3,
	(SELECT [Id] FROM @IdentityOuputManagerSeller5),
	DEFAULT
);

-- Insert Customer Order 10
INSERT INTO [Customer].[Order]
(
	[CustomerId],
	[Price],
	[ProductId],
	[Qty],
	[SellerId],
	[Date]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCustomerCustomer5),
	(SELECT [SellPrice] FROM [Product].[Product] WHERE [Id] = (SELECT [Id] FROM @IdentityOutputProductProduct2)),
	(SELECT [Id] FROM @IdentityOutputProductProduct2),
	1,
	(SELECT [Id] FROM @IdentityOuputManagerSeller1),
	DEFAULT
);

-- Insert Customer Order 11
INSERT INTO [Customer].[Order]
(
	[CustomerId],
	[Price],
	[ProductId],
	[Qty],
	[SellerId],
	[Date]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCustomerCustomer2),
	(SELECT [SellPrice] FROM [Product].[Product] WHERE [Id] = (SELECT [Id] FROM @IdentityOutputProductProduct2)),
	(SELECT [Id] FROM @IdentityOutputProductProduct2),
	1,
	(SELECT [Id] FROM @IdentityOuputManagerSeller4),
	DEFAULT
);

-- Insert Customer Order 12
INSERT INTO [Customer].[Order]
(
	[CustomerId],
	[Price],
	[ProductId],
	[Qty],
	[SellerId],
	[Date]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCustomerCustomer4),
	(SELECT [SellPrice] FROM [Product].[Product] WHERE [Id] = (SELECT [Id] FROM @IdentityOutputProductProduct4)),
	(SELECT [Id] FROM @IdentityOutputProductProduct4),
	1,
	(SELECT [Id] FROM @IdentityOuputManagerSeller4),
	DEFAULT
);

-- Insert Customer Order 13
INSERT INTO [Customer].[Order]
(
	[CustomerId],
	[Price],
	[ProductId],
	[Qty],
	[SellerId],
	[Date]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCustomerCustomer2),
	(SELECT [SellPrice] FROM [Product].[Product] WHERE [Id] = (SELECT [Id] FROM @IdentityOutputProductProduct2)),
	(SELECT [Id] FROM @IdentityOutputProductProduct2),
	1,
	(SELECT [Id] FROM @IdentityOuputManagerSeller3),
	DEFAULT
);

-- Insert Customer Order 14
INSERT INTO [Customer].[Order]
(
	[CustomerId],
	[Price],
	[ProductId],
	[Qty],
	[SellerId],
	[Date]
)
VALUES
(
	(SELECT [Id] FROM @IdentityOutputCustomerCustomer3),
	(SELECT [SellPrice] FROM [Product].[Product] WHERE [Id] = (SELECT [Id] FROM @IdentityOutputProductProduct4)),
	(SELECT [Id] FROM @IdentityOutputProductProduct4),
	1,
	(SELECT [Id] FROM @IdentityOuputManagerSeller1),
	DEFAULT
);