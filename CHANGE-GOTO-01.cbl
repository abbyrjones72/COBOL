      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CHANGE-GOTO-01.

      * THIS PROGRAM CHANGES GOTO TO PERFORM STATEMENT.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01  THE-NUMBER                PIC 99.
       01  THE-MULTIPLIER            PIC 999.
       01  THE-PRODUCT               PIC 99999.

       PROCEDURE DIVISION.
      * LEVEL 1 ROUTINES
       MAIN-PROCEDURE.

            PERFORM PROGRAM-INITIALIZATION.
            PERFORM GET-TABLE-NUMBER.
            PERFORM DISPLAY-THE-TABLE.

            STOP RUN.

      * LEVEL 2 ROUTINES
       PROGRAM-INITIALIZATION.
                 MOVE 0 TO THE-MULTIPLIER.

       GET-TABLE-NUMBER.
                 DISPLAY "WHICH MULTIPLICATION TABLE (01-99)?".
                 ACCEPT THE-NUMBER.

       DISPLAY-THE-TABLE.
                 DISPLAY "The " THE-NUMBER "`s table is:".
                 PERFORM CALCULATE-AND-DISPLAY 12 TIMES.

       CALCULATE-AND-DISPLAY.
                 ADD 1 TO THE-MULTIPLIER.
                 COMPUTE THE-PRODUCT = THE-NUMBER * THE-MULTIPLIER.
                 DISPLAY THE-NUMBER " * " THE-MULTIPLIER " = "
                         THE-PRODUCT.
       END PROGRAM CHANGE-GOTO-01.
