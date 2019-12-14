      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MULT08.

      ******************************************************************
      * THIS PROGRAM ASKS THE USER FOR A NUMBER FOR A MULTIPLICATION
      * TABLE, AND A TABLE SIZE AND THEN DISPLAYS A TABLE FOR THAT
      * NUMBER TIMES THE VALUES 1 THROUGH HOW-MANY-ENTRIES.
      *
      * THE DISPLAY IS PAUSED AFTER EACH 15 LINES.
      ******************************************************************

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01  THE-TABLE                 PIC 99.
       01  THE-ENTRY                 PIC 999.
       01  THE-PRODUCT               PIC 9999.
       01  HOW-MANY-ENTRIES          PIC 99.
       01  YES-NO                    PIC X VALUE "Y".
       01  A-DUMMY                   PIC X.
       01  SCREEN-LINES              PIC 99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
                 PERFORM DISPLAY-ONE-TABLE
                           UNTIL YES-NO = "N".
            STOP RUN.

       DISPLAY-ONE-TABLE.
                 PERFORM GET-WHICH-TABLE.
                 PERFORM DISPLAY-THE-TABLE.
      *>            PERFORM GO-AGAIN.

       GET-WHICH-TABLE.
                 DISPLAY "WHICH MULTIPLICATION TABLE? (01-99)"
                 ACCEPT THE-TABLE.

       DISPLAY-THE-TABLE.
                 PERFORM GET-HOW-MANY-ENTRIES.
                 MOVE 0 TO SCREEN-LINES.
                 PERFORM DISPLAY-ONE-ENTRY
                 VARYING THE-ENTRY FROM 1 BY 1
                           UNTIL THE-ENTRY > HOW-MANY-ENTRIES.
      *>  GO-AGAIN.
      *>      DISPLAY "GO AGAIN (Y/N)?"
      *>      ACCEPT YES-NO
      *>      IF YES-NO = "y"
      *>            MOVE "Y" TO YES-NO
      *>      IF YES-NO NOT = "Y"
      *>            MOVE "N" TO YES-NO.

       GET-HOW-MANY-ENTRIES.
           DISPLAY "HOW MANY ENTRIES (01-99)?"
           ACCEPT HOW-MANY-ENTRIES.

       DISPLAY-ONE-ENTRY.
           IF SCREEN-LINES = 15
                     PERFORM PRESS-ENTER.
                     COMPUTE THE-PRODUCT = THE-TABLE * THE-ENTRY.
                     DISPLAY THE-TABLE " * "
                             THE-ENTRY " = "
                             THE-PRODUCT.
                     ADD 1 TO SCREEN-LINES.

       PRESS-ENTER.
                 DISPLAY "PRESS [ENTER] TO CONTINUE".
                 ACCEPT A-DUMMY.
                 MOVE 0 TO SCREEN-LINES.

       END PROGRAM MULT08.
