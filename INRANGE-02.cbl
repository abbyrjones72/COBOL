      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. INRANGE-02.

      * ASKS THE UDER FOR A NUMBER BETWEEN 10 AND 100 EXCLUSIVE AND
      * PRINTS A MESSAGE IF THE ENTRY IS IN/OUT OF RANGE.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 THE-NUMBER       PIC 999.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            PERFORM GET-THE-NUMBER.
            PERFORM CHECK-THE-NUMBER.

            STOP RUN.

       GET-THE-NUMBER.
                 DISPLAY "PLEASE ENTER A NUMBER THAT IS GREATER THAN 10".
                 DISPLAY "AND LESS THAN 100 (011-099):"
                 ACCEPT THE-NUMBER.

       CHECK-THE-NUMBER.
                 IF THE-NUMBER < 10 AND THE-NUMBER > 100
                           DISPLAY "THE NUMBER IS IN RANGE."
                 ELSE
                           DISPLAY "THE NUMBER IS NOT IN RANGE.".
       END PROGRAM INRANGE-02.
