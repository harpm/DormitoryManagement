USE DormitoryManagement;

GO

-- Fixing spelling mistake --

ALTER TABLE Dorm
	DROP COLUMN Possibilies;
ALTER TABLE Dorm
	ADD Possibilities NVARCHAR(250);

GO

-- Type: 0 => Boys, 1 => Girls, 2 => Married, 3 => StaffOnly
INSERT INTO [dbo].Dorm (Capacity, NumberOfRooms, [Type], [Address], Possibilities)
VALUES (150, 30, 3, N'بلوار شهید احمدی', N'D')

GO

INSERT INTO [dbo].Dorm (Capacity, NumberOfRooms, [Type], [Address], Possibilities)
VALUES (150, 30, 2, N'بلوار شهید باستانی', N'D')

GO

INSERT INTO [dbo].Dorm (Capacity, NumberOfRooms, [Type], [Address], Possibilities)
VALUES (200, 50, 0, N'بلوار شهید کشوری', N'T')

GO

INSERT INTO [dbo].Dorm (Capacity, NumberOfRooms, [Type], [Address], Possibilities)
VALUES (100, 25, 1, N'بلوار زرینکوب', N'T')