$ pig -version

Pig Referenz Dokumentation unter 

http://pig.apache.org/docs/r0.11.1/

$ pig 
grunt> help
grunt> fs
grunt> fs -help
grunt> fs -df -h
grunt> fs -ls 
grunt> fs -ls -h lastfm-dataset-1K
grunt> user = LOAD 'lastfm-dataset-1K/userid-profile.tsv';
grunt> part = LIMIT user 10; 
grunt> DUMP part; 
grunt> samples = SAMPLE user 0.10; 
grunt> DUMP samples;
grunt> quit;

$ pig users-tracks-data.pig


