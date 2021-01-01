:: Starts DOSBOX with the following commands:
::   -c  "CD %2" change directory to the second parameter given
::   -c "RUN %1" run the RUN.bat script on the file with the name given as the first parameter
:: Function call example:
::   starts DOSBOX, changes directory (CD) to luc01 and then executes the RUN command on the l1a1 file
::     DBXDBG.bat l1a1 luc01  
::   starts DOSBOX, stays in root folder (no CD directory provided) and then executes the RUN command on the add2 file
::     DBXDBG.bat add2

dosbox start -c "CD %2" -c "RUN %1"