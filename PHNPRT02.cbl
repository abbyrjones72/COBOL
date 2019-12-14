      ******************************************************************
      * Author: Abby Jones
      * Date: 8/2/2018
      * Purpose: Learning
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PHNPRT02.
      ******************************************************************
      * This program prints the contents of the phone file.
      ******************************************************************

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
                 SELECT OPTIONAL PHONE-FILE
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
                 05 PHONE-LAST-NAME            PIC X(20).
                 05 PHONE-FIRST-NAME           PIC X(20).
                 05 PHONE-NUMBER               PIC X(15).
                 05 PHONE-EXTENSION            PIC X(5).

       FD  PRINTER-FILE
           LABEL RECORDS ARE OMITTED.
       01  PRINTER-RECORD                      PIC X(80).

       WORKING-STORAGE SECTION.
      * Structure for printing title line.
       01  TITLE-LINE.
                 05 FILLER                     PIC X(21) VALUE SPACE.
                 05 FILLER                     PIC X(17) VALUE
                                               "PHONE BOOK REPORT".
                 05 FILLER                     PIC X(15) VALUE SPACE.
                 05 FILLER                     PIC X(5) VALUE "Page".
                 05 PRINT-PAGE-NUMBER          PIC ZZZZ9.

      * Structure for printing a column heading.
       01  COLUMN-HEADINGS.
                 05 FILLER                     PIC X(9) VALUE
                                                   "LAST NAME".
                 05 FILLER                     PIC X(12) VALUE SPACE.
                 05 FILLER                     PIC X(10) VALUE
                                                   "FIRST NAME".
                 05 FILLER                     PIC X(11) VALUE SPACE.
                 05 FILLER                     PIC X(6) VALUE
                                                   "NUMBER".
                 05 FILLER                     PIC X(10) VALUE SPACE.
                 05 FILLER                     PIC X(4) VALUE "EXT.".

       01  DETAIL-LINE.
                 05 PRINT-LAST-NAME            PIC X(20).
                 05 FILLER                     PIC X(1) VALUE SPACE.
                 05 PRINT-FIRST-NAME           PIC X(20).
                 05 FILLER                     PIC X(1) VALUE SPACE.
                 05 PRINT-NUMBER               PIC X(15).
                 05 FILLER                     PIC X(1) VALUE SPACE.
                 05 PRINT-EXTENSION            PIC X(5).

       01  END-OF-FILE                         PIC X.

       01  PRINT-LINES                         PIC 99.
       01  PAGE-NUMBER                   PIC 9(5).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

      * The main logic of the program, at lines 007300 through 008400, opens
      * the files, initializes the PRINT-LINES and PAGE-NUMBER variables,
      * starts a new page ready for printing, and reads the first record in the
      * file.
            PERFORM OPENING-PROCEDURE THRU OPENING-PROCEDURE-EXIT.
            MOVE ZEROES TO PRINT-LINES PAGE-NUMBER.
            PERFORM START-NEW-PAGE THRU START-NEW-PAGE-EXIT.
            MOVE "N" TO END-OF-FILE.
            PERFORM READ-NEXT-RECORD THRU READ-NEXT-RECORD-EXIT.

            IF END-OF-FILE = "Y"
                      MOVE "NO RECORDS FOUND" TO PRINTER-RECORD
                      WRITE PRINTER-RECORD BEFORE ADVANCING 1.
            PERFORM PRINT-RECORDS
                 UNTIL END-OF-FILE = "Y".
            PERFORM CLOSING-PROCEDURE THRU CLOSING-PROCEDURE-EXIT.

            STOP RUN.

       OPENING-PROCEDURE.
                 OPEN INPUT PHONE-FILE.
                 OPEN OUTPUT PRINTER-FILE.

       OPENING-PROCEDURE-EXIT.
                 EXIT.

       CLOSING-PROCEDURE.
                 CLOSE PHONE-FILE.
                 PERFORM END-LAST-PAGE.
                 CLOSE PRINTER-FILE.

       CLOSING-PROCEDURE-EXIT.
                 EXIT.

       PRINT-RECORDS.
                 PERFORM PRINT-FIELDS.
                 PERFORM READ-NEXT-RECORD.

       PRINT-RECORDS-EXIT.
                 EXIT.

       PRINT-FIELDS.
                 IF PRINT-LINES NOT < 55
                           PERFORM NEXT-PAGE.
                 MOVE PHONE-LAST-NAME TO PRINT-LAST-NAME.
                 MOVE PHONE-FIRST-NAME TO PRINT-FIRST-NAME.
                 MOVE PHONE-NUMBER TO PRINT-NUMBER.
                 MOVE PHONE-EXTENSION TO PRINT-EXTENSION.
                 MOVE DETAIL-LINE TO PRINTER-RECORD.
                 WRITE PRINTER-RECORD BEFORE ADVANCING 1.

                 ADD 1 TO PRINT-LINES.

       PRINT-FIELDS-EXIT.
                 EXIT.

       READ-NEXT-RECORD.
                 READ PHONE-FILE NEXT RECORD
                 AT END
                 MOVE "Y" TO END-OF-FILE.

       READ-NEXT-RECORD-EXIT.
                 EXIT.

       NEXT-PAGE.
                 PERFORM END-LAST-PAGE.
                 PERFORM START-NEW-PAGE.

       NEXT-PAGE-EXIT.
                 EXIT.

      * The START-NEW-PAGE logic at lines 012300 through 013000 takes care of
      * starting the top of a new page. It adds 1 to the page number, moves the
      * writes TITLE-LINE, and advances two lines. The COLUMN-HEADINGS are
      * new page number to PRINT-PAGE-NUMBER in the TITLE-LINE, lines, and the
      * written, also followed by two PRINT-LINES variable is set to 4 to
      * indicate the number of lines used on the page so far.
       START-NEW-PAGE.
                 ADD 1 TO PAGE-NUMBER.
                 MOVE PAGE-NUMBER TO PRINTER-RECORD.
                 MOVE TITLE-LINE to PRINTER-RECORD.
                 WRITE PRINTER-RECORD BEFORE ADVANCING 2.
                 MOVE COLUMN-HEADINGS TO PRINTER-RECORD.
                 WRITE PRINTER-RECORD BEFORE ADVANCING 2.
                 MOVE 4 TO PRINT-LINES.

       START-NEW-PAGE-EXIT.
                 EXIT.

      * END-LAST-PAGE at lines 013200 through 013500 performs the familiar task
      * of forcing a form feed.
       END-LAST-PAGE.
                 MOVE SPACE TO PRINTER-RECORD.
                 WRITE PRINTER-RECORD BEFORE ADVANCING PAGE.
                 MOVE ZEROES TO PRINT-LINES.

       EXND-LAST-LAGE-EXIT.
                 EXIT.


       END PROGRAM PHNPRT02.
