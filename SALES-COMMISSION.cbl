      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SALES-COMMISSION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01  SALES-TOTAL               PIC S9(5)V99.
       01  COMMISSION-PERCENT        PIC 99.
       01  PERCENT-AS-DECIMAL        PIC 99.
       01  THE-COMMISSION            PIC S9(5)V99.
       01  DISPLAY-COMMISSION        PIC -9(5).99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            STOP RUN.
       END PROGRAM SALES-COMMISSION.
