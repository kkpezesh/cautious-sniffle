#!/bin/bash

sleepTime=.0005
max=255
num_cols=$(tput cols)
c="█"
stride=1
if [ -n "$1" ]; then
	stride="$1"
fi
if [ -n "$2" ]; then
	c="$2"
fi

chars_printed=0
c_sz=${#c}
function printColor {
	if [ $((chars_printed + c_sz)) -ge "$num_cols"  ]; then
		printf "\n"
		chars_printed=0
	fi
	sleep $sleepTime
	printf "\e[38;2;$1;$2;$3m$4"
	chars_printed=$((chars_printed + c_sz))
}

# red to yellow
r=255
g=0
b=0
while [ "$g" -le "$max" ]; do
	printColor $r $g $b $c
	g=$((g + $stride))
done

# yellow to green
r=255
g=255
b=0
while [ "$r" -ge 0 ]; do
	printColor $r $g $b $c
	r=$((r - $stride))
done

# green to cyan
r=0
g=255
b=0
while [ "$b" -le "$max" ]; do
	printColor $r $g $b $c
	b=$((b + $stride))
done

# cyan to blue
r=0
g=255
b=255
while [ "$g" -ge 0 ]; do
	printColor $r $g $b $c
	g=$((g - $stride))
done

# blue to magenta
r=0
g=0
b=255
while [ "$r" -le "$max" ]; do
	printColor $r $g $b $c
	r=$((r + $stride))
done

# magenta to red
r=255
g=0
b=255
while [ "$b" -ge 0 ]; do
	printColor $r $g $b $c
	b=$((b - $stride))
done
printf "\n"
