      ******************************************************************
      * Author: ABBY JONES
      * Date: 7/30/2018
      * Purpose: LEARNING
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      ******************************************************************
      * This program creates a new data file and filles it with Test
      * data. The test records are written to the data file and echoed
      * to the printer.
      ******************************************************************
       PROGRAM-ID. PHNBLD01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
                 SELECT PHONE-FILE
                           ASSIGN TO "phone.dat"
                           ORGANIZATION IS SEQUENTIAL.

                 SELECT PRINTER-FILE
                           ASSIGN TO PRINTER
                           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  PHONE-FILE
           LABEL RECORDS ARE STANDARD.
       01  PHONE-RECORD.
                 05 PHONE-LAST-NAME        PIC X(20).
                 05 PHONE-FIRST-NAME       PIC X(20).
                 05 PHONE-NUMBER           PIC X(15).
                 05 PHONE-EXTENSION        PIC X(5).

       FD  PRINTER-FILE
           LABEL RECORDS ARE OMITTED.
       01  PRINTER-RECORD            PIC X(80).


       WORKING-STORAGE SECTION.
       01  HOW-MANY                  PIC 999.
       01  ENTRY-FIELD               PIC ZZZ.

       01  PRINT-LINES               PIC 99 VALUE ZEROES.
       01  FORMATTED-NUMBER.
                 05 FILLER           PIC X(6) VALUE "(404) ".
                 05 FILLER           PIC X(4) VALUE "555-".
                 05 PHONE-COUNTER    PIC 9(4) VALUE ZERO.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM OPENING-PROCEDURE.
            PERFORM GET-HOW-MANY.
            MOVE ZEROES TO PRINT-LINES.
            PERFORM ADD-RECORDS
                 VARYING PHONE-COUNTER
                 FROM 1 BY 1 UNTIL
                  PHONE-COUNTER > HOW-MANY.
            PERFORM CLOSING-PROCEDURE.

            STOP RUN.

       OPENING-PROCEDURE.
                 OPEN OUTPUT PHONE-FILE.
                 OPEN OUTPUT PRINTER-FILE.

       CLOSING-PROCEDURE.
                 CLOSE PHONE-FILE.
                 MOVE SPACE TO PRINTER-RECORD.
                 WRITE PRINTER-RECORD BEFORE ADVANCING PAGE.
                 CLOSE PRINTER-FILE.

       GET-HOW-MANY.
                 DISPLAY "HOW MANY TEST ENTRIES (1-999)?".
                 ACCEPT ENTRY-FIELD.
                 MOVE ENTRY-FIELD TO HOW-MANY.

       ADD-RECORDS.
                 PERFORM FORMAT-THE-RECORD.
                 PERFORM ADD-THIS-RECORD.

       FORMAT-THE-RECORD.
                 MOVE "JOSHUA----------X" TO PHONE-FIRST-NAME.
                 MOVE "JOHNSON----------X" TO PHONE-LAST-NAME.
                 MOVE "12345" TO PHONE-EXTENSION.
                 MOVE FORMATTED-NUMBER TO PHONE-NUMBER.

       ADD-THIS-RECORD.
                 WRITE PHONE-RECORD.
                 PERFORM PRINT-THIS-RECORD.

       PRINT-THIS-RECORD.
                 IF PRINT-LINES NOT < 55
                           PERFORM NEW-PAGE.
                 MOVE PHONE-RECORD TO PRINTER-RECORD.
                 WRITE PRINTER-RECORD BEFORE ADVANCING 1.
                 ADD 1 TO PRINT-LINES.

       NEW-PAGE.
                 MOVE SPACE TO PRINTER-RECORD.
                 WRITE PRINTER-RECORD BEFORE ADVANCING PAGE.
                 MOVE ZEROES TO PRINT-LINES.

       END PROGRAM PHNBLD01.
