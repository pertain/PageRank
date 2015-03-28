# hw04_ersing.sh
#
# This script runs every other script for this assignment
# in the appropriate order.
#
# Once you extract the submission (hw04_ersing_REVISED.tgz)
# ensure that the following files are also placed in
# the extracted 'scripts' directory:
#   1) links.srt
#   2) wiki-large-filenames-short.srt
#
# When all files are in place, simply run this script.

# organize_files.sh removes dangling links and sorts files
sh organize_files.sh

# pagerank.sh calculates pageranks for every page in corpus
sh pagerank.sh

# top50.sh outputs two files: top50_inlinks.txt & top50_pageranks.txt
sh top50.sh
