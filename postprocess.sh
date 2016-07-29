#!/bin/bash
torrentid=$1
torrentname=$2
torrentpath=$3
filebot -script ~/scripts/sorty.groovy -non-strict
filebot -script fn:cleaner ~/Downloads/CompletedTV
