       IDENTIFICATION DIVISION.
       PROGRAM-ID. DECIMAL-DATA.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01  WS-NUM1-DIG                  PIC X(10) JUSTIFIED.
       01  WS-NUM2-DIG                  PIC X(10) JUSTIFIED.

       01  WS-RESULT                    PIC S9(5)V99 VALUE 0.
       01  WS-OPERATOR                  PIC X.
       01  WS-NE-RESULT                 PIC ZZZ,ZZZ,ZZZ.99.

       01  WS-NUMBER-OK                 PIC X.
                 88 WS-ADD           VALUE "+".
                 88 WS-SUB           VALUE "-".
                 88 WS-MUL           VALUE "*".
                 88 WS-DIV           VALUE "/".
                 88 WS-NUM-VALID     VALUES "0123456789".

      * Ask the user to enter two numbers.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "PLEASE ENTER THE FIRST VALUE (-/+):".
           ACCEPT WS-NUM1-DIG.
           INSPECT WS-NUM1-DIG REPLACING ALL SPACES BY ZEROES.
           DISPLAY "PLEASE ENTER THE SECOND VALUE (-/+):".
           ACCEPT WS-NUM2-DIG.
           INSPECT WS-NUM2-DIG REPLACING ALL SPACES BY ZEROES.
           DISPLAY "PLEASE CHOOSE AN OPERATOR (+, -, *, /):".
           ACCEPT WS-OPERATOR.

      * Ask the user to choose which operator to use on the selected
      * user-entered data.

                 IF WS-NUM1-DIG NOT IS NUMERIC OR WS-NUM2-DIG
                           NOT IS NUMERIC
                           DISPLAY "ENTER A VALID NUMBER."
                 ELSE
                  PERFORM UNTIL NOT WS-NUM-VALID
                     EVALUATE TRUE
                           WHEN WS-ADD
                           ADD WS-NUM1-DIG TO WS-NUM2-DIG
                                     GIVING WS-RESULT
                           SUBTRACT WS-NUM1-DIG FROM WS-NUM2-DIG
                                     GIVING WS-RESULT
                           MULTIPLY WS-NUM1-DIG BY WS-NUM2-DIG
                                     GIVING WS-RESULT
                           DIVIDE WS-NUM1-DIG BY WS-NUM2-DIG
                                     GIVING WS-RESULT
                     END-EVALUATE
                  END-PERFORM
                  MOVE WS-RESULT TO WS-NE-RESULT
                 END-IF.

      * Move the raw result to a formatted variable.

           DISPLAY "RESULT: " WS-NE-RESULT.

       STOP RUN.
       END PROGRAM DECIMAL-DATA.
