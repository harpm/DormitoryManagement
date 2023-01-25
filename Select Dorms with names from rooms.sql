USE [DormitoryManagement]

GO

SELECT 
	   DISTINCT R.DormName
	  ,D.DormID
	  ,D.Capacity
	  ,D.NumberOfRooms
	  ,D.[Type]
	  ,D.[Address]
	  ,D.Possibilities
	FROM Dorm AS D
	LEFT JOIN [dbo].Room AS R
	ON R.DormID = D.DormID