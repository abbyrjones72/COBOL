      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PERFORM-01.
      * THIS PROGRAM ILLUSTRATES THE USE OF PERFORM.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "TODAY'S MESSAGE IS:".
            PERFORM SAY-HELLO.
            STOP RUN.

            SAY-HELLO.
                     DISPLAY "HELLO, ABBY!".
       END PROGRAM PERFORM-01.
