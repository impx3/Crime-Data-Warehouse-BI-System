USE [CrimeData_DataWarehouse]
GO

/****** Object:  StoredProcedure [dbo].[UpdateDimArea]    Script Date: 2025-05-10 5:25:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateDimArea]
    @AreaCode INT,
    @AreaName VARCHAR(100)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM dbo.DimArea WHERE AreaCode = @AreaCode)
    BEGIN
        INSERT INTO dbo.DimArea (AreaCode, AreaName)
        VALUES (@AreaCode, @AreaName)
    END
    ELSE
    BEGIN
        UPDATE dbo.DimArea
        SET AreaName = @AreaName
        WHERE AreaCode = @AreaCode
    END
END
GO


