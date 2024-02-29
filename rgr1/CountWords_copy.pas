PROGRAM CountWords(INPUT, OUTPUT);
CONST
  Space = ' ';
  Hyphen = '-';
  Note = '#';
  Empty = '';
  NotAdd = FALSE;
TYPE 
  NodePtr = ^Node;
  Node = RECORD
           Key: STRING;
           Count: INTEGER;
           Next: NodePtr
         END;    
VAR
  InData, OutData: TEXT;
  
PROCEDURE GeneralRegister(VAR Letter: CHAR; VAR Check: CHAR);
BEGIN{GeneralRegister}
  CASE Letter OF
    'A', 'a': Letter := 'a';
    'B', 'b': Letter := 'b';
    'C', 'c': Letter := 'c';
    'D', 'd': Letter := 'd';
    'E', 'e': Letter := 'e';
    'F', 'f': Letter := 'f';
    'G', 'g': Letter := 'g';
    'H', 'h': Letter := 'h';
    'I', 'i': Letter := 'i';
    'J', 'j': Letter := 'j';
    'K', 'k': Letter := 'k'; 
    'L', 'l': Letter := 'l';
    'M', 'm': Letter := 'm';
    'N', 'n': Letter := 'n';
    'O', 'o': Letter := 'o';
    'P', 'p': Letter := 'p';
    'Q', 'q': Letter := 'q';
    'R', 'r': Letter := 'r';
    'S', 's': Letter := 's';
    'T', 't': Letter := 't';
    'U', 'u': Letter := 'u';
    'V', 'v': Letter := 'v';
    'W', 'w': Letter := 'w';
    'X', 'x': Letter := 'x';
    'Y', 'y': Letter := 'y';
    'Z', 'z': Letter := 'z';
    'À', 'à': Letter := 'à';
    'Á', 'á': Letter := 'á';
    'Â', 'â': Letter := 'â';
    'Ã', 'ã': Letter := 'ã';
    'Ä', 'ä': Letter := 'ä';
    'Å', 'å': Letter := 'å';
    '¨', '¸': Letter := '¸';
    'Æ', 'æ': Letter := 'æ';
    'Ç', 'ç': Letter := 'ç';
    'È', 'è': Letter := 'è';
    'É', 'é': Letter := 'é';
    'Ê', 'ê': Letter := 'ê';
    'Ë', 'ë': Letter := 'ë';
    'Ì', 'ì': Letter := 'ì';
    'Í', 'í': Letter := 'í';
    'Î', 'î': Letter := 'î';
    'Ï', 'ï': Letter := 'ï';
    'Ð', 'ð': Letter := 'ð';  
    'Ñ', 'ñ': Letter := 'ñ';
    'Ò', 'ò': Letter := 'ò';
    'Ó', 'ó': Letter := 'ó';
    'Ô', 'ô': Letter := 'ô';
    'Õ', 'õ': Letter := 'õ';
    'Ö', 'ö': Letter := 'ö';
    '×', '÷': Letter := '÷';
    'Ø', 'ø': Letter := 'ø';
    'Ù', 'ù': Letter := 'ù';
    'Ú', 'ú': Letter := 'ú';
    'Û', 'û': Letter := 'û';
    'Ü', 'ü': Letter := 'ü';
    'Ý', 'ý': Letter := 'ý';
    'Þ', 'þ': Letter := 'þ';
    'ß', 'ÿ': Letter := 'ÿ';
    '-': Letter := '-'
  ELSE
    Check := Note
  END  
END;{GeneralRegister}

PROCEDURE WordToString(VAR Word: STRING);
VAR
  Ch, Flag: CHAR;
BEGIN{WordToString}
  Flag := Empty;
  WHILE (Flag <> Note) AND (NOT EOLN(InData))
  DO
    BEGIN
      READ(InData, Ch);
      GeneralRegister(Ch, Flag);
      IF Flag <> Note
      THEN 
        Word := Word + Ch    
    END  
END;{WordToString}

PROCEDURE InsertWord(VAR FirstPtr: NodePtr; VAR NewPtr: NodePtr);
VAR
  Prev, Curr: NodePtr;
  Found: BOOLEAN;
BEGIN{InsertSymbol}
  Prev := NIL;
  Curr := FirstPtr;
  Found := FALSE;
  WHILE (Curr <> NIL) AND (NOT Found)
  DO
    IF NewPtr^.Key > Curr^.Key
    THEN
      BEGIN
        Prev := Curr;
        Curr := Curr^.Next;
      END
    ELSE
      Found := TRUE;
  NewPtr^.Next := Curr;
  IF Prev = NIL 
  THEN
    FirstPtr := NewPtr
  ELSE
    Prev^.Next := NewPtr  
END;{InsertSymbol}

PROCEDURE CheckEquality(VAR NewPtr: NodePtr; VAR FirstPtr: NodePtr; VAR CheckAdd: BOOLEAN; Word: STRING);
BEGIN{CheckEquality}
  NewPtr := FirstPtr;
  CheckAdd := TRUE;
  WHILE NewPtr <> NIL
  DO
    BEGIN
      IF Word = NewPtr^.Key
      THEN
        BEGIN
          NewPtr^.Count := NewPtr^.Count + 1;
          CheckAdd := NotAdd;
          NewPtr := NIL
        END
      ELSE
        NewPtr := NewPtr^.Next    
    END  
END;{CheckEquality}

PROCEDURE Insert(CheckAdd: BOOLEAN; VAR NewPtr: NodePtr; VAR FirstPtr: NodePtr; Word: STRING);
BEGIN{Insert}
  IF CheckAdd <> FALSE
  THEN
    BEGIN
      NEW(NewPtr);
      NewPtr^.Key := Word;
      NewPtr^.Count := NewPtr^.Count + 1; 
      InsertWord(FirstPtr, NewPtr)
    END
END;{Insert}  

PROCEDURE PrintData(FirstPtr, NewPtr: NodePtr; VAR FOut: TEXT);
BEGIN{PrintValue}
  NewPtr := FirstPtr;
  WHILE NewPtr <> NIL
  DO
    BEGIN
      WRITELN(FOut, NewPtr^.Key, ' ', NewPtr^.Count);
      NewPtr := NewPtr^.Next
    END
END;{PrintValue}

PROCEDURE BrainProgram(VAR InData: TEXT; VAR OutData: TEXT);
VAR
  FirstPtr, NewPtr: NodePtr;
  CheckAdd: BOOLEAN;  
  Word: STRING;
BEGIN{BrainProgram}
  FirstPtr := NIL;
  WHILE NOT EOF(InData)
  DO
    BEGIN
      WHILE NOT EOLN(InData)
      DO
        BEGIN
          Word := Empty;
          WordToString(Word);
          IF Word <> Empty
          THEN
            BEGIN
              CheckEquality(NewPtr, FirstPtr, CheckAdd, Word);
              Insert(CheckAdd, NewPtr, FirstPtr, Word)   
            END
        END;
      READLN(InData)
    END;
  PrintData(FirstPtr, NewPtr, OutData);
  WRITELN  
END;{BrainProgram}
  
BEGIN{CountWords}
  ASSIGN(InData, 'kolobok.txt');
  RESET(InData);
  ASSIGN(OutData, 'out.txt');
  REWRITE(OutData);
  BrainProgram(InData, OutData)
END.{CountWords}
