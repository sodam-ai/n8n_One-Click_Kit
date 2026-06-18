@echo off
chcp 949 > nul
setlocal
title n8n Manager

rem ============================================================
rem  n8n 매니저 (원클릭 설치/실행 도우미)
rem  - 처음 컴퓨터를 다루는 분도 쉽게 쓸 수 있도록 만든 한국어 메뉴 도구
rem  - 이 파일은 CP949(완성형 한글)로 저장되어 있고, 위에서 chcp 949 로 맞춥니다.
rem  - [주의] 이 파일을 UTF-8 로 다시 저장하면 한글이 모두 깨집니다. 절대 금지.
rem  - 글로 된 안내가 필요하면 같은 폴더의 "사용설명서.txt" 또는 메뉴 [9] 를 보세요.
rem  - 번호 선택은 키 한 번이면 됩니다(Windows choice 명령). 엔터를 안 눌러도 됩니다.
rem ============================================================

rem 시작할 때 n8n 설치 여부와 버전을 확인해서 화면에 보여줍니다.
call :SET_STATUS

:MENU
cls
echo.
echo ============================================================
echo                    n8n 매니저
echo ============================================================
echo.
echo   n8n 이란?  여러 인터넷 서비스(메일, 메신저, 시트 등)를
echo              자동으로 연결해서 반복 작업을 대신 해주는 도구예요.
echo              예) "메일 오면 알림 보내기", "매일 아침 자료 모으기".
echo.
echo   현재 상태:  %N8N_STATUS%
echo.
echo ------------------------------------------------------------
echo.
echo   [0] 처음이세요?  설치부터 실행까지 한 번에 도와드려요  [추천]
echo.
echo   [1] n8n 설치하기
echo   [2] n8n 업데이트하기
echo   [3] n8n 시작하기  (기본 통로 5678, 보통 이걸 쓰면 됩니다)
echo   [4] n8n 시작하기  (통로 번호 직접 정하기)
echo   [5] 내 작업물 백업 / 저장 폴더 열기
echo   [6] 문제 해결 (자동 점검)
echo   [7] n8n 삭제하기
echo   [8] 끝내기
echo   [9] 사용설명서 보기  (글로 된 안내서 열기)
echo.
echo   처음이라면 [0], 글 안내는 [9].  번호 키를 한 번만 누르면 됩니다.
echo ============================================================
echo.

rem --- 번호 선택: choice 명령이 있으면 키 한 번으로 선택(엔터 불필요) ---
where choice >nul 2>&1
if errorlevel 1 goto MENU_TYPED

choice /c 0123456789 /n /m "원하는 번호 키를 한 번 누르세요 (0-9): "
set /a _k=%errorlevel%-1
set "choice=%_k%"
goto MENU_DISPATCH

:MENU_TYPED
rem choice 명령이 없는 컴퓨터를 위한 예비 방식: 번호를 입력하고 Enter.
set "choice="
set /p choice="원하는 번호를 누르고 Enter 하세요 (0-9): "
rem 공백, 대괄호, 점, "번" 같은 군더더기를 지워 오타에도 잘 인식되게 합니다.
if not defined choice goto MENU
set "choice=%choice: =%"
set "choice=%choice:번=%"
set "choice=%choice:[=%"
set "choice=%choice:]=%"
set "choice=%choice:.=%"
if not defined choice goto MENU

:MENU_DISPATCH
if "%choice%"=="0" goto FIRST_RUN
if "%choice%"=="1" goto INSTALL
if "%choice%"=="2" goto UPDATE
if "%choice%"=="3" goto START_DEFAULT
if "%choice%"=="4" goto START_CUSTOM
if "%choice%"=="5" goto BACKUP
if "%choice%"=="6" goto DIAGNOSE
if "%choice%"=="7" goto UNINSTALL
if "%choice%"=="8" goto EXIT
if "%choice%"=="9" goto GUIDE

echo.
echo  0 부터 9 사이의 번호만 인식해요. 잠시 뒤 다시 보여드릴게요.
timeout /t 2 >nul
goto MENU


