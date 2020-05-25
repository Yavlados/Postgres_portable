# Postgres_portable

Для первой инициализации необходимо переименовать start.txt в start.bat и запустить.
После удачного выполнения, в директории с файлами проекта появится папка data.
Для последующего запуска, без повторной инициализации, необходимо переименовать start.bat в start.txt и открыть с помощью текстового редактора.

Необходимо добавить REM перед строкой инициализации:
<p><b>REM %CD%\bin\initdb -U postgres -A trust --encoding=UTF8 --locale=Russian_Russia</p></b>

После сохранить и сменить расширение на bat обратно.

----------------------------------
For the first initialization you should rename start.txt to start.bat and run...
