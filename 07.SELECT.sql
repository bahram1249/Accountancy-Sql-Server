USE Accountancy;
GO


SELECT a.[FirstName] + ' ' + a.[LastName] AS 'Admin Name',
		s.[AdminId] AS 'AdminId',
		count(*) AS 'Count of employment Seller'
FROM [Manager].[Seller] s
JOIN [Manager].[Admin] a
ON s.[AdminId] = a.[Id]
GROUP BY a.[FirstName],a.[LastName] ,s.[AdminId]