rem ============= [0] 처음 사용자: 설치+실행 한 번에 =============
:FIRST_RUN
cls
echo.
echo ============================================================
echo            처음이세요?  한 번에 도와드릴게요
echo ============================================================
echo.
echo  지금부터 n8n 을 설치하고, 끝나면 바로 실행까지 해드립니다.
echo  중간에 나오는 안내만 천천히 따라오시면 됩니다.
echo.
where n8n >nul 2>&1
if not errorlevel 1 goto FIRST_ALREADY

where node >nul 2>&1
if errorlevel 1 goto NODE_MISSING

echo  준비물(Node.js)이 확인되었습니다. 이제 n8n 을 설치합니다.
echo  인터넷 속도에 따라 1~3 분쯤 걸릴 수 있어요. 잠시만 기다려 주세요.
echo.
call npm install -g n8n
if errorlevel 1 goto INSTALL_FAIL
call :SET_STATUS
echo.
echo  [완료] 설치가 끝났습니다! 이어서 바로 n8n 을 켭니다.
echo.
pause
goto START_DEFAULT

:FIRST_ALREADY
echo  n8n 이 이미 설치되어 있습니다. 바로 켜 드릴게요.
echo.
pause
goto START_DEFAULT


rem ====================== [1] 설치 ======================
:INSTALL
cls
echo.
echo ============================================================
echo                    n8n 설치하기
echo ============================================================
echo.
rem n8n 은 Node.js 위에서 동작합니다. 먼저 Node.js 가 있는지 확인합니다.
where node >nul 2>&1
if errorlevel 1 goto NODE_MISSING

echo Node.js 가 확인되었습니다. 이제 n8n 을 설치합니다.
echo 인터넷 속도에 따라 1~3 분쯤 걸릴 수 있어요. 잠시만 기다려 주세요.
echo.
call npm install -g n8n
if errorlevel 1 goto INSTALL_FAIL

echo.
echo [완료] n8n 설치가 끝났습니다!
echo        이제 메뉴에서 [3] 시작하기 로 n8n 을 켤 수 있어요.
call :SET_STATUS
echo.
pause
goto MENU

:INSTALL_FAIL
echo.
echo [오류] n8n 설치 중 문제가 생겼습니다.
echo.
echo   아래 순서로 살펴보세요.
echo    1) 인터넷이 연결되어 있는지 확인하세요.
echo    2) 이 창을 닫고, 이 파일을 마우스 오른쪽 클릭한 뒤
echo       "관리자 권한으로 실행" 으로 다시 열어보세요.
echo    3) 그래도 안 되면 [6] 문제 해결 로 상태를 확인해 보세요.
echo    4) 방금 Node.js 를 설치했다면, 이 검은 창을 완전히 닫고 새로 실행해야
echo       인식됩니다. (설치 직후에는 이 창이 Node.js 를 아직 못 봅니다.)
call :SET_STATUS
echo.
pause
goto MENU


rem ============ Node.js 가 없을 때 (자동 설치 우선) ============
:NODE_MISSING
echo n8n 을 켜려면 먼저 Node.js 라는 준비물이 필요합니다.
echo (n8n 이 Node.js 위에서 동작하기 때문이에요.)
echo.
rem winget(윈도우 자동 설치 도구)이 있으면 자동으로 설치를 시도합니다.
where winget >nul 2>&1
if errorlevel 1 goto NODE_MANUAL

echo 이 컴퓨터에서 Node.js 자동 설치를 시작합니다.
echo 도중에 "이 앱이 변경하도록 허용하시겠어요?" 창이 뜨면 "예" 를 눌러주세요.
echo.
winget install OpenJS.NodeJS.LTS --accept-source-agreements --accept-package-agreements
echo.
echo ------------------------------------------------------------
echo  [중요] Node.js 설치가 끝났으면, 이 검은 창을 한 번 닫고
echo         이 파일을 "다시 한 번" 실행해 주세요.
echo         그런 다음 [0] 또는 [1] 을 누르면 n8n 이 설치됩니다.
echo         (다시 켜야 Node.js 가 창에 새로 인식됩니다.)
echo ------------------------------------------------------------
echo.
pause
goto MENU

