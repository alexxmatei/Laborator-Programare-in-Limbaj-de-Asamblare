:: starts DOSBOX with the following commands:
:: -c  "cd %2" change directory to the second parameter given
:: -c "dbg %1" run the DBG.bat file on the file with the name given from the first parameter
dosbox start -c "cd %2" -c "dbg %1"