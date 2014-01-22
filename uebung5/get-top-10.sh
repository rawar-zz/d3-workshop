#!/bin/bash

echo "Load Germanys top 10 from Hadoop cluster..."

hadoop fs -getmerge top_10_tracks.tsv top_10_tracks.tsv
