CREATE VIEW [dbo].ReservationsFullDetailView
AS
	SELECT R.ReservationsCode AS N'کد رزرو'
		  ,R.RoomID AS N'شماره اتاق'
		  ,R.StudentID AS N'شماره دانشجو'
		  ,S.FirstName AS N'نام دانشجو'
		  ,S.NationalCode AS  N'کد ملی دانشجو'
		  ,RO.DormName AS N'نام خوابگاه'
		  ,RO.Position AS N'مکان خوابگاه'
		  ,RO.DormID AS N'شناسه خوابگاه'
		  ,D.Capacity AS N'ظرفیت خوابگاه'
		  , CASE D.Possibilities
				WHEN 'T' THEN N'میز تحریر'
				WHEN 'R' THEN N'یخچال'
				WHEN 'H' THEN N'بخاری'
		    END AS N'امکانات'
		  , CASE D.[Type]
				WHEN 0 THEN N'پسرانه'
				WHEN 1 THEN N'دخترانه'
				ELSE N'نامشخص'
			END AS N'نوع خوابگاه'
		  , D.[Address] AS N'آدرس'
		  , D.NumberOfRooms AS N'تعداد اتاق ها'
		FROM [dbo].Reservations AS R
		INNER JOIN [dbo].Student AS S
		ON R.StudentID = S.StudentID
		INNER JOIN [dbo].Room AS RO
		ON RO.RoomID = R.RoomID
		INNER JOIN Dorm AS D
		ON RO.DormID = D.DormID

GO