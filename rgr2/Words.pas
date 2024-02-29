UNIT Words;

INTERFACE

CONST
  Alphabet = ['A' .. 'Z', 'a' .. 'z', '�' .. '�', '�' .. '�', '-'];  {�������, �� ������� ����� �������� �����}
  EmptyValue = '';

PROCEDURE PrepareFiles(VAR FIn, FOut: TEXT);                  {���������� ������ � ������}
PROCEDURE ReadWord(VAR FIn: TEXT; VAR Word: STRING);          {���������� ����� �� �����}

IMPLEMENTATION

PROCEDURE PrepareFiles(VAR FIn, FOut: TEXT);          {����� ������ � �����������}
BEGIN {PrepareFiles}                                                                             {���������� input-����� � ������}
  ASSIGN(FIn, 'kolobok.txt');                                                                           {���������� output-����� � ������}
  ASSIGN(FOut, 'out.txt');
  RESET(FIn);
  REWRITE(FOut)
END; {PrepareFiles} 

PROCEDURE ReadWord(VAR FIn: TEXT; VAR Word: STRING);   {����������� ������ �� ��� ���, ���� �� �������� ������ ��� ��������}
CONST
  DefaultCh = 'A';
VAR                                                  {��������� ������ �� ��������}
  Ch: CHAR;
  
FUNCTION TransformRegister(Ch: CHAR): CHAR;          {���������� � ������� �������� �������}
BEGIN {TransformRegister}
  CASE Ch OF
    'A': TransformRegister := 'a';
    'B': TransformRegister := 'b';
    'C': TransformRegister := 'c';
    'D': TransformRegister := 'd';
    'E': TransformRegister := 'e';
    'F': TransformRegister := 'f';
    'G': TransformRegister := 'g';
    'H': TransformRegister := 'h';
    'I': TransformRegister := 'i';
    'J': TransformRegister := 'j';
    'K': TransformRegister := 'k';
    'L': TransformRegister := 'l';
    'M': TransformRegister := 'm';
    'N': TransformRegister := 'n';
    'O': TransformRegister := 'o';
    'P': TransformRegister := 'p';
    'Q': TransformRegister := 'q';
    'R': TransformRegister := 'r';
    'S': TransformRegister := 's';
    'T': TransformRegister := 't';
    'U': TransformRegister := 'u';
    'V': TransformRegister := 'v';
    'W': TransformRegister := 'w';
    'X': TransformRegister := 'x';
    'Y': TransformRegister := 'y';
    'Z': TransformRegister := 'z';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�';
    '�': TransformRegister := '�'
  ELSE
    TransformRegister := Ch
  END    
END; {TransformRegister}  
  
BEGIN {ReadWord}
  Word := EmptyValue;
  Ch := DefaultCh;
  WHILE (Ch IN Alphabet) AND (NOT EOLN(FIn))
  DO
    BEGIN
      READ(FIn, Ch);
      IF Ch IN Alphabet
      THEN
        IF (Ch = '-') AND (EOLN(FIn))
        THEN
          READLN(FIn)
        ELSE   
          Word := Word + TransformRegister(Ch)
    END  
END; {ReadWord}

BEGIN
END.
