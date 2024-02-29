UNIT Words;

INTERFACE

CONST
  Alphabet = ['A' .. 'Z', 'a' .. 'z', 'А' .. 'Я', 'а' .. 'я', '-'];  {Символы, из которых могут состоять слова}
  EmptyValue = '';

PROCEDURE PrepareFiles(VAR FIn, FOut: TEXT);                  {Подготовка файлов к работе}
PROCEDURE ReadWord(VAR FIn: TEXT; VAR Word: STRING);          {Считывание слова из файла}

IMPLEMENTATION

PROCEDURE PrepareFiles(VAR FIn, FOut: TEXT);          {Связь файлов с переменными}
BEGIN {PrepareFiles}                                                                             {подготовка input-файла к чтению}
  ASSIGN(FIn, 'kolobok.txt');                                                                           {подготовка output-файла к записи}
  ASSIGN(FOut, 'out.txt');
  RESET(FIn);
  REWRITE(FOut)
END; {PrepareFiles} 

PROCEDURE ReadWord(VAR FIn: TEXT; VAR Word: STRING);   {Посимвольно читаем до тех пор, пока не встретим символ вне алфавита}
CONST
  DefaultCh = 'A';
VAR                                                  {Формируем строку из символов}
  Ch: CHAR;
  
FUNCTION TransformRegister(Ch: CHAR): CHAR;          {Приведение к нижнему регистру символа}
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
    'А': TransformRegister := 'а';
    'Б': TransformRegister := 'б';
    'В': TransformRegister := 'в';
    'Г': TransformRegister := 'г';
    'Д': TransformRegister := 'д';
    'Е': TransformRegister := 'е';
    'Ё': TransformRegister := 'ё';
    'Ж': TransformRegister := 'ж';
    'З': TransformRegister := 'з';
    'И': TransformRegister := 'и';
    'К': TransformRegister := 'к';
    'Л': TransformRegister := 'л';
    'М': TransformRegister := 'м';
    'Н': TransformRegister := 'н';
    'О': TransformRegister := 'о';
    'П': TransformRegister := 'п';
    'Р': TransformRegister := 'р';
    'С': TransformRegister := 'с';
    'Т': TransformRegister := 'т';
    'У': TransformRegister := 'у';
    'Ф': TransformRegister := 'ф';
    'Х': TransformRegister := 'х';
    'Ц': TransformRegister := 'ц';
    'Ч': TransformRegister := 'ч';
    'Ш': TransformRegister := 'ш';
    'Щ': TransformRegister := 'щ';
    'Ъ': TransformRegister := 'ъ';
    'Ы': TransformRegister := 'ы';
    'Ь': TransformRegister := 'ь';
    'Э': TransformRegister := 'э';
    'Ю': TransformRegister := 'ю';
    'Я': TransformRegister := 'я'
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
