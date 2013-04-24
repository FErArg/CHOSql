#!/bin/bash

DB="network.db"
MySQLU="USER"
MySQLP="PASSWORD"
MySQLD="hostOnline"
MySQLS="SERVER"
MySQLT="hosts"

fecha="$(date +%F)"
hora="$(date +%H.%M)"

fecha2="$fecha $hora"
echo $fecha2
echo ""
echo ""

TOT=`wc -l < $DB`
I=1
while [ $I -le $TOT ]
do
 linea=`sed -n ${I}l $DB`
 ip=`echo $linea | cut -d";" -f1`
 host=`echo $linea | cut -d";" -f2`

 if ping -c 1 -W 1 $ip>/dev/null
 then
  echo "$ip - $host - OnLine"
  mysql --host=$MySQLS --user=$MySQLU --password=$MySQLP -D $MySQLD \
	-Bse "INSERT INTO $MySQLT (hostname,ip,fecha) \
	VALUES ('$host','$ip','$fecha2');"
 else
  echo "$ip - $host - OffLine"
 fi

I=`expr $I + 1`
done

