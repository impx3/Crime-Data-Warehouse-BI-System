USE [CrimeData_DataWarehouse]
GO

/****** Object:  StoredProcedure [dbo].[UpdateDimWeapon]    Script Date: 2025-05-10 5:28:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateDimWeapon]
    @WeaponUsedCode INT,
    @WeaponDescription VARCHAR(100)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM dbo.DimWeapon WHERE WeaponUsedCode = @WeaponUsedCode)
    BEGIN
        INSERT INTO dbo.DimWeapon (WeaponUsedCode, WeaponDescription)
        VALUES (@WeaponUsedCode, @WeaponDescription)
    END
    ELSE
    BEGIN
        UPDATE dbo.DimWeapon
        SET WeaponDescription = @WeaponDescription
        WHERE WeaponUsedCode = @WeaponUsedCode
    END
END;

GO


