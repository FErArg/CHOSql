-- phpMyAdmin SQL Dump
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--	#**************************************************************************************************
--	#     Copyright (c) 2008 - 2013 Fernando A. Rodríguez para SerInformaticos.es                     #
--	#                                                                                                 #
--	#     Este programa es software libre: usted puede redistribuirlo y / o modificarlo               #
--	#     bajo los t&eacute;rminos de la GNU General Public License publicada por la                  #
--	#     la Free Software Foundation, bien de la versi&oacute;n 3 de la Licencia, o de               #
--	#     la GPL2, o cualquier versi&oacute;n posterior.                                              #
--	#                                                                                                 #
--	#     Este programa se distribuye con la esperanza de que sea &uacute;til,                        #
--	#     pero SIN NINGUNA GARANTÍA, incluso sin la garant&iacute;a impl&iacute;cita de               #
--	#     COMERCIABILIDAD o IDONEIDAD PARA UN PROPÓSITO PARTICULAR. V&eacute;ase el                   #
--	#     GNU General Public License para m&aacute;s detalles.                                        #
--	#                                                                                                 #
--	#     Usted deber&iacute;a haber recibido una copia de la Licencia P&uacute;blica General de GNU  #
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

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `hostOnline`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hosts`
--

CREATE TABLE IF NOT EXISTS `hosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` tinytext COLLATE utf8_spanish_ci NOT NULL,
  `ip` tinytext COLLATE utf8_spanish_ci NOT NULL,
  `fecha` tinytext COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=31 ;
