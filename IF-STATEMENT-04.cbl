      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. IF-STATEMENT-04.
      * ACCEPTS 2 WORDS FROM THE USER AND THEN DISPLAYS THEN IN ASCII
      * ORDER.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 WORD-1         PIC X(50).
       01 WORD-2         PIC X(50).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM INITIALIZE-PROGRAM.
            PERFORM ENTER-THE-WORDS.
            PERFORM DISPLAY-THE-WORDS.
            STOP RUN.

      * LEVEL 2 ROUTINES

       INITIALIZE-PROGRAM.
                MOVE " " TO WORD-1.
                MOVE " " TO WORD-2.

       ENTER-THE-WORDS.
                DISPLAY "THIS PROGRAM WILL ACCEPT 2 WORDS,".
                DISPLAY "AND THEN DISPLAY THEM".
                DISPLAY "IN ASCII ORDER".

                DISPLAY "PLEASE ENTER THE FIRST WORD.".
                ACCEPT WORD-1.

                DISPLAY "PLEASE ENTER THE SECOND WORD.".
                ACCEPT WORD-2.
       DISPLAY-THE-WORDS.

                DISPLAY "THE WORDS IN ASCII ORDER ARE:".

                IF WORD-1 > WORD-2
                         DISPLAY WORD-2
                         DISPLAY WORD-1.
      * THE OPPOSITE OF GREATER THAN IS 'NOT >', INSTEAD OF
      * LESS THAN.
                IF WORD-1 NOT > WORD-2
                         DISPLAY WORD-1
                         DISPLAY WORD-2.

       END PROGRAM IF-STATEMENT-04.
