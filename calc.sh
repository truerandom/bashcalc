#/bin/bash
#Las funciones en bash solo regresan enteros
menu(){
	echo "------------------------------------------------------------------"
	echo "		||||||	||||||	|||	||||||				"
	echo "		||	||  ||	|||	|||				"
	echo "		||	||||||	|||	|||				"
	echo "		||||||	||  ||  |||||	||||||				"
	echo "------------------------------------------------------------------"
	echo
	echo "	[1]	Sumar"
	echo "	[2]	Restar"
	echo "	[3]	Multiplicar"
	echo "	[4]	Dividir"
	echo "	[5]	Modulo"
	echo "	[6]	Salir"
	echo
	echo "Selecciona una opcion:"
}

suma(){
	res=`echo "$n1 + $n2" | bc`
}

resta(){
	res=`echo "$n1 - $n2" | bc`
}

multiplica(){
	res=`echo "$n1 * $n2" | bc`
}

divide(){
	if [ $n2 == 0 ]; then
		echo
		echo "No puedes dividir entre cero"
		echo "Saliendo"
		exit
	fi
	res=`echo 'scale=1;'" $n1 / $n2" | bc -l`
}

modulo(){
	res=`echo "$n1 % $n2" | bc`
}

checknumber(){
	if [[ $1 = *[[:digit:]]* ]]; then
	 echo
	else
	 echo;
     echo "No ingresaste un numero"
     echo "Saliendo"
	 exit
	fi
}

dostuff(){
	res=0
	read option
	checknumber $option
	
	if [ $option == 6 ]; then
		echo;
		echo "done"
		exit
	fi

	echo "Ingresa el primer numero"
	read n1
	checknumber $n1

	echo "Ingresa el segundo numero"
	read n2
	checknumber $n2;

	case $option in
		1) 	suma;echo;echo "el resultado es $res";;
		2) 	resta;echo;echo "el resultado es  $res";;
		3)	multiplica;echo; echo "el resultado es $res";;
		4)	divide;echo;echo "el resultado es $res";;
		5)  modulo;echo;echo "el resultado es $res";;
		6)	exit;;
		*)	echo;echo "Ingresa una opcion valida la proxima vez";exit;;
	esac

}

continuar="S"
while [ "$continuar" == "S" ]; do
	menu
	dostuff
	echo
	echo "continuar? S/N "
	read continuar
	if [ "$continuar" ==  "S" ] || [ "$continuar" == "s" ] ; then
		continuar="S"
	else
		exit
	fi
done
