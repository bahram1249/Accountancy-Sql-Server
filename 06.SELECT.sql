USE Accountancy;
GO


SELECT p.[Name],o.[Qty]
FROM [Customer].[Order] o
INNER JOIN [Product].[Product] p
ON o.[CustomerId]=p.[Id]
ORDER BY o.[Qty] DESC