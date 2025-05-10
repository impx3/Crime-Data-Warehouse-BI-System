USE [CrimeData_DataWarehouse]
GO

/****** Object:  StoredProcedure [dbo].[UpdateDimPremise]    Script Date: 2025-05-10 5:27:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateDimPremise]
    @PremiseCode INT,
    @PremiseDescription VARCHAR(100)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM dbo.DimPremise WHERE PremiseCode = @PremiseCode)
    BEGIN
        INSERT INTO dbo.DimPremise (PremiseCode, PremiseDescription)
        VALUES (@PremiseCode, @PremiseDescription)
    END
    ELSE
    BEGIN
        UPDATE dbo.DimPremise
        SET PremiseDescription = @PremiseDescription
        WHERE PremiseCode = @PremiseCode
    END
END;
GO


