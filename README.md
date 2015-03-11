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
	 
	```
	!Amigos!_2046	%C2%A1Amigos%21_09f6
	!Hero_d070	%21Hero_%28album%29_053d
	!Hero_d070	%21Hero_d070
	!Hero_d070	Angel
	!Hero_d070	Audio_Adrenaline_a9fb
	!Hero_d070	Bethlehem%2C_Pennsylvania_d331
	!Hero_d070	Bible
	!Hero_d070	Bob_Farrell_7a92
	!Hero_d070	Brooklyn
	!Hero_d070	Caiaphas
	!Hero_d070	Christianity
	!Hero_d070	Comic_book
	!Hero_d070	DVD_1991
	!Hero_d070	Dystopia
	!Hero_d070	Earth
	!Hero_d070	Eddie_DeGarmo_a41d
	!Hero_d070	GRITS_%28band%29_d942
	!Hero_d070	Gangs
	!Hero_d070	Gospel
	!Hero_d070	Governor
	!Hero_d070	Janitor
	!Hero_d070	Jesus
	!Hero_d070	Jesus_Freak_Hideout_5d9d
	!Hero_d070	Jewish
	!Hero_d070	John_Cooper_%28musician%29_cb59
	!Hero_d070	Judaism
	!Hero_d070	Judas_Iscariot_cdd5
	!Hero_d070	Mark_Stuart_%28musician%29_3848
	!Hero_d070	Mary_Magdalene_8dd9
	!Hero_d070	Michael_Tait_431d
	!Hero_d070	New_York_City_1428
	!Hero_d070	Novel
	!Hero_d070	Paul_Wright_%28rapper%29_2d12
	!Hero_d070	Pete_Stewart_c977
	!Hero_d070	Police
	!Hero_d070	Police_Chief_cd1d
	!Hero_d070	Preacher
	!Hero_d070	Rabbi
	!Hero_d070	Rebecca_St._James_4a02
	!Hero_d070	Religion
	!Hero_d070	Resurrection_of_Jesus_9d9f
	!Hero_d070	Rock_opera
	!Hero_d070	Sanctus_Real_e861
	!Hero_d070	Skillet_%28band%29
	!Hero_d070	St._Peter_f8c9
	!Hero_d070	Synagogue
	!Hero_d070	T-Bone_%28rapper%29_c356
	!Hero_d070	index
	!Mucha_Lucha!_1b9f	%C2%A1Mucha_Lucha%21_0303
	$pread	%24pread
	$pread	Sex_worker
	$pread	Sex_workers_rights
	$pread	index
	(+)-delta-cadinene_synthase	%28%2B%29-delta-cadinene
	(+)-delta-cadinene_synthase	%28%2B%29-delta-cadinene_synthase
	(+)-delta-cadinene_synthase	2-trans%2C6-trans-farnesyl_diphosphate
	```
	 
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
