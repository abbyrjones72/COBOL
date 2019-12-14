      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MENU-01.
      * ----------------------------------------------------------------
      * THIS PROGRAM DISPLAYS A THREE CHOICE MENU OF MESSAGES THAT CAN
      * BE DISPLAYED. THE USER ENTERS THE CHOICE, 1, 2, OR 3, AND THE
      * APPROPRIATE MESSAGE IS DISPLAYED. AN ERROR MESSAGE IS DISPLAYED
      * IF AN INVALID CHOICE IS MADE.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 MENU-PICK        PIC 9.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM GET-THE-MENU-PICK.
           PERFORM DO-THE-MENU-PICK.
            STOP RUN.

      * LEVEL 2 ROUTINES

       GET-THE-MENU-PICK.

                 PERFORM DISPLAY-THE-MENU.
                 PERFORM GET-THE-PICK.

       DO-THE-MENU-PICK.
                 IF MENU-PICK < 1 OR
                           MENU-PICK > 3
                           DISPLAY "INVALID SELECTION".
      * GO BACK TO MENU ON FAIL
                           PERFORM DISPLAY-THE-MENU.
                 IF MENU-PICK = 1
                           DISPLAY "YOU HAVE SELECTED '1'".
                 IF MENU-PICK = 2
                           DISPLAY "YOU HAVE SELECTED '2'".
                 IF MENU-PICK = 3
                           DISPLAY "YOU HAVE SELECTED '3'".

      * LEVEL 3 ROUTINES

       DISPLAY-THE-MENU.
                 DISPLAY "PLEASE ENTER THE NUMBER OF THE MESSAGE".
                 DISPLAY "THAT YOU WISH TO DISPLAY.".

      * DISPLAY A BLANK LINE
       DISPLAY " ".
       DISPLAY "1.  FIRST MESSAGE".
       DISPLAY "2.  SECOND MESSAGE".
       DISPLAY "3.  THIRD MESSAGE".
      * DISPLAY A BLANK LINE
       DISPLAY " ".
       DISPLAY "YOUR SELECTION (1-3)?".

       GET-THE-PICK.
                 ACCEPT MENU-PICK.
       END PROGRAM MENU-01.
