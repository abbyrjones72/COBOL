      ******************************************************************
      * Author: Abby Jones
      * Date: 07/22/2018
      * Purpose: Learning Cobol from TYCi21Days
      * Tectonics: cobc
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. MOVE-VERB.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 THE-MESSAGE    PIC X(20).
       01 THE-NAME       PIC X(10).
       01 THE-NUMBER     PIC 99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "ENTER SOMEONE'S NAME: ".
            ACCEPT THE-NAME.
            MOVE "HELLO," TO THE-MESSAGE.
            MOVE 1 TO THE-NUMBER.

            DISPLAY "MESSAGE "
                    THE-NUMBER
                    ": "
                    THE-MESSAGE
                    THE-NAME.
            MOVE "SAY GOODNIGHT," TO THE-MESSAGE.
            MOVE 2 TO THE-NUMBER.
            DISPLAY "MESSAGE " THE-NUMBER ": " THE-MESSAGE THE-NAME.
            STOP RUN.
       END PROGRAM MOVE-VERB.
