# 3. Работа со строками

3. Работа со строками
Реализуйте библиотеку процедур для работы со строками. Реализуйте следующие процедуры:

- Процедуры string-trim-left, string-trim-right и string-trim, удаляющие все пробельные символы в начале, конце и с обеих сторон строки соответственно.
- Предикаты (string-prefix? a b), (string-suffix? a b) и (string-infix? a b), соответственно, проверяющие, является ли строка a началом строки b, окончанием строки b или строка a где-либо встречается в строке b.
- Процедуру (string-split str sep), возвращающую список подстрок строки str, разделённых в строке str разделителями sep, где sep — непустая строка. Т.е. процедура (string-split str sep) должна разбивать строку на подстроки по строке-разделителю sep.
Рекомендуется преобразовывать входные строки к спискам символов и анализировать уже эти списки.

Примеры вызова процедур:
```scheme
(string-trim-left  "\t\tabc def")   ⇒ "abc def"
(string-trim-right "abc def\t")     ⇒ "abc def"
(string-trim       "\t abc def \n") ⇒ "abc def"

(string-prefix? "abc" "abcdef")  ⇒ #t
(string-prefix? "bcd" "abcdef")  ⇒ #f
(string-prefix? "abcdef" "abc")  ⇒ #f

(string-suffix? "def" "abcdef")  ⇒ #t
(string-suffix? "bcd" "abcdef")  ⇒ #f

(string-infix? "def" "abcdefgh") ⇒ #t
(string-infix? "abc" "abcdefgh") ⇒ #t
(string-infix? "fgh" "abcdefgh") ⇒ #t
(string-infix? "ijk" "abcdefgh") ⇒ #f
(string-infix? "bcd" "abc")      ⇒ #f

(string-split "x;y;z" ";")       ⇒ ("x" "y" "z")
(string-split "x-->y-->z" "-->") ⇒ ("x" "y" "z")
```
