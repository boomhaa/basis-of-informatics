#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Неверное количество аргументов командной строки."
    echo "Использование: ./script.sh <путь_к_программе> <периодичность(t) в минутах>"
    exit 1
fi



program_path=$1
period=$2


if [ ! -f "$program_path" ]; then
    echo "Ошибка: указанный файл не существует."
    exit 1
fi

output_file="output_$(date +%Y%m%d_%H%M%S).txt"
error_file="error_$(date +%Y%m%d_%H%M%S).txt"
execute_program() {
    echo $! > pid_file.pid
    $program_path >> $output_file 2>> $error_file
    rm pid_file.pid
}
while true; do
    if [ ! -e "pid_file.pid" ]; then
        execute_program &
        echo "Программа запущена."
    else
      
        echo "Программа уже запущена. Ожидание завершения..."

    fi
    sleep $(($period * 60))
done  
