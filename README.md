CHOSql
======

Bash Script and Web Page to store the Active Host in Network.


CHOSql is a small project writed to one of owr customers.

This app has two parts, the bash script and a "webpage".

How it Works?

The Bash Side

The Bash script pings a list of host stored in a plain text database file,
on screen you can see the result of the ping, if the host is online/offline,
if the host is online, the script store the IP, HostName and date to the
DataBase.

The script work very well with CRON.



The Web Side

The small PHP scipt ask to the DB for the IP and Date, and sum all the "active
hosts" with the same time, and create a graphic representation of it.

For the graphic representation web use LibChart
