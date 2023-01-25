USE DormitoryManagement

GO

CREATE TRIGGER [dbo].NewReservation
ON [dbo].[Reservations]
INSTEAD OF INSERT 
AS
	DECLARE @DormCapacity INT;
	DECLARE @NumberOfRooms INT;

	SELECT TOP(1) @DormCapacity = D.Capacity, @NumberOfRooms = D.NumberOfRooms FROM inserted AS R
	INNER JOIN [dbo].Room AS Ro
	ON R.RoomID = Ro.RoomID
	INNER JOIN [dbo].Dorm AS D
	ON Ro.DormID = D.DormID

	DECLARE @RoomStudents INT;

	SELECT @RoomStudents = COUNT(*) FROM [dbo].Reservations
	WHERE RoomID = (SELECT RoomID FROM inserted)

	IF @RoomStudents NOT BETWEEN @DormCapacity / @NumberOfRooms AND 0
	BEGIN
		DECLARE @ROOMID INT, @DATEGETROOM DATETIME, @RETURNINGTHEROOM DATETIME, @CAPTION NVARCHAR(250), @STUDENTID INT
		SELECT @ROOMID = I.RoomID, @DATEGETROOM = I.DateGetRoom, @RETURNINGTHEROOM = I.ReturningTheRoom, @CAPTION = I.Caption, @STUDENTID = I.StudentID FROM inserted AS I
		INSERT INTO [dbo].Reservations(RoomID, DateGetRoom, ReturningTheRoom, Caption, StudentID)
		VALUES (@ROOMID, @DATEGETROOM, @RETURNINGTHEROOM, @CAPTION, @STUDENTID)
	END
	ELSE
	BEGIN
		PRINT('Room capacity is full.');
	END