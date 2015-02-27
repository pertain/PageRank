# top50.sh
#
# Written by William Ersing
#
#	Calculates the top 50 pages by inlink count
#	Calculates the top 50 pages by pagerank


# ===============================================================
# Calculate the top 50 pages by inlink count
# ===============================================================

echo
echo "Calculating top 50 pages by inlink count..."

# count and sort links in column 2 (i.e. number of inlinks to a page)
cut -f2 reducedLinks.txt | sort | uniq -c | sort -rnk1 | head -50 > top50_inlinks.txt

# remove leading whitespace from each line
sed 's/^ *//g' -i top50_inlinks.txt

# change space delimiter to tab delimiter for each line
sed 's/ /\t/g' -i top50_inlinks.txt

# ===============================================================
# Calculate the top 50 pages by pagerank
# ===============================================================

echo "Calculating top 50 pages by pagerank..."

# sort I.txt by pagerank column and write top 50 values to file
sort -rnk3 I.txt | awk '{print $3 "\t" $1}' | head -50 > top50_pageranks.txt

echo "Done!"
echo
