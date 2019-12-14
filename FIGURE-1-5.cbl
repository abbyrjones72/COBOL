      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIGURE-1-5.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  HOURS           PIC 999.
       01  RATE            PIC 99V99.
       01  WAGES           PIC 9999.99.
       01  MORE-DATA       PIC XXX VALUE "YES".

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            PERFORM UNTIL MORE-DATA = "NO " OR "no "
                 DISPLAY "ENTER HOURS AS A THREE-DIGIT NUMBER"
                 ACCEPT HOURS
                 DISPLAY "ENTER RATE IN NN.NN FORMAT (2 DECIMAL DIGITS)"
                 ACCEPT RATE
                 MULTIPLY RATE BY HOURS GIVING WAGES
                 DISPLAY "WAGES ARE -", WAGES
                 DISPLAY "IS THERE MORE DATA (YES/NO)?"
                 ACCEPT MORE-DATA
            END-PERFORM.
            STOP RUN.
       END PROGRAM FIGURE-1-5.
