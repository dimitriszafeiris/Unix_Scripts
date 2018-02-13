# Script name: call_teradata_procedure.sh
# Date created: 03/02/2017
# Author: Dimitris Zafeiris

_SH_FUNCS="Y"
_SQL_FUNCS="Y"

. $MYCONF

#Set day equal to 01, as we always want the first day of the previous month
day=01
echo "Day will always be $day for all runs."

#Set month equal to previous month
month=`printf "%(%m)T\n" "last month"`
echo "Correct month for this run is $month."

#Set year equal to current year
year=`date +%Y`

#Check if month is equal to 12. If yes, we have to take the previous year, as current month is January
if [ $month -eq 12 ]
then
 year=`expr $year - 1`
fi
echo "Correct year for this run is $year."

#Set full timestamp for this run
timestamp=$year$month$day
echo "Correct full timestamp for this run is $timestamp"

#Export timestamp in order to use it at bteq
export current_timestamp=$timestamp
echo "Current timestamp is $current_timestamp."

echo "Now trying to connect to database..."

bteq  <<!EOF

.logon server_machine_ip/teradata_user,teradata_password;

.set titledashes off
.set echoreq off
.foldline off
.sidetitles off
.width 500

--Random Teradata query
select * from dbc.tables;

--Call of store procedure
call schema.procedure_name($current_timestamp);

.logoff;
.quit;
!EOF
