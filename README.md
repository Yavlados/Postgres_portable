# Postgres_portable
Для первой инициализации необходимо переименовать start.txt в start.bat и запустить.
После удачного выполнения, в директории с файлами проекта появится папка data.
Для последующего запуска, без повторной инициализации, необходимо переименовать start.bat в start.txt и открыть с помощью текстового редактора.
Содержимое файла start.txt :
<b>@ECHO ON
REM Устанавливаем переменные окружения для запуска PostgreSQL
@SET PATH="%CD%\bin";%PATH%
@SET PGDATA=%CD%\data
@SET PGDATABASE=postgres
@SET PGUSER=postgres
@SET PGPORT=5439
@SET PGLOCALEDIR=%CD%\share\locale
@SET CLIENT_ENCODING='UTF8'
@SET LANGUAGE=ru
@SET ENCODING= pg_char_to_encoding('UTF8')
%CD%\bin\initdb -U postgres -A trust --encoding=UTF8 --locale=Russian_Russia
%CD%\bin\pg_ctl -D %CD%/data -l logfile start
ECHO "Нажмите Enter чтобы остановить работу сервера"
pause
%CD%\bin\pg_ctl -D %CD%/data stop </b>

Необходимо добавить REM перед строкой инициализации:
REM %CD%\bin\initdb -U postgres -A trust --encoding=UTF8 --locale=Russian_Russia

После сохранить и сменить расширение на bat обратно.
