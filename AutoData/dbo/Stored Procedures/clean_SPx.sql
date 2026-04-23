

CREATE  PROCEDURE clean_SPx AS

INSERT INTO dbo.Archive_SP1_Data
SELECT   *
FROM      dbo.SP1_Data
WHERE   (CreationDate  < { fn NOW() } - 90)

DELETE FROM dbo.SP1_Data
WHERE   (CreationDate  < { fn NOW() } - 90)

