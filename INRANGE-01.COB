      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. INRANGE-01.

      * ASKS USER FOR A NUMBER BETWEEN 10 AND 100 EXCLUSIVE AND PRINTS
      * A MESSAGE IF THE ENTRY IS IN RANGE.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01  THE-NUMBER      PIC 999.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
                 PERFORM GET-THE-NUMBER.
                 PERFORM CHECK-THE-NUMBER.
            STOP RUN.

       GET-THE-NUMBER.
                 DISPLAY "ENTER A NUMBER GREATER THAN 10".
                 DISPLAY "AND LESS THAN 100. (011-099)".
                 ACCEPT THE-NUMBER.

       CHECK-THE-NUMBER.
                 IF THE-NUMBER > 10 AND THE-NUMBER < 100
                           DISPLAY "THE NUMBER IS IN RANGE."
                 ELSE
                           DISPLAY "THE NUMBER IS OUT OF RANGE.".
       END PROGRAM INRANGE-01.