:NODE_MANUAL
echo 자동 설치 도구가 없어서, 직접 설치하는 방법을 안내해 드릴게요.
echo.
echo  따라하기
echo    1) 곧 열리는 사이트에서 "LTS" 라고 적힌 큰 버튼을 누르세요.
echo    2) 내려받은 파일을 두 번 눌러 실행하고, "다음(Next)" 만 계속 누르세요.
echo    3) 설치가 끝나면 이 창을 닫고, 이 파일을 다시 실행하세요.
echo.
start "" https://nodejs.org/ko/download
echo  설치 페이지를 열었습니다. 설치를 마친 뒤 이 파일을 다시 실행해 주세요.
echo.
pause
goto MENU


rem ====================== [2] 업데이트 ======================
:UPDATE
cls
echo.
echo ============================================================
echo                    n8n 업데이트하기
echo ============================================================
echo.
where n8n >nul 2>&1
if errorlevel 1 goto NEED_INSTALL

echo n8n 을 최신 버전으로 업데이트합니다. 잠시만 기다려 주세요.
echo.
call npm update -g n8n
if errorlevel 1 goto UPDATE_FAIL

echo.
echo [완료] n8n 업데이트가 끝났습니다!
call :SET_STATUS
echo.
pause
goto MENU

:UPDATE_FAIL
echo.
echo [오류] 업데이트 중 문제가 생겼습니다.
echo        인터넷 연결을 확인하고 잠시 뒤 다시 시도해 주세요.
call :SET_STATUS
echo.
pause
goto MENU


rem ====================== [3] 기본 통로로 시작 ======================
:START_DEFAULT
cls
echo.
echo ============================================================
echo              n8n 시작하기  (통로 5678)
echo ============================================================
echo.
where n8n >nul 2>&1
if errorlevel 1 goto NEED_INSTALL

rem 통로(포트)가 이미 쓰이는지 먼저 확인합니다.
netstat -ano | findstr ":5678 " | findstr "LISTENING" >nul
if errorlevel 1 goto SD_PORTOK
echo  [알림] 5678 번 통로가 이미 사용 중입니다.
echo         - 이미 n8n 이 켜져 있을 수 있어요. 그러면 인터넷 주소창에
echo           http://localhost:5678 만 입력해 열면 됩니다.
echo         - 다른 프로그램이 쓰는 거라면, 아래 [2] 로 다른 번호를 쓰세요.
echo.
echo   [1] 그래도 5678 로 시작
echo   [2] 다른 통로 번호 직접 정하기  (추천)
echo   [3] 취소하고 메뉴로
echo.
choice /c 123 /n /m "번호 키를 한 번 누르세요 (1-3): "
set "psel=%errorlevel%"
if "%psel%"=="1" goto SD_PORTOK
if "%psel%"=="2" goto START_CUSTOM
goto MENU
:SD_PORTOK
echo.
echo  잠시 뒤 인터넷 창(브라우저)이 자동으로 열립니다.
echo  글자가 계속 올라가는 건 고장이 아니라 정상이에요. 그대로 두세요.
echo  혹시 "페이지를 열 수 없음" 이 보이면, 5~10초 뒤 키보드 F5 로 새로고침하세요.
echo.
echo  [처음 켜는 경우] 브라우저에 "계정 만들기" 화면(이메일/비밀번호)이 나옵니다.
echo                   고장이 아니라 정상이에요. 직접 정한 이메일과 비밀번호로
echo                   계정을 만들고, 잊지 않게 어딘가에 메모해 두세요.
echo  [방화벽 창이 뜨면] "Windows 보안 경고" 창에서 "액세스 허용" 을 누르세요.
echo.
echo  끄는 방법: 이 창에서 키보드 Ctrl 과 C 를 함께 누르고,
echo            "종료하시겠습니까(Y/N)?" 가 나오면 Y 를 누르세요.
echo  다시 켜려면: 이 파일을 또 실행하고 [3] 을 누르면 됩니다.
echo.
echo  직접 열려면 주소창에 입력: http://localhost:5678
echo ------------------------------------------------------------
echo.
start "" /b powershell -NoProfile -WindowStyle Hidden -Command "for($i=0;$i -lt 60;$i++){try{$c=New-Object Net.Sockets.TcpClient;$c.Connect('127.0.0.1',5678);$c.Close();Start-Process 'http://localhost:5678';break}catch{Start-Sleep -Milliseconds 800}}"
call n8n start
goto MENU


