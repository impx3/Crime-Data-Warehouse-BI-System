USE [CrimeData_DataWarehouse]
GO

/****** Object:  StoredProcedure [dbo].[UpdateDimStatus]    Script Date: 2025-05-10 5:27:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateDimStatus]
    @StatusCode VARCHAR(10),
    @StatusDescription VARCHAR(200),
    @ModifiedDate DATETIME
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM dbo.DimStatus
        WHERE StatusCode = @StatusCode
          AND StatusDescription = @StatusDescription
    )
    BEGIN
        UPDATE dbo.DimStatus
        SET SrcModifiedDate = @ModifiedDate,
            ModifiedDate = GETDATE()
        WHERE StatusCode = @StatusCode
          AND StatusDescription = @StatusDescription
    END
    ELSE
    BEGIN
        INSERT INTO dbo.DimStatus (StatusCode, StatusDescription, SrcModifiedDate, InsertDate, ModifiedDate)
        VALUES (@StatusCode, @StatusDescription, @ModifiedDate, GETDATE(), GETDATE())
    END
END;

GO


