:: starts DOSBOX with the following commands:
:: -c  "cd %2" change directory to the second parameter given
:: -c "run %1" run the RUN.bat file on the file with the name given from the first parameter
dosbox start -c "cd %2" -c "run %1"