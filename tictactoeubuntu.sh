tic=(0 0 0 0 0 0 0 0 0)
clear
echo "what do you want X or O?"
while :
do
	read tac
	case $tac in
	[Oo] )
		clear
		echo you chosed O
		break
		;;
	[Xx] )
		clear
		echo you chosed X
		break
		;;
	* )
		clear
		echo plz enter O or X
		;;
esac
done
case $tac in
	[Oo] )
		tac=O
		toe=X
		;;
	[Xx] )
		tac=X
		toe=O
		;;
esac
while :
do
	clear
	for i in 0 1 2
	do
		for j in 0 1 2
		do
			k=`echo "8-$i*3-(2-$j)"|bc`
			echo -n ' '${tic[$k]}' |'|tr 012 " $tac$toe"
		done
		echo
		echo "___+___+___+"
	done

	while :
	do
		echo 'where do you want to play?'
		read h
		case $h in 
			[123456789] )
				h=`echo $h-1|bc`
				case ${tic[$h]} in
					[12] )
						echo "you can't"
						;;
					[0] )
						break
						;;
				esac
				;;
		esac
	done
	tic[$h]=1
	clear
	for i in 0 1 2
	do
		for j in 0 1 2
		do
			k=`echo "8-$i*3-(2-$j)"|bc`
			echo -n ' '${tic[$k]}' |'|tr 012 " $tac$toe"
		done
		echo
		echo "___+___+___+"
	done
	x=0
	for i in 0 1 2 3 4 5 6 7 8
	do
		if [ "${tic[$i]}" = "0" ]
		then
			x=1
			break
		fi
	done
	case $x in
		[1] )
			while :
			do
				n=`shuf -i 0-8 -n 1`
				case ${tic[$n]} in
					[12] )
						n=`shuf -i 0-8 -n 1`
						;;
					* )
						tic[$n]=2
						break
						;;
				esac
			done
			;;
	esac
	clear
	for i in 0 1 2
	do
		for j in 0 1 2
		do
			k=`echo "8-$i*3-(2-$j)"|bc`
			echo -n ' '${tic[$k]}' |'|tr 012 " $tac$toe"
		done
		echo
		echo "___+___+___+"
	done
	l=0
	for i in 0 1 2
	do
		k=`echo $i*3|bc`
		a=`echo ${tic[$k]}==1|bc`
		k=`echo $k+1|bc`
		b=`echo ${tic[$k]}==1|bc`
		k=`echo $k+1|bc`
		c=`echo ${tic[$k]}==1|bc`
		p=`echo "$a&&$b&&$c"|bc`
		if [ "$p" = "1" ]
		then
			l=1
			break
		fi
		k=`echo $i*3|bc`
		a=`echo ${tic[$k]}==2|bc`
		k=`echo $k+1|bc`
		b=`echo ${tic[$k]}==2|bc`
		k=`echo $k+1|bc`
		c=`echo ${tic[$k]}==2|bc`
		p=`echo "$a&&$b&&$c"|bc`
		if [ "$p" = "1" ]
		then
			l=2
			break
		fi
		k=$i
		a=`echo ${tic[$k]}==1|bc`
		k=`echo $k+3|bc`
		b=`echo ${tic[$k]}==1|bc`
		k=`echo $k+3|bc`
		c=`echo ${tic[$k]}==1|bc`
		p=`echo "$a&&$b&&$c"|bc`
		if [ "$p" = "1" ]
		then
			l=1
			break
		fi
		k=$i
		a=`echo ${tic[$k]}==2|bc`
		k=`echo $k+3|bc`
		b=`echo ${tic[$k]}==2|bc`
		k=`echo $k+3|bc`
		c=`echo ${tic[$k]}==2|bc`
		p=`echo "$a&&$b&&$c"|bc`
		if [ "$p" = "1" ]
		then
			l=2
			break
		fi
		k=$i
		a=`echo ${tic[$k]}==1|bc`
		k=4
		b=`echo ${tic[$k]}==1|bc`
		k=`echo 8-$i|bc`
		c=`echo ${tic[$k]}==1|bc`
		p=`echo "$a&&$b&&$c"|bc`
		if [ "$p" = "1" ]
		then
			l=1
			break
		fi
		k=$i
		a=`echo ${tic[$k]}==2|bc`
		k=4
		b=`echo ${tic[$k]}==2|bc`
		k=`echo 8-$i|bc`
		c=`echo ${tic[$k]}==2|bc`
		p=`echo "$a&&$b&&$c"|bc`
		if [ "$p" = "1" ]
		then
			l=1
			break
		fi

	done
	m=0
	for po in 0 1 2 3 4 5 6 7 8
	do
		case ${tic[$po]} in
			[0] )
				m=1
				;;
		esac
	done

	if [ "$l" = "1" ]
	then
		echo "you are the winner"
		break
	elif [ "$l" = "2" ]
	then
		echo "the computer is the winner"
		break
	elif [ "$m" = "0" ]
	then
		echo "no one won"
		break
	fi
done
echo "do you want to play again?"
while :
 do
	 read a
	 case $a in
		 [Yy]* )
			 clear
			 ./tictactoeubuntu.sh
			 break
			 ;;
		 * )
			 clear
			 echo "thank you for playing"
			 break
			 ;;
	 esac
 done

