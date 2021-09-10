#!/bin/sh

rm -rf $HOME/test
rm -f $HOME/list1
rm -f $HOME/list_conf
rm -f $HOME/list_conf_d
rm -f $HOME/list_link
rm -f $HOME/man.txt
rm -rf $HOME/man.dir

#1 ------------------------------------------------------

mkdir $HOME/test

#2 ------------------------------------------------------

echo "----------ДИРЕКТОРИИ----------- " > $HOME/test/list
ls -A -l /etc | grep "^d" >> $HOME/test/list
echo "----------ФАЙЛЫ----------- " >> $HOME/test/list
ls -A -l /etc | grep "^-" >> $HOME/test/list
#3 ------------------------------------------------------

echo "Кол-во директорий: " >> $HOME/test/list
ls -A -l /etc | grep "^d" | wc -l >> $HOME/test/list
echo "Кол-во скрытых файлов: " >> $HOME/test/list
a=$(ls -A -l /etc | grep "^-" | wc -l)
b=$(ls -l /etc | grep "^-" | wc -l)
let c=$a-$b
echo $c >> $HOME/test/list

#4 ------------------------------------------------------

mkdir $HOME/test/links

#5 ------------------------------------------------------

ln $HOME/test/list $HOME/test/links/list_hlink

#6 ------------------------------------------------------

ln -s $HOME/test/list $HOME/test/links/list_slink

#7 ------------------------------------------------------

a=$(stat --format=%h $HOME/test/links/list_hlink)
echo "Кол-во жестких ссылок файла list_hlink"
echo $a

b=$(stat --format=%h $HOME/test/list)
echo "Кол-во жестких ссылок файла list"
echo $b

c=$(stat --format=%h $HOME/test/links/list_slink)
echo "Кол-во жестких ссылок файла list_slink"
echo $c

#8 ------------------------------------------------------

wc -l $HOME/test/list | cut -d " " -f1 >> $HOME/test/links/list_hlink

#9 ------------------------------------------------------
echo "Задание 9: "
if cmp $HOME/test/links/list_hlink $HOME/test/links/list_slink;
then
        echo "YES";
else
        echo "NO";
fi;

#10 -----------------------------------------------------

mv $HOME/test/list $HOME/test/list1

#11 -----------------------------------------------------

echo "Задание 11: "
if cmp $HOME/test/links/list_hlink $HOME/test/links/list_slink;
then
        echo "YES";
else
        echo "NO";
fi;

#12 -----------------------------------------------------

ln $HOME/test/list1 list_link

#13 -----------------------------------------------------

find /etc/ -name "*.conf" > $HOME/list_conf

#14 -----------------------------------------------------

find /etc/ -maxdepth 1 -name "*.d" -type d > $HOME/list_d

#15 -----------------------------------------------------

cat $HOME/list_conf > $HOME/list_conf_d
cat $HOME/list_d >> $HOME/list_conf_d

#16 -----------------------------------------------------

mkdir $HOME/test/.sub

#17 -----------------------------------------------------

cp $HOME/list_conf_d $HOME/test/.sub/

#18 -----------------------------------------------------

cp -b $HOME/list_conf_d $HOME/test/.sub/

#19 -----------------------------------------------------

echo "Задание 19: "
ls -R -a $HOME/test

#20 -----------------------------------------------------

man man > $HOME/man.txt

#21 -----------------------------------------------------

split -b 1024 -d $HOME/man.txt "man_"

#22 -----------------------------------------------------

mkdir $HOME/man.dir

#23 -----------------------------------------------------

mv $HOME/man_* man.dir

#24 -----------------------------------------------------

cat $HOME/man.dir/man_* > $HOME/man.dir/man.txt
rm -f $HOME/man.dir/man_*

#25 -----------------------------------------------------

echo "Задание 25: "
if cmp $HOME/man.txt $HOME/man.dir/man.txt;
then
        echo "YES";
else
        echo "NO";
fi;

#26 -----------------------------------------------------

echo "Строка в начале 1" > $HOME/temp
echo "Строка в начале 2" >> $HOME/temp
cat $HOME/man.txt >> $HOME/temp
cat $HOME/temp > $HOME/man.txt;
echo "Строка в конце 1" >> $HOME/man.txt
echo "Строка в конце 2" >> $HOME/man.txt
rm -f $HOME/temp

#27 -----------------------------------------------------

diff $HOME/man.txt $HOME/man.dir/man.txt > $HOME/man_diff.txt

#28 -----------------------------------------------------

mv $HOME/man_diff.txt $HOME/man.dir/

#29 -----------------------------------------------------

patch $HOME/man.dir/man.txt $HOME/man.dir/man_diff.txt

#30 -----------------------------------------------------

echo "Задание 30: "
if cmp $HOME/man.txt $HOME/man.dir/man.txt;
then
        echo "YES";
else
        echo "NO";
fi;



