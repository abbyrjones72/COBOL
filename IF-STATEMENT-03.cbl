      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. IF-STATEMENT-03.
      * THIS PROGRAM ASKS FOR A Y OR N ANSWER, AND THEN DISPLAYS WHETHER
      * THE USER CHOSE YES OR NO.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 YES-OR-NO      PIC X.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM GET-THE-ANSWER.
            PERFORM EDIT-THE-ANSWER.
            PERFORM DISPLAY-THE-ANSWER.
            STOP RUN.

       GET-THE-ANSWER.
                DISPLAY "IS THE ANSWER YES OR NO? (Y/N)".
                ACCEPT YES-OR-NO.

       EDIT-THE-ANSWER.
                IF YES-OR-NO IS EQUAL "y"
                         MOVE "Y" TO YES-OR-NO.
                IF YES-OR-NO IS EQUAL "n"
                         MOVE "N" TO YES-OR-NO.

       DISPLAY-THE-ANSWER.
                IF YES-OR-NO IS EQUAL "Y"
                         PERFORM IT-IS-VALID.
                         DISPLAY "YOU ANSWERED 'YES'".
                IF YES-OR-NO IS EQUAL "N"
                         PERFORM IT-IS-VALID.
                         DISPLAY "YOU ANSWERED 'NO'".
       IT-IS-VALID.
                DISPLAY "YOUR ANSWER IS VALID AND".
       END PROGRAM IF-STATEMENT-03.
