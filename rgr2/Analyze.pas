UNIT Analyze;

INTERFACE

USES InsertSort;
USES Words;
CONST
  Space = ' ';
PROCEDURE UpdateStatistics(VAR First: Pointer; Word: STRING); {Обновление статистики}
PROCEDURE PrintStatistics(VAR FOut: TEXT; First: Pointer);    {Печать статистики}
PROCEDURE MergeFile(VAR F: TEXT; VAR First: Pointer);             {}
PROCEDURE DisposePointers(VAR First: Pointer);                    {}

IMPLEMENTATION

PROCEDURE UpdateStatistics(VAR First: Pointer; Word: STRING);  {Проходимся по списку, ищем совпадения}
VAR                                                            {Если нашли, то увеличение счетчика}
  Ptr: Pointer;                                                {Если нет, то создание нового элемента в конец списка}
  Found: BOOLEAN;                                              {Также задаем указатель первый элемент списка, чтобы не потерять связь}
BEGIN {UpdateStatistics}
  Ptr := First;
  Found := FALSE;
  WHILE (Ptr <> NIL) AND (NOT Found)
  DO
    BEGIN
      IF Ptr^.Key = Word
      THEN
        BEGIN
          Ptr^.Counter := Ptr^.Counter + 1;
          Found := TRUE
        END;
      Ptr := Ptr^.Next    
    END;
  IF NOT Found
  THEN
    InsertInList(First, Word)
END; {UpdateStatistics}

PROCEDURE PrintStatistics(VAR FOut: TEXT; First: Pointer);            {Проходка по списку с помощью Next}
VAR                                                                   {Вывод ключа-слова и его количества через пробел}
  Ptr: Pointer; 
BEGIN {PrintStatistics}
  Ptr := First;
  WHILE Ptr <> NIL
  DO
    BEGIN
      WRITE(FOut, Ptr^.Key, Space, Ptr^.Counter);
      WRITELN(FOut);
      Ptr := Ptr^.Next
    END
END; {PrintStatistics}

PROCEDURE MergeFile(VAR F: TEXT; VAR First: Pointer);                      {}
VAR
  Word: STRING;
  Ptr: Pointer;
  NewF: TEXT;
  Count: INTEGER;
  
PROCEDURE FindCoincidences(VAR F: TEXT; VAR First: Pointer);               {}
VAR
  Word: STRING;
  Ptr: Pointer;
  Count: INTEGER;
  Found: BOOLEAN;
BEGIN {FindCoincidences}
  RESET(F);
  WHILE NOT EOF(F)
  DO
    BEGIN
      ReadWord(F, Word);
      Ptr := First;
      Found := FALSE;
      WHILE (Ptr <> NIL) AND (NOT Found)
      DO
        BEGIN
          IF Word = Ptr^.Key
          THEN
            Found := TRUE
          ELSE  
            Ptr := Ptr^.Next
        END;  
      IF Found
      THEN
        BEGIN
          READ(F, Count);
          Ptr^.Counter := Ptr^.Counter + Count
        END;
      READLN(F)     
    END;  
END; {FindCoincidences}

PROCEDURE CopyFile(VAR F1: TEXT; VAR F2: TEXT);                             {}
VAR
  Ch: CHAR;
BEGIN {CopyFile}
  RESET(F1);
  REWRITE(F2);
  WHILE NOT EOF(F1)
  DO
    BEGIN
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch);
          WRITE(F2, Ch)
        END;
      READLN(F1);
      WRITELN(F2)  
    END
END; {CopyFile}

BEGIN {MergeFile}
  FindCoincidences(F, First);
  REWRITE(NewF);
  Ptr := First;
  RESET(F);
  ReadWord(F, Word);
  WHILE (NOT EOF(F)) AND (Ptr <> NIL)
  DO
    BEGIN
      IF Word < Ptr^.Key
      THEN
        BEGIN
          READ(F, Count);
          WRITELN(NewF, Word, Space, Count);
          READLN(F);
          IF NOT EOF(F)
          THEN
            ReadWord(F, Word)
        END
      ELSE
        IF Word = Ptr^.Key
        THEN
          BEGIN
            WRITELN(NewF, Ptr^.Key, Space, Ptr^.Counter);
            Ptr := Ptr^.Next;
            READLN(F);
            IF NOT EOF(F)
            THEN
              ReadWord(F, Word)
          END
        ELSE
          BEGIN
            WRITELN(NewF, Ptr^.Key, Space, Ptr^.Counter);
            Ptr := Ptr^.Next
          END    
    END;
  
  IF NOT EOF(F)
  THEN
    BEGIN  
      READ(F, Count);
      WRITELN(NewF, Word, Space, Count);
      READLN(F)
    END;    
  WHILE NOT EOF(F)
  DO
    BEGIN
      ReadWord(F, Word);
      READ(F, Count);
      WRITELN(NewF, Word, Space, Count);
      READLN(F)
    END;
    
  WHILE Ptr <> NIL
  DO
    BEGIN
      WRITELN(NewF, Ptr^.Key, Space, Ptr^.Counter);
      Ptr := Ptr^.Next
    END;    
    
  CopyFile(NewF, F)  
END; {MergeFile}

PROCEDURE DisposePointers(VAR First: Pointer);                              {}
VAR
  Ptr, PrevPtr: Pointer; 
BEGIN {DisposePointers}
  PrevPtr := First;
  Ptr := PrevPtr^.Next;
  WHILE Ptr <> NIL
  DO
    BEGIN
      DISPOSE(PrevPtr);
      PrevPtr := Ptr;
      Ptr := Ptr^.Next
    END;
  DISPOSE(PrevPtr);
  First := NIL  
END; {DisposePointers}

BEGIN
END.
