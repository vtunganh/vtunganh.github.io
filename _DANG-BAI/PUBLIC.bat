@echo off
chcp 65001 >nul
cd /d "%~dp0.."
echo ==========================================
echo    DANG BAI LEN BLOG vtunganh.github.io
echo ==========================================
echo.
git add -A
git diff --cached --quiet
if errorlevel 1 goto cothaydoi

set AHEAD=0
for /f %%i in ('git rev-list --count origin/main..HEAD 2^>nul') do set AHEAD=%%i
if "%AHEAD%"=="0" goto khongco
echo Co %AHEAD% lan luu chua duoc dang len GitHub.
goto day

:cothaydoi
echo Cac file se duoc dang - A: them moi, M: sua, D: xoa
echo.
git diff --cached --name-status
echo.
echo Muon huy thi dong cua so nay ngay bay gio.
echo.
set "MSG="
set /p "MSG=Ghi chu cho lan dang nay, Enter de bo qua: "
if "%MSG%"=="" set "MSG=Cap nhat blog"
git commit -q -m "%MSG%"
if errorlevel 1 goto loi

:day
echo.
echo Dang day len GitHub...
git push
if errorlevel 1 goto loi
echo.
echo Da dang xong. Khoang 1 phut nua site se cap nhat:
echo https://vtunganh.github.io
echo.
pause
exit /b

:khongco
echo Khong co thay doi nao moi de dang.
echo.
pause
exit /b

:loi
echo.
echo Co loi xay ra. Chup man hinh cua so nay gui cho Claude.
echo.
pause
