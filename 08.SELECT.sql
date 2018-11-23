USE Accountancy;
GO

SELECT co.Id AS 'OrderId',
		pp.[Name] AS 'Product Name',
		co.Qty As 'Qty',
		ms.FirstName + ' ' + ms.LastName AS 'Seller Name',
		cc.FirstName + ' ' + cc.LastName AS 'Customer Name',
		ms.[Date]
FROM [Customer].[Order] co
INNER JOIN [Product].[InventorySeller] pis
ON co.Id = pis.OrderId
INNER JOIN [Manager].[Seller] ms
ON pis.SellerId = ms.[Id]
INNER JOIN [Product].[Inventory] [pi]
ON pis.InventoryId = [pi].[Id]
INNER JOIN [Product].[Product] pp
ON [pi].ProductId = pp.Id
INNER JOIN [Customer].[Customer] cc
ON co.CustomerId = cc.Id