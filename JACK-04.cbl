      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. JACK-04.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01  THE-MESSAGE     PIC X(50)
                           VALUE "JACK BE NUMBLE,".
       01  THE-NUMBER      PIC 9(2) VALUE IS 1.
       01  A-SPACE         PIC X     VALUE IS " ".

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      * SETUP AND DISPLAY LINE 1
           DISPLAY
                 THE-NUMBER
                 A-SPACE
                 THE-MESSAGE.

      * SET UP AND DISPLAY LINE 2
           ADD 1 TO THE-NUMBER
           MOVE "JACK BE QUICK," TO THE-MESSAGE.
           DISPLAY
                 THE-NUMBER
                 A-SPACE
                 THE-MESSAGE.

      * SET UP AND DISPLAY LINE 3
           ADD 1 TO THE-NUMBER.
           MOVE "JACK UMP OVER THE CANDLESTICK." TO THE-MESSAGE.
           DISPLAY
                 THE-NUMBER
                 A-SPACE
                 THE-MESSAGE.

            STOP RUN.
       END PROGRAM JACK-04.
