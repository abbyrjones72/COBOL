      ******************************************************************
      * Author: Abby Jones
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CUSTADD01RW.
      ******************************************************************
      * This program creates a new data file if necessary and adds
      * records to the file from user-entered data.
      ******************************************************************
       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      ********************* RANDELL FIX - BEGIN ************************
           SELECT CUSTOMER-FILE
                 ASSIGN TO "CUSTOMER.DAT"
                 ORGANIZATION IS LINE SEQUENTIAL.

      ********************* RANDELL FIX - END   ************************
       DATA DIVISION.
       FILE SECTION.

       FD  CUSTOMER-FILE
           LABEL RECORDS ARE STANDARD.
           01 CUSTOMER-RECORD.
                     05 CUSTOMER-LAST-NAME       PIC X(20).
                     05 CUSTOMER-FIRST-NAME      PIC X(20).
                     05 CUSTOMER-NUMBER          PIC X(15).
                     05 CUSTOMER-EXTENSION       PIC X(5).
                     05 CUSTOMER-FAX             PIC X(15).
                     05 CUSTOMER-ADDRESS1        PIC X(25).
                     05 CUSTOMER-CITY            PIC X(15).
                     05 CUSTOMER-STATE           PIC X(15).
                     05 CUSTOMER-ZIP             PIC X(15).

       WORKING-STORAGE SECTION.

      * VARIABLES FOR SCREEN ENTRY
           01 PROMPT-1     PIC X(9) VALUE "LAST NAME".
           01 PROMPT-2     PIC X(10) VALUE "FIRST NAME".
           01 PROMPT-3     PIC X(6) VALUE "NUMBER".
           01 PROMPT-4     PIC X(3) VALUE "EXT".
           01 PROMPT-5     PIC X(3) VALUE "FAX".
           01 PROMPT-6     PIC X(8) VALUE "ADDRESS1".
           01 PROMPT-7     PIC X(4) VALUE "CITY".
           01 PROMPT-8     PIC X(5) VALUE "STATE".
           01 PROMPT-9     PIC X(3) VALUE "ZIP".

           01 YES-NO       PIC X.
           01 ENTRY-OK     PIC X.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM OPENING-PROCEDURE.
            MOVE "Y" TO YES-NO.
            PERFORM ADD-RECORDS
                           UNTIL YES-NO = "N".
            PERFORM CLOSING-PROCEDURE.
            STOP RUN.

      * OPENING AND CLOSING
       OPENING-PROCEDURE.
           OPEN EXTEND CUSTOMER-FILE.

       ADD-RECORDS.

           MOVE "N" TO ENTRY-OK.
           PERFORM GET-FIELDS
                 UNTIL ENTRY-OK = "Y"
           PERFORM ADD-THIS-RECORD.
           PERFORM GO-AGAIN.

       CLOSING-PROCEDURE.
           CLOSE CUSTOMER-FILE.

       GET-FIELDS.
           MOVE SPACE TO CUSTOMER-RECORD.
           DISPLAY PROMPT-1 " ? ".
           ACCEPT CUSTOMER-LAST-NAME.
           DISPLAY PROMPT-2 " ? ".
           ACCEPT CUSTOMER-FIRST-NAME.
           DISPLAY PROMPT-3 " ? ".
           ACCEPT CUSTOMER-NUMBER.
           DISPLAY PROMPT-4 " ? ".
           ACCEPT CUSTOMER-EXTENSION.
           DISPLAY PROMPT-5 " ? ".
           ACCEPT CUSTOMER-FAX.
           DISPLAY PROMPT-6 " ? ".
           ACCEPT CUSTOMER-ADDRESS1.
           DISPLAY PROMPT-7 " ? ".
           ACCEPT CUSTOMER-CITY.
           DISPLAY PROMPT-8 " ? ".
           ACCEPT CUSTOMER-STATE.
           DISPLAY PROMPT-9 " ? ".
           ACCEPT CUSTOMER-ZIP.
           PERFORM VALIDATE-FIELDS.

       ADD-THIS-RECORD.
           WRITE CUSTOMER-RECORD.

       GO-AGAIN.
           DISPLAY "GO AGAIN?".
           ACCEPT YES-NO.
           IF YES-NO = "y"
                     MOVE "Y" TO YES-NO
           IF YES-NO NOT = "Y"
                     MOVE "N" TO YES-NO.

       VALIDATE-FIELDS.
           MOVE "Y" TO ENTRY-OK.
           IF CUSTOMER-LAST-NAME = SPACE
                     DISPLAY "LAST NAME MUST BE ENTERED"
                     MOVE "N" TO ENTRY-OK.

       END PROGRAM CUSTADD01RW.
