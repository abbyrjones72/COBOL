      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXERCISE-3.
      * THIS PROGRAM PERFORMS A PARAGRAPH, 'A-PARAGRAPH' 12 TIMES USING
      * TWO METHODS.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 COUNTER          PIC 99 VALUE IS 0.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

       PERFORM A-PARAGRAPH
                 VARYING COUNTER FROM 1 BY 1
                 UNTIL COUNTER = 8.
                 DISPLAY "---BREAK-LINE---".

       PERFORM A-PARAGRAPH 8 TIMES.

            STOP RUN.

       A-PARAGRAPH.
                 DISPLAY "THIS IS A PARAGRAPH.".

       END PROGRAM EXERCISE-3.
