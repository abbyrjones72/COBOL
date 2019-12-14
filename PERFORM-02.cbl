      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PERFORM-02.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 THE-MESSAGE    PIC X(50).
       01 THE-NUMBER     PIC 9(2).
       01 A-SPACE        PIC X.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

      * INITIALIZE THE SPACE VARIABLE
           MOVE " " TO A-SPACE.
      * START THE NUMBER AT 0
           MOVE 0 TO THE-NUMBER.

      * SET UP AND DISPLAY LINE 1
           MOVE "THERE ONCE WAS A LADY FROM EIGER," TO THE-MESSAGE.
           PERFORM ADD-NUMBER-AND-DISPLAY.
      * SET UP AND DISPLAY LINE 2
           MOVE "WHO SMILED AND RODE FORTH ON A TIGER." TO THE-MESSAGE.
           PERFORM ADD-NUMBER-AND-DISPLAY.
      * SET UP AND DISPLAY LINE 3
           MOVE "THEY RETURNED FROM THE RIDE" TO THE-MESSAGE.
           PERFORM ADD-NUMBER-AND-DISPLAY.
      * SET UP AND DISPLAY LINE 4
           MOVE "WITH THE LADY INSIDE," TO THE-MESSAGE.
           PERFORM ADD-NUMBER-AND-DISPLAY.
      * SET UP AND DISPLAY LINE 5
           MOVE "AND A SMILE ON THE FACE OF THE TIGER." TO THE-MESSAGE.
           PERFORM ADD-NUMBER-AND-DISPLAY.
            STOP RUN.

       ADD-NUMBER-AND-DISPLAY.
                ADD 1 TO THE-NUMBER.
                DISPLAY
                    THE-NUMBER
                    A-SPACE
                    THE-MESSAGE.
       END PROGRAM PERFORM-02.
