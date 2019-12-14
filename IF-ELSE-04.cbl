      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. IF-ELSE-04.

      *-----------------------------------------------------------------
      * THIS PROGRAM ASKS FOR A 'Y' OR 'N' ANSWER, AND THEN DISPLAYS
      * WHETHER THE USER CHOSE 'YES' OR 'NO' OR AN INVALID ENTRY. THE
      * EDIT LOGIC ALLOWS FOR ENTRY OF Y, y, N, OR n.
      *-----------------------------------------------------------------

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01  YES-OR-NO       PIC X.

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
                 IF YES-OR-NO = "y"
                           MOVE "Y" TO YES-OR-NO
                 IF YES-OR-NO = "n"
                           MOVE "N" TO YES-OR-NO.

       DISPLAY-THE-ANSWER.
                 IF YES-OR-NO = "Y" OR YES-OR-NO = "N"
                           PERFORM DISPLAY-YES-OR-NO
                 ELSE
                           DISPLAY "YOUR ENTRY WAS INVALID.".
       DISPLAY-YES-OR-NO.
                 IF YES-OR-NO = "Y"
                           DISPLAY "YOU ANSWERED YES."
                 ELSE
                           DISPLAY "YOU ANSWERED NO.".

       END PROGRAM IF-ELSE-04.
