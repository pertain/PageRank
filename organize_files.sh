# organize_files.sh
#
# Written by William Ersing
#
#	Read in $FULL_LINKS -- which contains the link structure
#	for the wiki-large corpus -- and remove any lines that
#	result in dangling outlinks (i.e. values in column 2 that
#	that are not present in column 1)


# ===============================================================
# Remove lines with dangling outlinks
# ===============================================================

FULL_LINKS=links.srt
CORPUS=wiki-large-filenames-short.srt

echo
echo "Removing dangling links..."

# isolate outlinks (column 2) from $FULL_LINKS and sort
cut -f2 $FULL_LINKS | sort -u -o outlinks.txt

# sort corpus so it can be compared with outlinks.txt
sort $CORPUS -o corpus.txt

# determine common links/pages from the two files (the two columns of $FULL_LINKS)
comm -1 -2 outlinks.txt corpus.txt > common.txt

# delete lines in $FULL_LINKS not found in common.txt (i.e. dangling links)
awk 'NR==FNR{targets[$1]; next} $2 in targets' common.txt $FULL_LINKS | LC_COLLATE=C sort -o reducedLinks.txt 

# sort corpus.txt to match sorting of reducedLinks.txt
LC_COLLATE=C sort $CORPUS -o corpus.txt

# clean up tmp files
rm outlinks.txt common.txt

echo "Done!"
echo
