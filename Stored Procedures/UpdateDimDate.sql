USE [CrimeData_DataWarehouse]
GO

/****** Object:  StoredProcedure [dbo].[UpdateDimDate]    Script Date: 2025-05-10 5:26:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateDimDate]
  @DateID          INT,
  @FullDate        DATE,
  @Day             INT,
  @Month           INT,
  @MonthName       NVARCHAR(15),    -- changed
  @Quarter         INT,
  @Year            INT,
  @SrcModifiedDate DATETIME,
  @InsertDate      DATETIME,
  @ModifiedDate    DATETIME,
  @IsWeekday       BIT,
  @IsHolidayUSA    BIT,
  @HolidayUSA      NVARCHAR(100)    -- changed
AS
BEGIN
  IF NOT EXISTS (SELECT 1 FROM dbo.DimDate WHERE DateID = @DateID)
  BEGIN
    INSERT dbo.DimDate
      (DateID,FullDate,Day,Month,MonthName,Quarter,Year,
       SrcModifiedDate,InsertDate,ModifiedDate,IsWeekday,IsHolidayUSA,HolidayUSA)
    VALUES
      (@DateID,@FullDate,@Day,@Month,@MonthName,
       @Quarter,@Year,@SrcModifiedDate,@InsertDate,
       @ModifiedDate,@IsWeekday,@IsHolidayUSA,@HolidayUSA);
  END
END
GO


