

CREATE  PROCEDURE clean_Last_Year_SPx AS

DELETE FROM dbo.Archive_SP1_Data
WHERE     (CreationDate < CONVERT(DATETIME, '2009-01-01 00:00:00', 102))



