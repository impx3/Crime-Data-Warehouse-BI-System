USE [CrimeData_DataWarehouse]
GO

/****** Object:  StoredProcedure [dbo].[UpdateDimVictim]    Script Date: 2025-05-10 5:28:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateDimVictim]
    @Age INT,
    @Gender VARCHAR(10),
    @Country VARCHAR(100)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM dbo.DimVictim WHERE Age = @Age AND Gender = @Gender AND Country = @Country)
    BEGIN
        INSERT INTO dbo.DimVictim (Age, Gender, Country)
        VALUES (@Age, @Gender, @Country)
    END
END;

GO


