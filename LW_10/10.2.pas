PROGRAM Formatting(INPUT, OUTPUT);
VAR
  W, CheckOperator: CHAR;
BEGIN
  WHILE NOT EOLN                                                                        {Цикл для чтения INPUT, пока не встретится конец строки}
  DO
    BEGIN
      READ(W);                                                                
      IF W = ' '                                                                        {Проверка на пробелы}
      THEN
        WHILE W = ' '
        DO
          READ(W);
      IF (CheckOperator = 'B') AND (W = ';')                                            {Проверка на ; после BEGIN}
      THEN
        WRITELN('  ;');
      IF ((CheckOperator <> 'B') AND (W = ';')) OR (CheckOperator = 'I')                 {Проверка и вывод ;}
      THEN
        BEGIN
          WRITELN(';');
          CheckOperator := 'M'
        END;    
      IF (W = 'E')                                                                         {Проверка на END}
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
                  IF (W = ' ')                                                            {Проверка на пробелы после END перед точкой}
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
      IF (W = 'B')                                                                        {Проверка на BEGIN}
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
      IF (W = 'R')                                                                            {Проверка на READ и READLN}
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
      IF (W = 'W')                                                                              {Проверка на WRITE и WRITELN}
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
      IF CheckOperator = 'W'                                                              {Флаг если WRITE}
      THEN 
        BEGIN
          WRITE('  WRITE');
          CheckOperator := 'C'           
        END;  
      IF CheckOperator = 'L'                                                              {Флаг если WRITELN}
      THEN 
        BEGIN
          WRITE('  WRITELN');
          CheckOperator := 'C'
        END;          
      IF CheckOperator = 'R'                                                              {Флаг для READ} 
      THEN 
        BEGIN
          WRITE('  READ');
          CheckOperator := 'C'          
        END;
      IF CheckOperator = 'K'                                                              {Флаг для READLN} 
      THEN 
        BEGIN
          WRITE('  READLN');
          CheckOperator := 'C'      
        END;
      IF CheckOperator = 'C'                                                              {Флаг для чтение после операторов} 
      THEN
        BEGIN
          IF W = ' '                                                                       {Проверка на пробел после операторов}
          THEN
            BEGIN
              WHILE (W = ' ')
              DO
                READ(W);
              IF W = '('                                                                     {Проверка на ( после пробелов после операторов}
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
              IF W = ';'                                                                        {Проверка на ; после пробелов после оператора}
              THEN                                                    
                CheckOperator := 'I';
              IF (W = 'E')                                                                       {Проверка на END после оператора}
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
                            IF (W = ' ')                                                      {Проверка на пробелы после END перед точкой}
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
          IF W = ';'                                                                            {Проверка на ; после оператора}
          THEN
            CheckOperator := 'I'; 
          IF W = '('                                                                            {Условие если ( после оператора}
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
