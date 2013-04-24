CHOSql
======

Bash Script and Web Page to store the Active Host in Network.


This app has two parts, the bash script and a "webpage", show the active
host in a network in a determinate date.

How it Works?
=============

The Bash Side
-------------
The Bash script pings a list of host stored in a plain text database file,
on screen you can see the result of the ping, if the host is online/offline,
if the host is online, the script store the IP, HostName and date to the
DataBase.

The script work very well with CRON.


The Web Side
------------
The small PHP scipt ask to the DB for the IP and Date, and sum all the "active
hosts" with the same time, and create a graphic representation of it.

The graphics generated are stored in the "generated" folder

For the graphic representation web use LibChart, you can download the last
vertion at: http://naku.dohcrew.com/libchart/


License

--	#**************************************************************************************************
--	#     Copyright (c) 2008 - 2013 Fernando A. Rodríguez para SerInformaticos.es                     #
--	#                                                                                                 #
--	#     Este programa es software libre: usted puede redistribuirlo y / o modificarlo               #
--	#     bajo los términos de la GNU General Public License publicada por la                         #
--	#     la Free Software Foundation, bien de la versión 3 de la Licencia, o de                      #
--	#     la GPL2, o cualquier versión posterior.                                                     #
--	#                                                                                                 #
--	#     Este programa se distribuye con la esperanza de que sea útil,                               #
--	#     pero SIN NINGUNA GARANTÍA, incluso sin la garantía implícita de                             #
--	#     COMERCIABILIDAD o IDONEIDAD PARA UN PROPÓSITO PARTICULAR. Véase el                          #
--	#     GNU General Public License para más detalles.                                               #
--	#                                                                                                 #
--	#     Usted debería haber recibido una copia de la Licencia Pública General de GNU                #
--	#     junto con este programa. Si no, visite <http://www.gnu.org/licenses/>.                      #
--	#                                                                                                 #
--	#     Puede descargar la version completa de la GPL3 en este enlace:                              #
--	#     	< http://www.serinformaticos.es/index.php?file=kop804.php >                               #
--	#                                                                                                 #
--	#     Para mas información puede contactarnos :                                                   #
--	#                                                                                                 #
--	#       Teléfono  (+34) 961 19 60 62                                                              #
--	#                                                                                                 #
--	#       Email:    info@serinformaticos.es                                                         #
--	#                                                                                                 #
--	#       MSn:      info@serinformaticos.es                                                         #
--	#                                                                                                 #
--	#       Twitter:  @SerInformaticos                                                                #
--	#                                                                                                 #
--	#       Web:      www.SerInformaticos.es                                                          #
--	#                                                                                                 #
--	#*************************************************************************************************#
