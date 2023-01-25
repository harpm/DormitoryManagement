USE [DormitoryManagement]

GO

SELECT R.[RoomID]
      ,R.[Position]
      ,R.[RoomNumber]
      ,R.[Possibilities]
      ,R.[Caption]
      ,R.[DormID]
      ,R.[DormName]
	  ,D.Capacity
	  ,D.NumberOfRooms
	  ,D.[Type]
	  ,D.[Address]
  FROM [dbo].[Room] AS R
  LEFT JOIN [dbo].Dorm AS D
  ON R.DormID = D.DormID
  ORDER BY D.DormID, R.RoomID