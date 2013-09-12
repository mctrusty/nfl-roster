########################################
# process the weights of NFL rosters.
#
# creator: Michael J. Cox
# version: 0.1
#
########################################

#create directory based on current date/time
tstamp=`date "+%m%d%y%H%M%S"`
dirname=rosters-$tstamp
mkdir $dirname

#http://stackoverflow.com/questions/7577615/parallel-wget-in-bash
cat nfl_team_roster_pages.txt | sed 's_http://www\.\([a-z0-9]*\)\.com.*_-P'$dirname'/\1 &_' | xargs -n 2 -P 16 wget 
#cat nfl_team_roster_pages.txt | xargs -n 1 -P 16 wget -P$dirname

cd $dirname
echo 'in $dirname'
grep col-weight\"\>[0-9] * > weightlines.txt
sed -r 's/.*([0-9][0-9][0-9]).*/\1/' <weightlines.txt >weights.txt
echo 'complete'

#change awk delims to td/tr tags...
#from http://stackoverflow.com/questions/6854586/extract-data-from-html-table-with-bash-script
#awk -F "</*td>|</*tr>" '{print }' < weights.txt | sed -e s/(\d+)/$/