rem ====================== [4] 통로 직접 정하기 ======================
:START_CUSTOM
cls
echo.
echo ============================================================
echo                 n8n 통로 직접 정하기
echo ============================================================
echo.
where n8n >nul 2>&1
if errorlevel 1 goto NEED_INSTALL

echo 통로(포트)는 n8n 이 사용할 "번호" 입니다.
echo 잘 모르겠으면 그냥 Enter 를 누르세요. 기본값 5678 을 사용합니다.
echo.
set "port="
set /p port="사용할 통로 번호 (예: 8080 / 모르면 Enter): "

if "%port%"=="" (
    set "port=5678"
    echo 입력이 없어 기본 통로 5678 을 사용합니다.
    goto START_CUSTOM_RUN
)

rem 입력값이 숫자인지 확인합니다. 숫자가 아니면 기본값으로 되돌립니다.
set "badchar="
for /f "delims=0123456789" %%A in ("%port%") do set "badchar=%%A"
if defined badchar (
    echo 숫자만 입력할 수 있어요. 기본 통로 5678 을 사용합니다.
    set "port=5678"
    goto START_CUSTOM_RUN
)
if %port% gtr 65535 (
    echo 통로 번호가 너무 큽니다. 최대 65535 까지 가능합니다. 기본 통로 5678 을 사용합니다.
    set "port=5678"
)

:START_CUSTOM_RUN
rem 통로가 이미 쓰이는지 확인합니다.
netstat -ano | findstr ":%port% " | findstr "LISTENING" >nul
if errorlevel 1 goto SC_PORTOK
echo.
echo  [알림] %port% 번 통로가 이미 사용 중입니다.
echo         이미 n8n 이 켜져 있거나, 다른 프로그램이 쓰는 중일 수 있어요.
choice /c YN /n /m "그래도 지금 시작할까요? (Y=예 / N=아니오): "
if errorlevel 2 goto MENU
:SC_PORTOK
echo.
echo ============================================================
echo              n8n 시작하기  (통로 %port%)
echo ============================================================
echo.
echo  잠시 뒤 인터넷 창(브라우저)이 자동으로 열립니다.
echo  글자가 계속 올라가는 건 고장이 아니라 정상이에요. 그대로 두세요.
echo  혹시 "페이지를 열 수 없음" 이 보이면, 5~10초 뒤 키보드 F5 로 새로고침하세요.
echo.
echo  [처음 켜는 경우] 브라우저에 "계정 만들기" 화면(이메일/비밀번호)이 나옵니다.
echo                   고장이 아니라 정상이에요. 직접 정한 이메일과 비밀번호로
echo                   계정을 만들고, 잊지 않게 어딘가에 메모해 두세요.
echo  [방화벽 창이 뜨면] "Windows 보안 경고" 창에서 "액세스 허용" 을 누르세요.
echo.
echo  끄는 방법: 이 창에서 키보드 Ctrl 과 C 를 함께 누르고,
echo            "종료하시겠습니까(Y/N)?" 가 나오면 Y 를 누르세요.
echo  다시 켜려면: 이 파일을 또 실행하고 [4] 를 누르면 됩니다.
echo.
echo  직접 열려면 주소창에 입력: http://localhost:%port%
echo ------------------------------------------------------------
echo.
start "" /b powershell -NoProfile -WindowStyle Hidden -Command "for($i=0;$i -lt 60;$i++){try{$c=New-Object Net.Sockets.TcpClient;$c.Connect('127.0.0.1',%port%);$c.Close();Start-Process 'http://localhost:%port%';break}catch{Start-Sleep -Milliseconds 800}}"
call n8n start --port=%port%
goto MENU


