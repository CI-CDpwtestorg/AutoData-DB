CREATE FUNCTION [dbo].[fctn_MetalsSample](@PickTicket nvarchar(15))
RETURNS TABLE
AS
RETURN
(
    SELECT
        CAST(NULL AS decimal(4,3)) AS Ca,
        CAST(NULL AS decimal(4,3)) AS Ma,
        CAST(NULL AS decimal(4,3)) AS Ni,
        CAST(NULL AS decimal(4,3)) AS Zn,
        CAST(NULL AS decimal(4,3)) AS Al,
        CAST(NULL AS decimal(4,3)) AS Fe,
        CAST(NULL AS decimal(4,3)) AS Cr,
        CAST(NULL AS decimal(4,3)) AS Cu,
        CAST(NULL AS decimal(4,3)) AS Na,
        CAST(NULL AS decimal(4,3)) AS K
    WHERE 1 = 0
)
