# Date created: 07/02/2017
# Author: Dimitris Zafeiris

msg_from='email@emai.com'
msg_cc='email@emai.com'
msg_to='email@emai.com','email@emai.com'
mailhost='mail-host' # ; -- local database host

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

if [ $month -eq 1 ]
then
        month="January"
elif [ $month -eq 2 ]
then
        month="February"
elif [ $month -eq 3 ]
then
        month="March"
elif [ $month -eq 4 ]
then
        month="April"
elif [ $month -eq 5 ]
then
        month="May"
elif [ $month -eq 6 ]
then
        month="June"
elif [ $month -eq 7 ]
then
        month="July"
elif [ $month -eq 8 ]
then
        month="August"
elif [ $month -eq 9 ]
then
        month="September"
elif [ $month -eq 10 ]
then
        month="October"
elif [ $month -eq 11 ]
then
        month="November"
elif [ $month -eq 12 ]
then
        month="December"
fi

echo $month

echo "Sending..."
echo "<!DOCTYPE html><html><body>Hello all,<br><br>Email for $month of $year is ready.<br>" > report.html
echo "<br>" >> report.html
echo "<br><br>Best Regards,<br>Team.</body></html>" >> report.html
mailx -r "$msg_from" -s "Email Subject
MIME-Version: 1.0
Content-Type: text/html" -c "$msg_cc" "$msg_to" < report.html