rem ====================== [5] 백업 / 폴더 열기 ======================
:BACKUP
cls
echo.
echo ============================================================
echo              내 작업물 백업 / 저장 폴더 열기
echo ============================================================
echo.
echo  n8n 으로 만든 자동화(워크플로우)는 아래 폴더에 저장됩니다.
echo     %USERPROFILE%\.n8n
echo.
echo  이 작업물은 소중한 재산이에요. 컴퓨터를 바꾸거나 다시 설치하면
echo  사라질 수 있으니, 가끔 백업해 두는 걸 권합니다.
echo.
echo   [1] 지금 백업하기  (복사본을 홈 폴더에 날짜별로 저장)
echo   [2] 작업물 저장 폴더 열기
echo   [3] 뒤로 가기
echo.
choice /c 123 /n /m "번호 키를 한 번 누르세요 (1-3): "
set "bsel=%errorlevel%"
if "%bsel%"=="1" goto BACKUP_DO
if "%bsel%"=="2" goto BACKUP_OPEN
goto MENU

:BACKUP_DO
if not exist "%USERPROFILE%\.n8n" goto BACKUP_NODATA
rem 날짜로 폴더 이름을 만들어, 백업을 여러 개 보관합니다(덮어쓰지 않음).
set "BKDATE=%date:~0,10%"
set "BKDATE=%BKDATE:/=-%"
set "BKDIR=%USERPROFILE%\n8n_backup_%BKDATE%"
echo.
echo 백업 중입니다. 잠시만 기다려 주세요.
xcopy "%USERPROFILE%\.n8n" "%BKDIR%\" /E /I /Y /Q >nul
if errorlevel 1 goto BACKUP_FAIL
echo.
echo [완료] 백업이 끝났습니다.
echo        저장 위치: %BKDIR%
echo        (날짜별로 보관되니 예전 백업도 남아 있습니다.
echo         USB 나 클라우드에 함께 옮겨두면 더 안전합니다.)
echo.
pause
goto MENU

:BACKUP_OPEN
if not exist "%USERPROFILE%\.n8n" goto BACKUP_NODATA
start "" explorer "%USERPROFILE%\.n8n"
goto MENU

:BACKUP_NODATA
echo.
echo 아직 백업할 작업물이 없습니다.
echo (n8n 을 한 번도 켜지 않았거나, 만든 자동화가 없는 상태예요.)
echo.
pause
goto MENU

:BACKUP_FAIL
echo.
echo [오류] 백업 중 문제가 생겼습니다. 저장 공간이 충분한지 확인해 주세요.
echo.
pause
goto MENU


rem ====================== [6] 문제 해결 (자동 점검) ======================
:DIAGNOSE
cls
echo.
echo ============================================================
echo                 문제 해결 (자동 점검)
echo ============================================================
echo.
echo  지금 컴퓨터 상태를 하나씩 확인합니다.
echo.

set "RPT=%~dp0n8n_진단결과.txt"

rem --- 준비물 Node.js ---
set "R_NODE=없음  [X]"
set "V_NODE=-"
set "OK_NODE=0"
where node >nul 2>&1
if not errorlevel 1 (
    set "R_NODE=있음  [O]"
    set "OK_NODE=1"
    for /f "delims=" %%v in ('node --version 2^>nul') do set "V_NODE=%%v"
)
rem --- 설치 도구 npm ---
set "R_NPM=없음  [X]"
set "V_NPM=-"
set "OK_NPM=0"
where npm >nul 2>&1
if not errorlevel 1 (
    set "R_NPM=있음  [O]"
    set "OK_NPM=1"
    for /f "delims=" %%v in ('npm --version 2^>nul') do set "V_NPM=%%v"
)
rem --- n8n ---
set "R_N8N=없음  [X]"
set "V_N8N=-"
set "OK_N8N=0"
where n8n >nul 2>&1
if not errorlevel 1 (
    set "R_N8N=있음  [O]"
    set "OK_N8N=1"
    for /f "delims=" %%v in ('n8n --version 2^>nul') do set "V_N8N=%%v"
)
rem --- 인터넷 연결 ---
set "R_NET=연결 안 됨  [X]"
set "OK_NET=0"
ping -n 1 8.8.8.8 >nul 2>&1
if not errorlevel 1 (
    set "R_NET=연결됨  [O]"
    set "OK_NET=1"
)

