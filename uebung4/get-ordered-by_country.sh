#!/bin/bash

echo "Load Top10 ordered by country..."

hadoop fs -getmerge ordered_by_country.tsv ordered_by_country.tsv
