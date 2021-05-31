# pagerank.sh
#
# This script drives the PageRank assignment by running
# every included script/program in the appropriate order.
#
# Once you extract the submission (.tgz archive)
# ensure that the following files are also placed in
# the extracted 'scripts' directory:
#   1) links.srt
#   2) wiki-large-filenames-short.srt
#
# When all files are in place, simply run this script.

# organize_files.sh removes dangling links and sorts files
sh organize_files.sh

# rank.sh calculates pageranks for every page in corpus
sh rank.sh

# top50.sh outputs two files: top50_inlinks.txt & top50_pageranks.txt
sh top50.sh
