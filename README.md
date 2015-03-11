#PageRank

This is a variation of the PageRank algorithm (of Google fame). I created this
as an assignment for my Information Retrieval course (Fall 2014).

It is broken into scripts that perform specific tasks. For
example, a Bash script (organize_files.sh) is used to remove dangling links from
the original links file (links.srt). Another Bash script (top50.sh) is used to
calculate the top 50 results for both inlinks and pageranks. There are also two
Java programs (LoopOne.java & LoopTwo.java) that are used to improve the
efficiency of the original submission (which was done entirely in Bash, but was
VERY slow). Finally, I included a master Bash file (hw04_ersing.sh) that runs
each program in the appropriate order. This was done so that the entire suite of
programs can be completed simply by running a single script. Once the scripts
(Java & Bash) are in place, ~~add the following files to the same directory (they
are located in the 'input_files' directory).~~ **These files are too large for github.
If you are viewing this, and you genuinely want/need access to the original files,
then contact me. However, the format is very straightforward (with samples shown
below)**:

1. links.srt
2. wiki-large-filenames-short.srt

Either name your input files using the names shown above, or modify the program
files to reference your own input file (with formatting to match that of below).

Once the files are in place, run the program by typing: 

```
sh hw04_ersing.sh
```

**Formatting Samples**

1. **links.srt** (tab-separated, page name on left, outlinks on right)
2. **wiki-large-filenames-short.srt** (one column, only contains page names):

```
!Amigos!_2046
!Hero_d070
!Mucha_Lucha!_1b9f
$pread
'Are'are_language_60d0
'Azl_9787
'Ewa_Gentry,_Hawaii_ccc6
'Nique_06c7
'n_Beetje_Verliefd_d64f
't_Wapen_van_Hoorn_f396
't_zal_wel_gaan
(+)-delta-cadinene_synthase
(137295)_1999_RB216_4a52
(15810)_1994_JR1_9064
(15836)_1995_DA2_e7b0
(24835)_1995_SM55_9693
(24978)_1998_HJ151_afd7
(3988)_1986_LA_8c74
(9901)_1997_NV_f90f
(9925)_1981_EU24_bd61
(9935)_1986_CP1_7f5f
(9958)_1991_VL1_4c65
(9970)_1992_ST1_049b
(9989)_1997_SG16_9007
(A)_Senile_Animal_e78c
(A_Little_Touch_Of)_Baroque_in_Winter_a5fb
(Come_'Round_Here)_I'm_the_One_You_Need_3c14
(Hey_Won't_You_Play)_Another_Somebody_Done_Somebody_Wrong_Song_6bcc
(I've_Been)_Searchin'_So_Long_b78e
(Keep_Feeling)_Fascination_f5fa
(Like)_Linus_983d
(No_Pussyfooting)_c32c
(R)-3-amino-2-methylpropionate-pyruvate_transaminase_b091
(Reach_Up_for_The)_Sunrise_39a3
(See_Inside)_c4a7
(Sittin'_On)_The_Dock_of_the_Bay_7de6
```

**Please keep in mind that this was an assignment and the input files referenced
above were provided by the instructor. Due to the size restrictions of GitHub, they
are not included here.**
