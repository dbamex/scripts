SET NOCOUNT ON
SELECT 'EXEC sp_addlogin @loginame = ''' + loginname + ''''
,', @defdb = ''' + dbname + ''''
,', @deflanguage = ''' + language + ''''
,', @encryptopt = ''skip_encryption'''
,', @passwd ='
, cast(password AS varbinary(256))
,', @sid ='
, sid
FROM syslogins
WHERE name NOT IN ('sa')
AND isntname = 0