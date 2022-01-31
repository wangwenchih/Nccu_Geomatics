@echo off
echo Checking environment...
python -c ""
IF %ERRORLEVEL% == 9009 (set /P c=Install python? [Y/n]) 
	if /I "%c%" EQU "Y" (python-3.8.0-amd64-webinstall.exe)
	if /I "%c%" EQU "N" (echo no)
	) 
@py -c "import scipy"
IF %ERRORLEVEL% == 1 ( set /P c=Install scipy? [Y/n])
	if /I "%c%" EQU "Y" (py -m pip install scipy)
	if /I "%c%" EQU "N" (echo no)
	)
@py -c "import pandas"
IF %ERRORLEVEL% == 1 ( set /P c=Install pandas? [Y/N]) 
	if /I "%c%" EQU "Y" (py -m pip install pandas)
	if /I "%c%" EQU "N" (echo no)
	)
@py -c "import matplotlib"
IF %ERRORLEVEL% == 1 ( set /P c=Install matplotlib? [Y/n])
	if /I "%c%" EQU "Y" (py -m pip install matplotlib)
	if /I "%c%" EQU "N" (echo no)
	)
echo Done
::@py -m pip install -r requirements.txt  > nul 2> nul

@python .\Bathymetry_gui.py 
IF ERRORLEVEL 1 (cmd /k
	)

::pause
::@cmd /k
