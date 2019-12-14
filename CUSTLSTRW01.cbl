      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CUSTLST01RW.

      ******************************************************************
      * This program displays the contents of the phone file.
      ******************************************************************

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      ********************* RANDELL FIX - BEGIN ************************
           SELECT CUSTOMER-FILE
           ASSIGN TO
           "CUSTOMER.DAT"
           ORGANIZATION IS LINE SEQUENTIAL.
      ********************* RANDELL FIX - END   ************************
       DATA DIVISION.
       FILE SECTION.
       FD  CUSTOMER-FILE
           LABEL RECORDS ARE STANDARD.


           01 CUSTOMER-RECORD.
                     05 CUSTOMER-LAST-NAME     PIC X(20).
                     05 CUSTOMER-FIRST-NAME    PIC X(20).
                     05 CUSTOMER-NUMBER        PIC X(15).
                     05 CUSTOMER-EXTENSION     PIC X(5).
                     05 CUSTOMER-FAX           PIC X(15).
                     05 CUSTOMER-ADDRESS1      PIC X(25).
                     05 CUSTOMER-CITY          PIC X(15).
                     05 CUSTOMER-STATE         PIC X(15).
                     05 CUSTOMER-ZIP           PIC X(15).

       WORKING-STORAGE SECTION.

      * Structure for SCREEN DISPLAY
      ********************* RANDELL FIX - BEGIN ************************
       01  FIELDS-TO-DISPLAY.
                05 PROMPT-1           PIC X(10) VALUE "LAST NAME:".
                05 DISPLAY-LAST-NAME  PIC X(20).
                05 PROMPT-2           PIC X(6) VALUE "FIRST:".
                05 DISPLAY-FIRST-NAME PIC X(20).
                05 PROMPT-3           PIC X(3) VALUE "NO:".
                05 DISPLAY-NUMBER     PIC X(15).
                05 PROMPT-4           PIC X(4) VALUE "EXT:".
                05 DISPLAY-EXTENSION  PIC X(5).
                05 PROMPT-5           PIC X(4) VALUE "FAX:".
                05 DISPLAY-FAX        PIC X(15).
                05 PROMPT-6           PIC X(9) VALUE "ADDRESS1:".
                05 DISPLAY-ADDRESS1   PIC X(25).
                05 PROMPT-7           PIC X(5) VALUE "CITY:".
                05 DISPLAY-CITY       PIC X(15).
                05 PROMPT-8           PIC X(6) VALUE "STATE:".
                05 DISPLAY-STATE      PIC X(15).
                05 PROMPT-9           PIC X(4) VALUE "ZIP:".
                05 DISPLAY-ZIP        PIC X(15).
      ********************* RANDELL FIX - END   ************************

       01  END-OF-FILE                PIC X.
       01  SCREEN-LINES               PIC 99.
       01  A-DUMMY                    PIC X.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM OPENING-PROCEDURE.
            MOVE 0 TO SCREEN-LINES.
            MOVE "N" TO END-OF-FILE.
            PERFORM READ-NEXT-RECORD.
            PERFORM DISPLAY-RECORDS
                 UNTIL END-OF-FILE = "Y".
            PERFORM CLOSING-PROCEDURE.
            STOP RUN.

       OPENING-PROCEDURE.
                 OPEN INPUT CUSTOMER-FILE.

       CLOSING-PROCEDURE.
                 CLOSE CUSTOMER-FILE.

       DISPLAY-RECORDS.
                 PERFORM DISPLAY-FIELDS.
                 PERFORM READ-NEXT-RECORD.

       DISPLAY-FIELDS.
                 IF SCREEN-LINES = 15
                           PERFORM PRESS-ENTER.
                 MOVE CUSTOMER-LAST-NAME TO DISPLAY-LAST-NAME.
                 MOVE CUSTOMER-FIRST-NAME TO DISPLAY-FIRST-NAME.
                 MOVE CUSTOMER-NUMBER TO DISPLAY-NUMBER.
                 MOVE CUSTOMER-EXTENSION TO DISPLAY-EXTENSION.
                 MOVE CUSTOMER-FAX TO DISPLAY-FAX.
                 MOVE CUSTOMER-ADDRESS1 TO DISPLAY-ADDRESS1.
                 MOVE CUSTOMER-CITY TO DISPLAY-CITY.
                 MOVE CUSTOMER-STATE TO DISPLAY-STATE.
                 MOVE CUSTOMER-ZIP TO DISPLAY-ZIP.
                 DISPLAY FIELDS-TO-DISPLAY.
                 ADD 1 TO SCREEN-LINES.

       READ-NEXT-RECORD.
                 READ CUSTOMER-FILE NEXT RECORD
                 AT END
                 MOVE "Y" TO END-OF-FILE.

       PRESS-ENTER.
                 DISPLAY "PRESS ENTER TO CONTINUE..."
                 ACCEPT A-DUMMY.
                 MOVE 0 TO SCREEN-LINES.

       END PROGRAM CUSTLST01RW.
