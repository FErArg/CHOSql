#!/bin/bash

	#**************************************************************************************************
	#     Copyright (c) 2008 - 2013 Fernando A. Rodríguez para SerInformaticos.es                     #
	#                                                                                                 #
	#     Este programa es software libre: usted puede redistribuirlo y / o modificarlo               #
	#     bajo los t&eacute;rminos de la GNU General Public License publicada por la                  #
	#     la Free Software Foundation, bien de la versi&oacute;n 3 de la Licencia, o de               #
	#     la GPL2, o cualquier versi&oacute;n posterior.                                              #
	#                                                                                                 #
	#     Este programa se distribuye con la esperanza de que sea &uacute;til,                        #
	#     pero SIN NINGUNA GARANTÍA, incluso sin la garant&iacute;a impl&iacute;cita de               #
	#     COMERCIABILIDAD o IDONEIDAD PARA UN PROPÓSITO PARTICULAR. V&eacute;ase el                   #
	#     GNU General Public License para m&aacute;s detalles.                                        #
	#                                                                                                 #
	#     Usted deber&iacute;a haber recibido una copia de la Licencia P&uacute;blica General de GNU  #
	#     junto con este programa. Si no, visite <http://www.gnu.org/licenses/>.                      #
	#                                                                                                 #
	#     Puede descargar la version completa de la GPL3 en este enlace:                              #
	#     	< http://www.serinformaticos.es/index.php?file=kop804.php >                               #
	#                                                                                                 #
	#     Para mas información puede contactarnos :                                                   #
	#                                                                                                 #
	#       Teléfono  (+34) 961 19 60 62                                                              #
	#                                                                                                 #
	#       Email:    info@serinformaticos.es                                                         #
	#                                                                                                 #
	#       MSn:      info@serinformaticos.es                                                         #
	#                                                                                                 #
	#       Twitter:  @SerInformaticos                                                                #
	#                                                                                                 #
	#       Web:      www.SerInformaticos.es                                                          #
	#                                                                                                 #
	#*************************************************************************************************#

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

