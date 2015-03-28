# pagerank.sh
#
# Written by William Ersing
#
# Calculates pageranks for all pages in a given page-link set
#
# This is a REVISED version that uses external java programs
# to increase efficiency.


# use these lines to calculate pagerank for simple set from exercise 8
#CORPUS=simpleDocuments.srt
#LINKS=simpleLinks.srt

# use these lines to calculate pageranks for full wiki
CORPUS=corpus.txt
LINKS=reducedLinks.txt


isConverged=false
sz_P="$( wc -l < "$CORPUS" )"

############## The following commands are used to generate I.txt ##############

echo
echo "Generating I.txt..."

# temporarily sort $LINKS & $CORPUS so join command can be used to create I.txt
sort "$CORPUS" -o cSorted.txt
sort "$LINKS" -o lSorted.txt

# initial pagerank value of ( 1/|P| )
initPR="$( bc <<< "scale=20; 1 / $sz_P" )"

# add 'number of outlinks' column for each line in $LINKS (missing terminals)
cut -f1 lSorted.txt | sort | uniq -c | awk '{t=$1; $1=$2; $2=t;}1' > ol.txt

# merge ol.txt w/ $CORPUS to insert terminal pages (w/ outlink counts of 0)
join -a1 -o 0 2.2 -e "0" cSorted.txt ol.txt | sed 's/ /\t/g' > outlinks.txt

# add 'pagerank' column to each line of $CORPUS
awk -v pr=$initPR 'BEGIN{OFS="\t"} {$(NF+1)=pr;}1' cSorted.txt > tmpI.txt

# add 'number of outlinks' column to I.txt
join -o 0 2.2 1.2 tmpI.txt outlinks.txt | sed 's/ /\t/g' > I.txt

# sort I.txt so ordering matches that of $LINKS
LC_COLLATE=C sort I.txt -o I.txt

# clean up temp files
rm ol.txt outlinks.txt tmpI.txt cSorted.txt lSorted.txt

echo "I.txt complete"
echo

###############################################################################

echo "Calculating pageranks..."
echo

# loops until sum of differences between old and new pageranks is < 0.01 (converged)
pass=1
while [ "$isConverged" = false ]
do
    echo "[ Iteration: "$pass" ]"

    # iterate through all pages in I.txt & $LINKS in parallel
    # this part is performed by an external java program 
    firstTwoTerms="$( java LoopOne "$sz_P" "$LINKS" )"
    
    # sort R.txt by destination
    LC_COLLATE=C sort R.txt -o R.txt

    # iterate through all pages in I.txt & R.txt in parallel
    # this part is performed by an external java program 
    isConverged="$( java LoopTwo "$sz_P" "$firstTwoTerms" )"
    echo -e 'Converged?' "$isConverged"
    echo

    # updade I.txt
    mv temp_I.txt I.txt
    pass="$[$pass+1]"
done
