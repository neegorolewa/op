PROGRAM CountWords2(INPUT, OUTPUT);
USES Analyze;
USES InsertSort;
USES Words;     
    
CONST
  MaxSize = 1000;
   
VAR
  FIn, FOut: TEXT;
  Word: STRING;
  First: Pointer;
  Counter: INTEGER;

BEGIN
  PrepareFiles(FIn, FOut);
  First := NIL;
  Counter := 0;
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      WHILE NOT EOLN(FIn)
      DO
        BEGIN
          ReadWord(FIn, Word);
          IF Word <> EmptyValue
          THEN
            UpdateStatistics(First, Word);
          Counter := Counter + 1;
          IF Counter = MaxSize
          THEN
            BEGIN
              Counter := 0;
              MergeFile(FOut, First);
              DisposePointers(First)
            END;  
        END;
      READLN(FIn)  
    END;
  MergeFile(FOut, First);
  DisposePointers(First)
END.                  
