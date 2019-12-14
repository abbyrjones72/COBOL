      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. NUMS01.
      *-----------------------------------------------------------------
      * ILLUSTRATES HOW DECIMAL DATA IS DISPLAYED WHEN EDITED.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  ENTRY-FIELD               PIC -ZZZ,ZZZ.ZZ.
       01  THE-VALUE                 PIC S999999V99.

       01  EDITED-DISPLAY-1          PIC -999999.99.
       01  EDITED-DISPLAY-2          PIC ZZZZZ9.99-.
       01  EDITED-DISPLAY-3          PIC ZZZZZZ.ZZ-.
       01  EDITED-DISPLAY-4          PIC ZZZ,ZZZ.ZZ-.


       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "PLEASE ENTER A VALUE".
            ACCEPT ENTRY-FIELD.
      * OR  ACCEPT ENTRY-FIELD CONVERT.
      * OR  ACCEPT ENTRY-FIELD WITH CONVERSION
            MOVE ENTRY-FIELD TO THE-VALUE.

            MOVE THE-VALUE TO EDITED-DISPLAY-1
                              EDITED-DISPLAY-2
                              EDITED-DISPLAY-3
                              EDITED-DISPLAY-4.

            DISPLAY ENTRY-FIELD      "|"
                    EDITED-DISPLAY-1 "|"
                    EDITED-DISPLAY-2 "|"
                    EDITED-DISPLAY-3 "|"
                    EDITED-DISPLAY-4 "|".

                    IF THE-VALUE <> 0
                              GO TO MAIN-PROCEDURE.

            STOP RUN.
       END PROGRAM NUMS01.
