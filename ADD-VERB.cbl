      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADD-VERB.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 THE-MESSAGE    PIC X(50).
       01 THE-NUMBER     PIC 9(2).
       01 A-SPACE        PIC X.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      * INTIALIZE THE SPACE VARIABLE
           MOVE " " TO A-SPACE.
      * SET UP AND DISPLAY LINE 1
           MOVE 1 TO THE-NUMBER.
           MOVE "JACK BE NIMBLE," TO THE-MESSAGE.
           DISPLAY
                THE-NUMBER
                A-SPACE
                THE-MESSAGE.
      * SET UP AND DISPLAY LINE 2
           ADD 1 TO THE-NUMBER.
           MOVE "JACK BE QUICK," TO THE-MESSAGE.
           DISPLAY
                THE-NUMBER
                A-SPACE
                THE-MESSAGE.
      * SET UP AND DISPLAY LINE 3
           ADD 1 TO THE-NUMBER.
           MOVE "JACK JUMP OVER THE CANDLESTICK." TO THE-MESSAGE.
           DISPLAY
                THE-NUMBER
                A-SPACE
                THE-MESSAGE.
            STOP RUN.
       END PROGRAM ADD-VERB.
