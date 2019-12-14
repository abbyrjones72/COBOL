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
       01 FIRST-NUMBER   PICTURE IS 9999999.
       01 SECOND-NUMBER  PICTURE IS 9999999.
       01 THE-RESULT     PICTURE IS 9999999.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "ENTER THE FIRST NUMBER.".
            ACCEPT FIRST-NUMBER.
            DISPLAY "ENTER THE SECOND NUMBER.".
            ACCEPT SECOND-NUMBER.
            COMPUTE THE-RESULT = FIRST-NUMBER + SECOND-NUMBER;
            DISPLAY "THE RESULT IS: ".
            DISPLAY THE-RESULT.
            MOVE 0 TO THE-RESULT.
            DISPLAY THE-RESULT.

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
