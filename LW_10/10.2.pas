PROGRAM Formatting(INPUT, OUTPUT);
VAR
  W, CheckOperator: CHAR;
BEGIN
  WHILE NOT EOLN                                                                        {���� ��� ������ INPUT, ���� �� ���������� ����� ������}
  DO
    BEGIN
      READ(W);                                                                
      IF W = ' '                                                                        {�������� �� �������}
      THEN
        WHILE W = ' '
        DO
          READ(W);
      IF (CheckOperator = 'B') AND (W = ';')                                            {�������� �� ; ����� BEGIN}
      THEN
        WRITELN('  ;');
      IF ((CheckOperator <> 'B') AND (W = ';')) OR (CheckOperator = 'I')                 {�������� � ����� ;}
      THEN
        BEGIN
          WRITELN(';');
          CheckOperator := 'M'
        END;    
      IF (W = 'E')                                                                         {�������� �� END}
      THEN 
        BEGIN
          READ(W);
          IF (W = 'N')
          THEN 
            BEGIN
              READ(W);
              IF (W = 'D')
              THEN 
                BEGIN
                  READ(W);
                  IF (W = '.')
                  THEN 
                    BEGIN
                      IF (CheckOperator <> 'M') AND (CheckOperator <> 'B')
                      THEN
                        BEGIN
                          WRITELN;
                          WRITE('END.')
                        END; 
                      IF (CheckOperator = 'M') OR (CheckOperator = 'B')
                      THEN
                          WRITE('END.')   
                    END;
                  IF (W = ' ')                                                            {�������� �� ������� ����� END ����� ������}
                  THEN
                    BEGIN
                      WHILE W <> '.'
                      DO
                        BEGIN
                          READ(W);
                          IF (W = '.')
                          THEN 
                            BEGIN
                              IF (CheckOperator <> 'M') AND (CheckOperator <> 'B')
                              THEN
                                BEGIN
                                  WRITELN;
                                  WRITE('END.')
                                END;
                              IF (CheckOperator = 'M') OR (CheckOperator = 'B')
                              THEN
                              BEGIN
                                WRITE('END.')
                              END   
                            END
                        END
                    END 
                END 
            END
        END;           
      IF (W = 'B')                                                                        {�������� �� BEGIN}
      THEN 
        BEGIN
          READ(W);
          IF (W = 'E')
          THEN 
            BEGIN
              READ(W);
              IF (W = 'G')
              THEN 
                BEGIN
                  READ(W);
                  IF (W = 'I')
                  THEN 
                    BEGIN
                      READ(W);
                      IF (W = 'N')
                      THEN
                        BEGIN
                          READ(W); 
                          CheckOperator := 'B';
                          WRITELN('BEGIN')
                        END
                    END
                END
            END
        END; 
      IF (W = 'R')                                                                            {�������� �� READ � READLN}
      THEN 
        BEGIN
          READ(W);
          IF (W = 'E') 
          THEN 
            BEGIN
              READ(W);
              IF (W = 'A') 
              THEN 
                BEGIN
                  READ(W);
                  IF (W = 'D') 
                  THEN 
                    BEGIN
                      READ(W);
                      CheckOperator := 'R';
                      IF (W = 'L') 
                      THEN
                        BEGIN
                          READ(W);
                          READ(W);
                          CheckOperator := 'K'
                        END 
                    END
                END
            END
        END; 
      IF (W = 'W')                                                                              {�������� �� WRITE � WRITELN}
      THEN 
        BEGIN
          READ(W);
          IF (W = 'R') 
          THEN 
            BEGIN
              READ(W);
              IF (W = 'I') 
              THEN 
                BEGIN
                  READ(W);
                  IF (W = 'T') 
                  THEN 
                    BEGIN
                      READ(W);
                      IF (W = 'E') 
                      THEN 
                        BEGIN
                          READ(W);
                          CheckOperator := 'W';
                          IF (W = 'L')  
                          THEN
                            BEGIN
                              READ(W);
                              READ(W);
                              CheckOperator := 'L'
                            END
                        END 
                    END
                END 
            END
        END;        
      IF CheckOperator = 'W'                                                              {���� ���� WRITE}
      THEN 
        BEGIN
          WRITE('  WRITE');
          CheckOperator := 'C'           
        END;  
      IF CheckOperator = 'L'                                                              {���� ���� WRITELN}
      THEN 
        BEGIN
          WRITE('  WRITELN');
          CheckOperator := 'C'
        END;          
      IF CheckOperator = 'R'                                                              {���� ��� READ} 
      THEN 
        BEGIN
          WRITE('  READ');
          CheckOperator := 'C'          
        END;
      IF CheckOperator = 'K'                                                              {���� ��� READLN} 
      THEN 
        BEGIN
          WRITE('  READLN');
          CheckOperator := 'C'      
        END;
      IF CheckOperator = 'C'                                                              {���� ��� ������ ����� ����������} 
      THEN
        BEGIN
          IF W = ' '                                                                       {�������� �� ������ ����� ����������}
          THEN
            BEGIN
              WHILE (W = ' ')
              DO
                READ(W);
              IF W = '('                                                                     {�������� �� ( ����� �������� ����� ����������}
              THEN
                BEGIN
                  WRITE(W);
                  WHILE W <> ')'
                  DO
                    BEGIN 
                      READ(W);
                      IF W = ','
                      THEN
                        WRITE(', ');
                      IF (W <> ',') AND (W <> ' ') AND (W <> ')')
                      THEN
                        WRITE(W);
                      IF W  = ')'
                      THEN
                        WRITE(W)
                    END;
                  CheckOperator := 'Z'
                END;                                                   
              IF W = ';'                                                                        {�������� �� ; ����� �������� ����� ���������}
              THEN                                                    
                CheckOperator := 'I';
              IF (W = 'E')                                                                       {�������� �� END ����� ���������}
              THEN                                       
                BEGIN
                  READ(W);
                  IF (W = 'N') 
                  THEN 
                      BEGIN
                        READ(W);
                        IF (W = 'D') 
                        THEN 
                          BEGIN
                            READ(W);
                            IF (W = '.')
                            THEN 
                              BEGIN
                                IF (CheckOperator <> 'M') AND (CheckOperator <> 'B')
                                THEN
                                  BEGIN
                                    WRITELN;
                                    WRITE('END.');
                                    CheckOperator := 'S'
                                  END; 
                                IF (CheckOperator = 'M') OR (CheckOperator = 'B')
                                THEN
                                  BEGIN
                                    WRITE('END.');
                                    CheckOperator := 'S'
                                  END   
                              END;
                            IF (W = ' ')                                                      {�������� �� ������� ����� END ����� ������}
                            THEN
                              BEGIN
                                WHILE W <> '.'
                                DO
                                  BEGIN
                                    READ(W);
                                    IF (W = '.')
                                    THEN 
                                      BEGIN
                                        IF (CheckOperator <> 'M') AND (CheckOperator <> 'B')
                                        THEN
                                          BEGIN
                                            WRITELN;
                                            WRITE('END.')
                                          END;
                                        IF (CheckOperator = 'M') OR (CheckOperator = 'B')
                                        THEN
                                        BEGIN
                                          WRITE('END.')
                                        END   
                                      END
                                  END
                              END 
                          END 
                      END
                END
            END;
          IF W = ';'                                                                            {�������� �� ; ����� ���������}
          THEN
            CheckOperator := 'I'; 
          IF W = '('                                                                            {������� ���� ( ����� ���������}
          THEN
            BEGIN
              WRITE(W);
              WHILE W <> ')'
              DO
                BEGIN 
                  READ(W);
                  IF W = ','
                  THEN
                    WRITE(', ');
                  IF (W <> ',') AND (W <> ' ') AND (W <> ')')
                  THEN
                    WRITE(W);
                  IF W  = ')'
                  THEN
                    WRITE(W)
                END
            END
        END
    END
END.
