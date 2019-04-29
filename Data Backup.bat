ECHO OFF

FOR /F "skip=1" %%x IN ('wmic os get localdatetime') DO (
	IF NOT DEFINED datetime SET datetime=%%x
)

SET today=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%

"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqldump.exe" math ^
	--lock-all-tables --extended-insert ^
	--default-character-set=utf8 --skip-quote-names ^
	--user=math_admin --password=0123456789 ^
	--force 1>".\math_%today%.sql" 2>NUL
