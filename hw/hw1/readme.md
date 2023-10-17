# 1. Определение дня недели по дате
Определите процедуру day-of-week, вычисляющую день недели по дате по григорианскому календарю. Воспользуйтесь алгоритмом, описанным в литературе. Пусть процедура принимает три формальных аргумента (день месяца, месяц и год в виде целых чисел) и возвращает целое число — номер дня в неделе (0 — воскресенье, 1 — понедельник, … 6 — суббота).
_________
# 2. Действительные корни квадратного уравнения
Определите процедуру, принимающую коэффициенты a, b и c квадратного уравнения вида *ax²+bx+c=0* и возвращающую список чисел — корней уравнения (один или два корня, или пустой список, если корней нет).
_________
# 3. НОД, НОК и проверка числа на простоту
Определите:

- Процедуру (my-gcd a b), возвращающую наибольший общий делитель чисел a и b. Поведение вашей процедуры должно быть идентично поведению встроенной процедуры gcd.

- Процедуру (my-lcm a b), возвращающую наименьшее общее кратное чисел a и b. Используйте процедуру my-gcd, определенную вами ранее. Поведение вашей процедуры должно быть идентично поведению встроенной процедуры lcm.

- Процедуру (prime? n), выполняющую проверку числа n на простоту и возвращающую #t, если число простое и #f в противном случае.