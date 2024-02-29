UNIT InsertSort;

INTERFACE

TYPE
  Pointer = ^Statistics;                                       {��������� �� ������}
  Statistics = RECORD                                          {������ � ������-������, ��� ����������� � ��������� ������}
                 Key: STRING;
                 Counter: INTEGER;
                 Next: Pointer
               END;     
               
PROCEDURE InsertInList(VAR First: Pointer; Word: STRING);       {������� ������ �������� � ������}

IMPLEMENTATION

PROCEDURE InsertInList(VAR First: Pointer; Word: STRING);      {���� ���������� ��������� ������� ������, ��������� ����� ����}
CONST
  DefaultCounterValue = 1;
VAR
  NewPtr, Prev, Curr: Pointer;
    
PROCEDURE FindPrevCurr(VAR Prev, Curr: Pointer; NewPtr, First: Pointer);               {����� ����������� � ���������� ��������}
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
