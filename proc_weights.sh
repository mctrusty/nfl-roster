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

weightlines=weightlines-$tstamp.txt
find $dirname/ -type f -print0 | xargs -n1 -0 grep -H col-weight\"\>[0-9] > $weightlines

sed -r 's_.*/([a-z0-9]*)/.*([0-9][0-9][0-9]).*_\1 \2_' < $weightlines > weights-$tstamp.txt




