      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MENU02.

      ******************************************************************
      * THIS PROGRAM DISPLAYS A THREE CHOICE MENU OF MESSAGES THAT CAN
      * BE DISPLAYED. THE USER ENTERS 1, 2, OR 3, AND THE APPROPRIATE
      * MESSAGE IS DISPLAYED. AN ERROR MESSAGE IS DISPLAYED IF AN
      * INVALID CHOICE IS MADE.
      ******************************************************************

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 MENU-PICK        PIC 9.
                 88 PICK-IS-EXIT VALUE 9.
                 88 PICK-IS-VALID VALUES 0 THRU 3, 9.


       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            MOVE 1 TO MENU-PICK.
            PERFORM GET-AND-DO-PICK
                 UNTIL PICK-IS-EXIT.
      *                    MENU-PICK = 9
            DISPLAY "THANK YOU. EXITING...".

            STOP RUN.

       GET-AND-DO-PICK.
                 PERFORM GET-THE-MENU-PICK.
                 PERFORM DO-THE-MENU-PICK.

       GET-THE-MENU-PICK.
                 PERFORM DISPLAY-THE-MENU.
                 PERFORM GET-THE-PICK.

       DO-THE-MENU-PICK.
      *             NOT (MENU-PICK = 1 OR 2 OR 3 OR 9)
                 IF NOT PICK-IS-VALID
                           DISPLAY "INVALID SELECTION".
                 IF MENU-PICK = 1
                           DISPLAY "BASIC OPTIONS".
                 IF MENU-PICK = 2
                           DISPLAY "ADVANCED OPTIONS".
                 IF MENU-PICK = 3
                           DISPLAY "MISC. OPTIONS".

       DISPLAY-THE-MENU.

      * INCLUDES THE DISPLAY OF SOME BLANK LINES TO IMPROVE APPEARANCE.

           DISPLAY "PLEASE ENTER THE NUMBER OF THE OPTION TO DISPLAY:"
           DISPLAY " ".
           DISPLAY "1. BASIC OPTIONS".
           DISPLAY "2. ADVANCED OPTIONS".
           DISPLAY "3. MISC. OPTIONS".
           DISPLAY " ".
           DISPLAY "0. EXIT".
           DISPLAY "YOUR SELECTION (1-3)?".

       GET-THE-PICK.
                 ACCEPT MENU-PICK.

       END PROGRAM MENU02.
