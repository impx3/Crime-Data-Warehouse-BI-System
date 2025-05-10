USE [CrimeData_DataWarehouse]
GO

/****** Object:  StoredProcedure [dbo].[UpdateDimLocation]    Script Date: 2025-05-10 5:27:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateDimLocation]
    @LocationID INT,
    @AreaID INT,
    @LocationName VARCHAR(100),
    @Latitude DECIMAL(9,6),
    @Longitude DECIMAL(9,6)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM dbo.DimLocation WHERE LocationID = @LocationID)
    BEGIN
        INSERT INTO dbo.DimLocation (LocationID, AreaID, LocationName, Latitude, Longitude)
        VALUES (@LocationID, @AreaID, @LocationName, @Latitude, @Longitude)
    END
    ELSE
    BEGIN
        UPDATE dbo.DimLocation
        SET AreaID = @AreaID,
            LocationName = @LocationName,
            Latitude = @Latitude,
            Longitude = @Longitude
        WHERE LocationID = @LocationID
    END
END;
GO


