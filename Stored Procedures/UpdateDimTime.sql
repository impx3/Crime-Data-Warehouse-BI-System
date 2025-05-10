USE [CrimeData_DataWarehouse]
GO

/****** Object:  StoredProcedure [dbo].[UpdateDimTime]    Script Date: 2025-05-10 5:27:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateDimTime]
    @TimeID INT,
    @Hour INT,
    @Minute INT,
    @AMPM VARCHAR(2)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM dbo.DimTime WHERE TimeID = @TimeID)
    BEGIN
        INSERT INTO dbo.DimTime (TimeID, Hour, Minute, AMPM, SrcModifiedDate, InsertDate, ModifiedDate)
        VALUES (@TimeID, @Hour, @Minute, @AMPM, GETDATE(), GETDATE(), GETDATE())
    END
    ELSE
    BEGIN
        UPDATE dbo.DimTime
        SET Hour = @Hour,
            Minute = @Minute,
            AMPM = @AMPM,
            ModifiedDate = GETDATE()
        WHERE TimeID = @TimeID
    END
END;
GO


