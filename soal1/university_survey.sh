#! /bin/bash

# Problem 1
CSV="2023 QS World University Rankings.csv"
TOP5Japan=$(awk -F"," '/Japan/ {print $2}' "$CSV" | head -n 5)

# A
echo "Top 5 University in Japan:"
echo "$TOP5Japan"
echo ""

# B
echo "Lowest Faculty Student Score (FSR):"
awk '/Japan/' "$CSV" | sort -t, -k9n | cut -d',' -f2 | tail -n 5
echo""

# C
echo "Highest Employment Outcome Rank (GER):"
awk '/Japan/' "$CSV" | sort -t, -k20n | cut -d',' -f2 | tail -n 10
echo""

# D
echo "The Coolest (keren) University in the world!:"
awk '/Keren/' "$CSV" | cut -d',' -f2
echo""
