      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CMPINT01.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01  YES-NO                              PIC X.
       01  THE-INTEREST                        PIC 99V9.
       01  INTEREST-AS-DECIMAL                 PIC V999.
       01  THE-PRINCIPAL                       PIC 9(9)V99.
       01  THE-NEW-VALUE                       PIC 9(9)V99.
       01  EARNED-INTEREST                     PIC 9(9)V99.
       01  THE-PERIOD                          PIC 9999.
       01  NO-OF-PERIODS                       PIC 999.

       01  ENTRY-FIELD                         PIC Z(9).ZZ.
       01  DISPLAY-VALUE                       PIC ZZZ,ZZZ,ZZ9.99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            MOVE "Y" TO YES-NO.
            PERFORM GET-AND-DISPLAY-RESULT
                 UNTIL YES-NO = "N".

            STOP RUN.

           GET-AND-DISPLAY-RESULT.
                 PERFORM GET-THE-PRINCIPAL.
                 PERFORM GET-THE-INTEREST.
                 PERFORM GET-THE-PERIODS.
                 PERFORM CALCULATE-THE-RESULT.
                 PERFORM CALCULATE-ONE-PERIOD.
                 PERFORM DISPLAY-THE-RESULT.
                 PERFORM GO-AGAIN.


           GET-THE-PRINCIPAL.
                     DISPLAY "PRINCIPAL (.01 TO 999999.99)?".
                     ACCEPT ENTRY-FIELD.
                     MOVE ENTRY-FIELD TO THE-PRINCIPAL.
                     IF THE-PRINCIPAL < .01 OR
                               THE-PRINCIPAL > 999999.99
                               DISPLAY "INVALID ENTRY"
                               GO TO GET-THE-PRINCIPAL.

           GET-THE-INTEREST.
                     DISPLAY "INTEREST (.1% TO 99.9%)?"
                     ACCEPT ENTRY-FIELD.
                     MOVE ENTRY-FIELD TO THE-INTEREST.
                     IF THE-INTEREST < .1 OR THE-INTEREST > 99.9
                               DISPLAY "INVALID ENTRY"
                               GO TO GET-THE-INTEREST
                     ELSE
                               COMPUTE INTEREST-AS-DECIMAL =
                               THE-INTEREST / 100.

           GET-THE-PERIODS.
                     DISPLAY "NUMBER OF PERIODS (1 TO 999)?".
                     ACCEPT ENTRY-FIELD.
                     MOVE ENTRY-FIELD TO NO-OF-PERIODS.
                     IF NO-OF-PERIODS < 1 OR NO-OF-PERIODS > 999
                               DISPLAY "INVALID ENTRY"
                               GO TO GET-THE-PERIODS.

           CALCULATE-THE-RESULT.
                     PERFORM CALCULATE-ONE-PERIOD
                           VARYING THE-PERIOD FROM 1 BY 1
                                     UNTIL THE-PERIOD > NO-OF-PERIODS.

           CALCULATE-ONE-PERIOD.
                     COMPUTE EARNED-INTEREST ROUNDED =
                           THE-PRINCIPAL * INTEREST-AS-DECIMAL.
                     COMPUTE THE-NEW-VALUE =
                     THE-PRINCIPAL + EARNED-INTEREST.
                     MOVE THE-NEW-VALUE TO THE-PRINCIPAL.

           GO-AGAIN.
                     DISPLAY "GO AGAIN?".
                     ACCEPT YES-NO.
                     IF YES-NO = "y"
                               MOVE "Y" TO YES-NO
                     IF YES-NO NOT = "y"
                               MOVE "N" TO YES-NO.

           DISPLAY-THE-RESULT.
                     MOVE THE-NEW-VALUE TO DISPLAY-VALUE.
                     DISPLAY "RESULTING VALUE IS " DISPLAY-VALUE.
       END PROGRAM CMPINT01.
