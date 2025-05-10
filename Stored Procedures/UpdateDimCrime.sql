USE [CrimeData_DataWarehouse]
GO

/****** Object:  StoredProcedure [dbo].[UpdateDimCrime]    Script Date: 2025-05-10 5:26:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateDimCrime]
    @CrimeCode INT,
    @CrimeDescription VARCHAR(100)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM dbo.DimCrime WHERE CrimeCode = @CrimeCode)
    BEGIN
        INSERT INTO dbo.DimCrime (CrimeCode, CrimeDescription)
        VALUES (@CrimeCode, @CrimeDescription)
    END
    ELSE
    BEGIN
        UPDATE dbo.DimCrime
        SET CrimeDescription = @CrimeDescription
        WHERE CrimeCode = @CrimeCode
    END
END;
GO


