# 1. Обработка списков
Определите следующие процедуры для обработки списков:

- Процедуру (my-range a b d), возвращающую список чисел в интервале [a, b) с шагом d.
- Процедуру my-flatten, раскрывающую вложенные списки.
- Предикат (my-element? x xs), проверяющий наличие элемента x в списке xs. Рекомендация: для проверки равенства элементов используйте встроенный предикат equal?.
- Предикат (my-filter pred? xs), возвращающий список только тех элементов списка xs, которые удовлетворяют предикату pred?.
- Процедуру (my-fold-left op xs) для левоассоциативной свертки списка xs с помощью оператора (процедуры двух аргументов) op.
- Процедуру (my-fold-right op xs) для правоассоциативной свертки списка xs с помощью оператора (процедуры двух аргументов) op.