      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MULT-03.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01  THE-NUMBER                PIC 99.
       01  THE-MULTIPLIER            PIC 999.
       01  THE-PRODUCT               PIC 999.
       01  HOW-MANY                  PIC 99.

       PROCEDURE DIVISION.

      * LEVEL 1 ROUTINES
       MAIN-PROCEDURE.

           PERFORM PROGRAM-INITIALIZATION.
           PERFORM GET-TABLE-DATA.
           PERFORM DISPLAY-THE-TABLE.

            STOP RUN.

           PROGRAM-INITIALIZATION.
                     MOVE 0 TO THE-MULTIPLIER.

           GET-TABLE-DATA.
                     DISPLAY "WHICH MULTIPLICATION TABLE (01-99)?".
                     ACCEPT THE-NUMBER.

                     DISPLAY "HOW MANY ENTRIES WOULD YOU LIKE?".
                     ACCEPT HOW-MANY.

           DISPLAY-THE-TABLE.
                     DISPLAY "THE " THE-NUMBER "`S TABLE IS:".
                     PERFORM CALCULATE-AND-DISPLAY HOW-MANY TIMES.

           CALCULATE-AND-DISPLAY.
                     ADD 1 TO THE-MULTIPLIER.
                     COMPUTE THE-PRODUCT = THE-NUMBER * THE-MULTIPLIER.
                     DISPLAY THE-NUMBER " * " THE-MULTIPLIER " = "
                               THE-PRODUCT.
           END PROGRAM MULT-03.
