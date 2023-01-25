USE [DormitoryManagement]

GO

SELECT *
	FROM Reservations AS Re
	inner JOIN Student AS S
	ON Re.StudentID = S.StudentID
	inner JOIN Room AS R
	ON Re.RoomID = R.RoomID
	INNER JOIN Dorm AS D
	ON D.DormID = R.DormID