echo  [1/4] 준비물 Node.js : %R_NODE%   버전 %V_NODE%
echo  [2/4] 설치 도구 npm  : %R_NPM%   버전 %V_NPM%
echo  [3/4] n8n           : %R_N8N%   버전 %V_N8N%
echo  [4/4] 인터넷 연결    : %R_NET%
echo.
echo  ------------------------------------------------------------
echo   이럴 땐 이렇게 하세요
if "%OK_NODE%"=="0" (
    echo    - 준비물 Node.js 가 없습니다. 메뉴 [1] 설치하기 (또는 [0]) 를
    echo      누르면 Node.js 부터 자동으로 안내해 드립니다.
)
if "%OK_NODE%"=="1" if "%OK_N8N%"=="0" (
    echo    - 준비물은 있는데 n8n 이 아직 없습니다. 메뉴 [1] 설치하기 를 누르세요.
)
if "%OK_NODE%"=="1" if "%OK_N8N%"=="1" (
    echo    - 준비가 모두 끝났습니다! 메뉴 [3] 시작하기 를 누르면 n8n 이 켜집니다.
)
if "%OK_NET%"=="0" (
    echo    - 인터넷이 연결돼 있지 않습니다. 와이파이/랜선을 확인해 주세요.
    echo      (설치와 업데이트는 인터넷이 필요합니다.)
)
echo  ------------------------------------------------------------
echo.

rem --- 결과를 파일로 저장 (도움 요청 시 첨부하기 쉽게) ---
> "%RPT%" echo n8n 진단 결과
>> "%RPT%" echo 점검 시각: %date% %time%
>> "%RPT%" echo 윈도우: %OS%
>> "%RPT%" echo ------------------------------------------------------------
>> "%RPT%" echo Node.js : %R_NODE%  버전 %V_NODE%
>> "%RPT%" echo npm     : %R_NPM%  버전 %V_NPM%
>> "%RPT%" echo n8n     : %R_N8N%  버전 %V_N8N%
>> "%RPT%" echo 인터넷  : %R_NET%
>> "%RPT%" echo ------------------------------------------------------------
>> "%RPT%" echo 작업물 폴더: %USERPROFILE%\.n8n

echo ------------------------------------------------------------
echo  점검 결과를 파일로도 저장했어요:
echo     %RPT%
echo  문제가 계속되면 이 파일을 그대로 보내 도움을 요청하면 빠릅니다.
echo  (설치 실패는 보통 인터넷, 권한, 백신 차단 때문입니다.)
echo ------------------------------------------------------------
echo.
pause
goto MENU


rem ====================== [9] 사용설명서 보기 ======================
:GUIDE
cls
echo.
echo ============================================================
echo                 사용설명서 보기
echo ============================================================
echo.
echo  글로 된 안내서를 메모장으로 열어 드립니다.
echo  (이 파일과 같은 폴더의 "사용설명서.txt" 입니다.)
echo.
if exist "%~dp0사용설명서.txt" (
    start "" notepad "%~dp0사용설명서.txt"
    echo  메모장으로 열었습니다. 천천히 읽어보세요.
) else (
    echo  [알림] 사용설명서.txt 파일을 찾지 못했습니다.
    echo         이 파일과 같은 폴더에 "사용설명서.txt" 가 있는지 확인해 주세요.
    echo         대신 이 파일이 있는 폴더를 열어 드릴게요.
    start "" explorer "%~dp0"
)
echo.
pause
goto MENU


rem ====================== [7] 삭제 ======================
:UNINSTALL
cls
echo.
echo ============================================================
echo                    n8n 삭제하기
echo ============================================================
echo.
where n8n >nul 2>&1
if errorlevel 1 goto UNINSTALL_NONE

