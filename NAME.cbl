      ******************************************************************
      * Author: Abby Jones
      * Date: 07/22/2018
      * Purpose: Learning Cobol from TYCi21Days
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 THE-NAME       PIC 9(18).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "ENTER YOUR NAME".
            ACCEPT THE-NAME.
            DISPLAY "HELLO, " THE-NAME.
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
