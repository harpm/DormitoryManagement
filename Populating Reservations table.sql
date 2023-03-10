USE [DormitoryManagement]

GO

DECLARE @BoyRooms TABLE(RoomID INT);
INSERT INTO @BoyRooms SELECT R.RoomID FROM [dbo].Room AS R INNER JOIN [dbo].Dorm AS D ON R.DormID = D.DormID WHERE D.Type = 0;

DECLARE @GirlRooms TABLE(RoomID INT);
INSERT INTO @GirlRooms SELECT RoomID FROM [dbo].Room AS R INNER JOIN [dbo].Dorm AS D ON R.DormID = D.DormID WHERE D.Type = 1;


DECLARE @CurID INT;
SELECT TOP (1) @CurID = RoomID FROM @BoyRooms ORDER BY NEWID();
DELETE @BoyRooms WHERE RoomID = @CurID

INSERT INTO [dbo].Reservations(RoomID, StudentID, ReturningTheRoom, Caption)
VALUES (@CurID, 1, DATEADD(month, 5, getdate()), N'')

INSERT INTO [dbo].Reservations(RoomID, StudentID, ReturningTheRoom, Caption)
VALUES (@CurID, 2, DATEADD(month, 5, getdate()), N'')

INSERT INTO [dbo].Reservations(RoomID, StudentID, ReturningTheRoom, Caption)
VALUES (@CurID, 8, DATEADD(month, 5, getdate()), N'')


SELECT TOP (1) @CurID = RoomID FROM @BoyRooms ORDER BY NEWID();
DELETE @BoyRooms WHERE RoomID = @CurID

INSERT INTO [dbo].Reservations(RoomID, StudentID, ReturningTheRoom, Caption)
VALUES (@CurID, 9, DATEADD(month, 5, getdate()), N'')

INSERT INTO [dbo].Reservations(RoomID, StudentID, ReturningTheRoom, Caption)
VALUES (@CurID, 12, DATEADD(month, 5, getdate()), N'')

SELECT TOP (1) @CurID = RoomID FROM @GirlRooms ORDER BY NEWID();
DELETE @GirlRooms WHERE RoomID = @CurID

INSERT INTO [dbo].Reservations(RoomID, StudentID, ReturningTheRoom, Caption)
VALUES (@CurID, 3, DATEADD(month, 5, getdate()), N'')

INSERT INTO [dbo].Reservations(RoomID, StudentID, ReturningTheRoom, Caption)
VALUES (@CurID, 4, DATEADD(month, 5, getdate()), N'')

INSERT INTO [dbo].Reservations(RoomID, StudentID, ReturningTheRoom, Caption)
VALUES (@CurID, 5, DATEADD(month, 5, getdate()), N'')

SELECT TOP (1) @CurID = RoomID FROM @GirlRooms ORDER BY NEWID();
DELETE @GirlRooms WHERE RoomID = @CurID

INSERT INTO [dbo].Reservations(RoomID, StudentID, ReturningTheRoom, Caption)
VALUES (@CurID, 6, DATEADD(month, 5, getdate()), N'')

INSERT INTO [dbo].Reservations(RoomID, StudentID, ReturningTheRoom, Caption)
VALUES (@CurID, 7, DATEADD(month, 5, getdate()), N'')

INSERT INTO [dbo].Reservations(RoomID, StudentID, ReturningTheRoom, Caption)
VALUES (@CurID, 10, DATEADD(month, 5, getdate()), N'')
