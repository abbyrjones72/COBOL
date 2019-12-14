      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. IF-ELSE-02.

      * ACCEPTED 2 WORDS FROM THE USER AND THEN DISPLAYS THEN IN ASCII
      * ORDER.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01  WORD-01         PIC X(50).
       01  WORD-02         PIC X(50).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            PERFORM INITIALIZE-PROGRAM.
            PERFORM ENTER-THE-WORDS.
            PERFORM DISPLAY-THE-WORDS.

            STOP RUN.

      * LEVEL 2 ROUTINES
       INITIALIZE-PROGRAM.
                 MOVE " " TO WORD-01.
                 MOVE " " TO WORD-02.

       ENTER-THE-WORDS.
                 DISPLAY "THIS PROGRAM WILL ACCEPT 2 WORDS,".
                 DISPLAY "AND THEN DISPLAY THEM IN ASCII ORDER.".

                 DISPLAY "PLEASE ENTER THE FIRST WORD:".
                 ACCEPT WORD-01.

                 DISPLAY "PLEASE ENTER THE SECOND WORD:".
                 ACCEPT WORD-02.

       DISPLAY-THE-WORDS.
                 DISPLAY "THE WORDS IN ASCII ORDER ARE:".

                 IF WORD-01 > WORD-02
                           DISPLAY WORD-02
                           DISPLAY WORD-01
                 ELSE
                           DISPLAY WORD-01
                           DISPLAY WORD-02.
       END PROGRAM IF-ELSE-02.
