      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MULT-06.

      * THIS PROGRAM ASKS THE USER FOR A NUMBER FO A MULTIPLICATION
      * TABLE, AND A TABLE SIZE AND THEN DISPLAYS A TABLE FOR THAT
      * NUMBER TIMES THE VALUES 1 THROUGH HOW-MANY USING PERFORM VARYING
      * UNTIL.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  THE-NUMBER      PIC 99.
       01  THE-MULTIPLIER  PIC 999.
       01  THE-PRODUCT     PIC 9999.
       01  HOW-MANY        PIC 99.
       01  SCREEN-LINES    PIC 99.
       01  A-DUMMY         PIC X.

       PROCEDURE DIVISION.
      * LEVEL 1 ROUTINES

       MAIN-PROCEDURE.

           PERFORM PROGRAM-INITIALIZATION.
           PERFORM GET-TABLE-DATA.
           PERFORM DISPLAY-THE-TABLE.

            STOP RUN.

       PROGRAM-INITIALIZATION.
      * NO LONGER NEEDED - MOVE 0 TO THE-MULTIPLIER.
                 MOVE 0 TO SCREEN-LINES.

       GET-TABLE-DATA.
           DISPLAY "WHICH MULTIPLICATION TABLE (01-99)?".
           ACCEPT THE-NUMBER.

           DISPLAY "HOW MANY ENTRIES WOULD YOU LIKE (01-99)?".
           ACCEPT HOW-MANY.

       DISPLAY-THE-TABLE.
                 DISPLAY "THE " THE-NUMBER "`s TABLE IS:".
                 PERFORM CALCULATE-AND-DISPLAY
                           VARYING THE-MULTIPLIER
                           FROM 1 BY 1
                           UNTIL THE-MULTIPLIER > HOW-MANY.

      * LEVEL 3 ROUTINES
       CALCULATE-AND-DISPLAY.
                 IF SCREEN-LINES = 15
                           DISPLAY "PRESS ENTER TO CONTINUE..."
                           ACCEPT A-DUMMY
                           MOVE 0 TO SCREEN-LINES.

                 COMPUTE THE-PRODUCT = THE-NUMBER * THE-MULTIPLIER.
                 DISPLAY THE-NUMBER " * " THE-MULTIPLIER " = "
                           THE-PRODUCT.

                 ADD 1 TO SCREEN-LINES.


       END PROGRAM MULT-06.
