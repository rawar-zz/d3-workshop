#!/bin/bash

echo "Load Germanys top 100 from Hadoop cluster..."

hadoop fs -getmerge top_100_tracks.tsv top_100_tracks.tsv
