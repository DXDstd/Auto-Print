@echo off
cls
setlocal ENABLEDELAYEDEXPANSION
pdfprint -$ 29BRD23170AW380GVH58

@echo Danh sach may in:
pdfprint -listprinter >listprinter.txt
set counter=1
for /F "delims=*" %%j in (listprinter.txt) do (
@echo      !counter!:     %%j
set /a counter+=1
)
set printselected=0
choice /c 123456789 /N /M "Dung phim so de chon may in:"
if errorlevel 1 set printselected=1
if errorlevel 2 set printselected=2
if errorlevel 3 set printselected=3
if errorlevel 4 set printselected=4
if errorlevel 5 set printselected=5
if errorlevel 6 set printselected=6
if errorlevel 7 set printselected=7
if errorlevel 8 set printselected=8
if errorlevel 9 set printselected=9
set counter=1
set printername=""
for /F "delims=*" %%j in (listprinter.txt) do (
if !counter!==%printselected% set printername=%%j
set /a counter+=1
)
del listprinter.txt

@echo.
@echo.
pdfprint -printer "%printername%" -listbins 
set bin2selected=0
choice /c 123456789 /N /M "Dung phim so de chon khay in cac trang con lai:"
if errorlevel 1 set bin2selected=1
if errorlevel 2 set bin2selected=2
if errorlevel 3 set bin2selected=3
if errorlevel 4 set bin2selected=4
if errorlevel 5 set bin2selected=5
if errorlevel 6 set bin2selected=6
if errorlevel 7 set bin2selected=7
if errorlevel 8 set bin2selected=8
if errorlevel 9 set bin2selected=9
@echo.
@echo.
choice  /M "Ban co muon in tu dong (khong can dung lai giua cac giai doan de thay giay)?"
set automatic=0
if errorlevel 1 set automatic=1
if errorlevel 2 set automatic=0
@echo.
@echo.
@echo Bat dau qua trinh in:
@echo.
@echo.
@echo   1. Bam phim bat ky de in trang 1 cua phieu ket qua...
if %automatic%==0 (
	pause>nul
)
for  %%i in (*.pdf) do (
@echo        - Dang in %%i...
pdfprint  -printer "%printername%" -chgbin %bin2selected% -firstpage 1 -lastpage 1 -duplex 1 -copies 1 -collate 1 -quiet  "%%i"
)





