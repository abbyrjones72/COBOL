      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADD04.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 FIRST-NUMBER   PIC 99.
       01 SECOND-NUMBER  PIC 99.
       01 THE-RESULT     PIC 999.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
       STEP-01.
                DISPLAY "THIS PROGRAM WILL ADD TWO NUMBERS.".
       STEP-02.
                DISPLAY "ENTER THE FIRST NUMBER:".
                ACCEPT FIRST-NUMBER.
       STEP-03.
                DISPLAY "ENTER THE SECOND NUMBER:".
                ACCEPT SECOND-NUMBER.
       SETP-04.
                COMPUTE THE-RESULT = FIRST-NUMBER + SECOND-NUMBER.
                DISPLAY "THE RESULT IS: " THE-RESULT.
            STOP RUN.
       END PROGRAM ADD04.
