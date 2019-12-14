000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. PHNADD03.
000300******************************************************************
000400* This program creates a new data file if necessary and adds
000500* records to the file from user-entered data. The records ARE
000600* written to the data file and echoed to the printer.
000700******************************************************************
000800 ENVIRONMENT DIVISION.
000900 INPUT-OUTPUT SECTION.
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
                 05 PHONE-LAST-NAME            PIC X(20).
                 05 PHONE-FIRST-NAME           PIC X(20).
                 05 PHONE-NUMBER               PIC X(15).
                 05 PHONE-EXTENSION            PIC X(5).

       FD  PRINTER-FILE
           LABEL RECORDS ARE OMITTED.
       01  PRINTER-RECORD                      PIC X(80).

       WORKING-STORAGE SECTION.
      * Variables for screen entry.
       77  PROMPT-01                 PIC X(9) VALUE "LAST NAME".
       77  PROMPT-02                 PIC X(10) VALUE "FIRST NAME".
       77  PROMPT-03                 PIC X(6) VALUE "NUMBER".
       77  PROMPT-04                 PIC X(3) VALUE "EXT".

       77  YES-NO                    PIC X.
       77  ENTRY-OK                  PIC X.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM OPENING-PROCEDURE.
            MOVE "Y" TO YES-NO.
            PERFORM ADD-RECORDS
                 UNTIL YES-NO = "N".
            PERFORM CLOSING-PROCEDURE.
            STOP RUN.

      * Opening and closing
       OPENING-PROCEDURE.
                 OPEN EXTEND PHONE-FILE.
                 OPEN OUTPUT PRINTER-FILE.

       CLOSING-PROCEDURE.
                 CLOSE PHONE-FILE.
                 MOVE SPACE TO PRINTER-RECORD.
                 WRITE PRINTER-RECORD BEFORE ADVANCING PAGE.
                 CLOSE PRINTER-FILE.


       ADD-RECORDS.
                 MOVE "N" TO ENTRY-OK.
                 PERFORM GET-FIELDS
                           UNTIL ENTRY-OK = "Y".
                 PERFORM ADD-THIS-RECORD.
                 PERFORM GO-AGAIN.

       GET-FIELDS.
                MOVE SPACE TO PHONE-RECORD.
                DISPLAY PROMPT-01 " ? ".
                ACCEPT PHONE-LAST-NAME.
                DISPLAY PROMPT-02 " ? ".
                ACCEPT PHONE-FIRST-NAME.
                DISPLAY PROMPT-03 " ? ".
                ACCEPT PHONE-NUMBER.
                DISPLAY PROMPT-04 " ? ".
                ACCEPT PHONE-EXTENSION.
                PERFORM VALIDATE-FIELDS.

       VALIDATE-FIELDS.
                 MOVE "Y" TO ENTRY-OK.
                 IF PHONE-LAST-NAME = SPACE
                           DISPLAY "LAST NAME MUST BE ENTERED"
                           MOVE "N" TO ENTRY-OK.

       ADD-THIS-RECORD.
                 MOVE PHONE-RECORD TO PRINTER-RECORD.
                 WRITE PHONE-RECORD.
                 WRITE PRINTER-RECORD BEFORE ADVANCING 1.

       GO-AGAIN.
                 DISPLAY "GO AGAIN?".
                 ACCEPT YES-NO.
                 IF YES-NO = "y"
                           MOVE "Y" TO YES-NO.
                 IF YES-NO NOT = "Y"
                           MOVE "N" TO YES-NO.

       END PROGRAM PHNADD03.
