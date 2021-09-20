
#!/bin/sh

directory=''
read directory
if ! [ -d $directory ]; then
echo "Директория не найдена"
exit
fi
find "$directory" -type d > tmp.txt
echo "Пустые директории: "
while IFS= read -r line; do
    check=$(ls -A "$line" | wc -l)
    if [[ "$check" == 0 ]]; then
        echo "$line"
    fi
done < tmp.txt
