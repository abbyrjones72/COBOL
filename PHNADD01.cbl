      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PHNADD01.
      * THIS PROGRAM CREATES A NEW DATA FILE IF NECESSARY AND ADDS
      * RECORDS TO THE FILE FROM USER-ENTERED DATA.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
                 SELECT OPTIONAL PHONE-FILE
                           ASSIGN TO "PHONE.DAT"
                           ORGANIZATION IS SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.

       FD  PHONE-FILE
           LABEL RECORDS ARE STANDARD.
           01 PHONE-RECORD.
                     05 PHONE-LAST-NAME        PIC X(20).
                     05 PHONE-FIRST-NAME       PIC X(20).
                     05 PHONE-NUMBER           PIC X(15).

       WORKING-STORAGE SECTION.

      * VARIABLES FOR SCREEN ENTRY
           01 PROMPT-1     PIC X(9) VALUE "LAST NAME".
           01 PROMPT-2     PIC X(10) VALUE "FIRST NAME".
           01 PROMPT-3     PIC X(6) VALUE "NUMBER".

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
           OPEN EXTEND PHONE-FILE.

       ADD-RECORDS.

           MOVE "N" TO ENTRY-OK.
           PERFORM GET-FIELDS
                 UNTIL ENTRY-OK = "Y"
           PERFORM ADD-THIS-RECORD.
           PERFORM GO-AGAIN.

       CLOSING-PROCEDURE.
           CLOSE PHONE-FILE.

       GET-FIELDS.
           MOVE SPACE TO PHONE-RECORD.
           DISPLAY PROMPT-1 " ? ".
           ACCEPT PHONE-LAST-NAME.
           DISPLAY PROMPT-2 " ? ".
           ACCEPT PHONE-FIRST-NAME.
           DISPLAY PROMPT-3 " ? ".
           ACCEPT PHONE-NUMBER.
           PERFORM VALIDATE-FIELDS.

       ADD-THIS-RECORD.
           WRITE PHONE-RECORD.

       GO-AGAIN.
           DISPLAY "GO AGAIN?".
           ACCEPT YES-NO.
           IF YES-NO = "y"
                     MOVE "Y" TO YES-NO
           IF YES-NO NOT = "Y"
                     MOVE "N" TO YES-NO.

       VALIDATE-FIELDS.
           MOVE "Y" TO ENTRY-OK.
           IF PHONE-LAST-NAME = SPACE
                     DISPLAY "LAST NAME MUST BE ENTERED"
                     MOVE "N" TO ENTRY-OK.

       END PROGRAM PHNADD01.
