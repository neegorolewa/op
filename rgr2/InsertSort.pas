UNIT InsertSort;

INTERFACE

TYPE
  Pointer = ^Statistics;                                       {Указатель на запись}
  Statistics = RECORD                                          {Запись с ключом-словом, его количеством и следующим словом}
                 Key: STRING;
                 Counter: INTEGER;
                 Next: Pointer
               END;     
               
PROCEDURE InsertInList(VAR First: Pointer; Word: STRING);       {Вставка нового элемента в список}

IMPLEMENTATION

PROCEDURE InsertInList(VAR First: Pointer; Word: STRING);      {Ищем предыдущий следующий элемент списка, вставляем между ними}
CONST
  DefaultCounterValue = 1;
VAR
  NewPtr, Prev, Curr: Pointer;
    
PROCEDURE FindPrevCurr(VAR Prev, Curr: Pointer; NewPtr, First: Pointer);               {Поиск предыдущего и следующего элемента}
VAR
  Found: BOOLEAN;
BEGIN {FindPrevCurr}
  Prev := NIL;
  Curr := First;
  Found := FALSE;
  WHILE (Curr <> NIL) AND NOT Found
  DO
    IF NewPtr^.Key > Curr^.Key
    THEN
      BEGIN
        Prev := Curr;
        Curr := Curr^.Next
      END
    ELSE
      Found := TRUE
END; {FindPrevCurr}

BEGIN {InsertInList}
  NEW(NewPtr);
  NewPtr^.Key := Word;
  NewPtr^.Counter := DefaultCounterValue;
  FindPrevCurr(Prev, Curr, NewPtr, First);
  NewPtr^.Next := Curr;
  IF Prev = NIL 
  THEN
    First := NewPtr
  ELSE
    Prev^.Next := NewPtr
END; {InsertInList}

BEGIN
END.