echo  삭제 방법을 골라주세요.
echo.
echo   [1] 프로그램만 삭제    (만든 자동화 작업물은 그대로 보관)  [추천]
echo   [2] 데이터까지 완전 삭제 (작업물도 모두 지움 / 되돌릴 수 없음)
echo   [3] 취소하고 메뉴로
echo.
echo  참고: 만든 작업물(자동화)은 이 폴더에 들어 있습니다.
echo        %USERPROFILE%\.n8n
echo.
choice /c 123 /n /m "번호 키를 한 번 누르세요 (1-3): "
set "usel=%errorlevel%"
if "%usel%"=="1" goto UNINSTALL_PROG
if "%usel%"=="2" goto UNINSTALL_ALL
goto MENU

:UNINSTALL_PROG
echo.
echo  [안내] 프로그램만 삭제합니다. 만든 작업물은 아래 폴더에 그대로 남습니다.
echo            %USERPROFILE%\.n8n
echo.
choice /c YN /n /m "정말 n8n 프로그램을 삭제할까요? (Y=예 / N=아니오): "
if errorlevel 2 goto UNINSTALL_CANCEL

echo.
echo n8n 을 삭제합니다. 잠시만 기다려 주세요.
call npm uninstall -g n8n
if errorlevel 1 goto UNINSTALL_FAIL

echo.
echo [완료] n8n 프로그램을 삭제했습니다.
echo        작업물 폴더는 그대로 남겨두었습니다: %USERPROFILE%\.n8n
call :SET_STATUS
echo.
pause
goto MENU

:UNINSTALL_ALL
echo.
echo  [경고] 작업물(.n8n)까지 모두 삭제합니다.
echo         만든 자동화가 모두 사라지며 되돌릴 수 없습니다.
echo         삭제 전에 메뉴 [5] 에서 백업을 먼저 해두시길 강력히 권합니다.
echo.
choice /c YN /n /m "정말 작업물까지 모두 지울까요? (Y=예 / N=아니오): "
if errorlevel 2 goto UNINSTALL_CANCEL
choice /c YN /n /m "마지막 확인입니다. 백업을 마쳤고 계속하려면 Y (Y=예 / N=아니오): "
if errorlevel 2 goto UNINSTALL_CANCEL

echo.
echo n8n 프로그램과 작업물을 삭제합니다. 잠시만 기다려 주세요.
call npm uninstall -g n8n
if exist "%USERPROFILE%\.n8n" rmdir /s /q "%USERPROFILE%\.n8n"

echo.
echo [완료] n8n 프로그램과 작업물(.n8n)을 모두 삭제했습니다.
call :SET_STATUS
echo.
pause
goto MENU

:UNINSTALL_NONE
echo n8n 이 설치되어 있지 않습니다. 삭제할 것이 없어요.
echo.
pause
goto MENU

:UNINSTALL_CANCEL
echo 삭제를 취소했습니다.
echo.
pause
goto MENU

:UNINSTALL_FAIL
echo.
echo [오류] 삭제 중 문제가 생겼습니다. 잠시 뒤 다시 시도해 주세요.
call :SET_STATUS
echo.
pause
goto MENU


rem ============ 공통: 설치가 안 되어 있을 때 안내 ============
:NEED_INSTALL
echo n8n 이 아직 설치되어 있지 않습니다.
echo 먼저 메뉴에서 [1] 설치하기 (또는 [0]) 를 눌러 주세요.
echo.
pause
goto MENU


rem ====================== 종료 ======================
:EXIT
cls
echo.
echo n8n 매니저를 종료합니다. 이용해 주셔서 감사합니다.
echo.
timeout /t 2 >nul
exit /b 0


rem ============ 내부 기능: 설치 여부/버전 확인 (화면 표시용) ============
rem  call 로만 호출됩니다. 이 흐름은 사용자에게 흘러가지 않습니다.
:SET_STATUS
where n8n >nul 2>&1
if errorlevel 1 goto STATUS_NONE
set "N8N_VER="
for /f "delims=" %%v in ('n8n --version 2^>nul') do set "N8N_VER=%%v"
if defined N8N_VER (
    set "N8N_STATUS=설치됨  [O]  (버전 %N8N_VER%)"
) else (
    set "N8N_STATUS=설치됨  [O]"
)
goto :eof
:STATUS_NONE
set "N8N_STATUS=아직 설치 안 됨  [X]"
goto :eof
