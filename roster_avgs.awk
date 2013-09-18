#!/usr/bin/awk -f
{
    teamwt[$1]+=$2
    playerct[$1]++;
}
END {
    for (i in teamwt){
	avg = teamwt[i]/playerct[i];
	print avg, teamwt[i], playerct[i], i;
    }
}
