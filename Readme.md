---
title: "Readme.md"
author: "Kaz Klimek"
date: "September 27, 2015"
output: html_document
---


# The following document explain basic steps to create tidy data for assignment
# starting point was to create the following date frames based on the files attached
# in the zip code:
## test.lbl read y_test.csv with activities column for test set
## test.data read x_test.csv with all measurements for test set
## train.lbl read y_train.csv with activities column for train set
## train.data read x_train.csv with all measurement for train set
## features read feautures.txt with column names for both: train and test data frame
## act.labels read activity_labels.txt with descriptions for activities

# train.data and test.data were created with default V1..V561 column names
# train.lbl and test.lbl has only obne column: V1


# using names stored in features will cause issue with merging data later, 
# (so caled duplication column error) so I decided to cleanup column names vector
#  using the names (V1 to V561) stored in vector traincols (=names(train.data)) - 
# I did replace the names of columns, which plan to use later for extract
# for example: 
## first element V1 was replaced by "tBodyAcc-mean()-X" - because it's a mean col
## but elementV8 remianed the same
## see the result below (this is newset vector):
 [1] "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"              
  [3] "tBodyAcc-mean()-Z"               "tBodyAcc-std()-X"               
  [5] "tBodyAcc-std()-Y"                "tBodyAcc-std()-Z"               
  [7] "V7"                              "V8"                             
  [9] "V9"                              "V10"                            
 [11] "V11"                             "V12"                            
 [13] "V13"                             "V14"                            
 [15] "V15"                             "V16"                            
 [17] "V17"                             "V18"                            
 [19] "V19"                             "V20"                            
 [21] "V21"                             "V22"                            
 [23] "V23"                             "V24"                            
 [25] "V25"                             "V26"                            
 [27] "V27"                             "V28"                            
 [29] "V29"                             "V30"                            
 [31] "V31"                             "V32"                            
 [33] "V33"                             "V34"                            
 [35] "V35"                             "V36"                            
 [37] "V37"                             "V38"                            
 [39] "V39"                             "V40"                            
 [41] "tGravityAcc-mean()-X"            "tGravityAcc-mean()-Y"           
 [43] "tGravityAcc-mean()-Z"            "tGravityAcc-std()-X"            
 [45] "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"            
 [47] "V47"                             "V48"                            
 [49] "V49"                             "V50"                            
 [51] "V51"                             "V52"                            
 [53] "V53"                             "V54"                            
 [55] "V55"                             "V56"                            
 [57] "V57"                             "V58"                            
 [59] "V59"                             "V60"                            
 [61] "V61"                             "V62"                            
 [63] "V63"                             "V64"                            
 [65] "V65"                             "V66"                            
 [67] "V67"                             "V68"                            
 [69] "V69"                             "V70"                            
 [71] "V71"                             "V72"                            
 [73] "V73"                             "V74"                            
 [75] "V75"                             "V76"                            
 [77] "V77"                             "V78"                            
 [79] "V79"                             "V80"                            
 [81] "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"          
 [83] "tBodyAccJerk-mean()-Z"           "tBodyAccJerk-std()-X"           
 [85] "tBodyAccJerk-std()-Y"            "tBodyAccJerk-std()-Z"           
 [87] "V87"                             "V88"                            
 [89] "V89"                             "V90"                            
 [91] "V91"                             "V92"                            
 [93] "V93"                             "V94"                            
 [95] "V95"                             "V96"                            
 [97] "V97"                             "V98"                            
 [99] "V99"                             "V100"                           
[101] "V101"                            "V102"                           
[103] "V103"                            "V104"                           
[105] "V105"                            "V106"                           
[107] "V107"                            "V108"                           
[109] "V109"                            "V110"                           
[111] "V111"                            "V112"                           
[113] "V113"                            "V114"                           
[115] "V115"                            "V116"                           
[117] "V117"                            "V118"                           
[119] "V119"                            "V120"                           
[121] "tBodyGyro-mean()-X"              "tBodyGyro-mean()-Y"             
[123] "tBodyGyro-mean()-Z"              "tBodyGyro-std()-X"              
[125] "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"              
[127] "V127"                            "V128"                           
[129] "V129"                            "V130"                           
[131] "V131"                            "V132"                           
[133] "V133"                            "V134"                           
[135] "V135"                            "V136"                           
[137] "V137"                            "V138"                           
[139] "V139"                            "V140"                           
[141] "V141"                            "V142"                           
[143] "V143"                            "V144"                           
[145] "V145"                            "V146"                           
[147] "V147"                            "V148"                           
[149] "V149"                            "V150"                           
[151] "V151"                            "V152"                           
[153] "V153"                            "V154"                           
[155] "V155"                            "V156"                           
[157] "V157"                            "V158"                           
[159] "V159"                            "V160"                           
[161] "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"         
[163] "tBodyGyroJerk-mean()-Z"          "tBodyGyroJerk-std()-X"          
[165] "tBodyGyroJerk-std()-Y"           "tBodyGyroJerk-std()-Z"          
[167] "V167"                            "V168"                           
[169] "V169"                            "V170"                           
[171] "V171"                            "V172"                           
[173] "V173"                            "V174"                           
[175] "V175"                            "V176"                           
[177] "V177"                            "V178"                           
[179] "V179"                            "V180"                           
[181] "V181"                            "V182"                           
[183] "V183"                            "V184"                           
[185] "V185"                            "V186"                           
[187] "V187"                            "V188"                           
[189] "V189"                            "V190"                           
[191] "V191"                            "V192"                           
[193] "V193"                            "V194"                           
[195] "V195"                            "V196"                           
[197] "V197"                            "V198"                           
[199] "V199"                            "V200"                           
[201] "tBodyAccMag-mean()"              "tBodyAccMag-std()"              
[203] "V203"                            "V204"                           
[205] "V205"                            "V206"                           
[207] "V207"                            "V208"                           
[209] "V209"                            "V210"                           
[211] "V211"                            "V212"                           
[213] "V213"                            "tGravityAccMag-mean()"          
[215] "tGravityAccMag-std()"            "V216"                           
[217] "V217"                            "V218"                           
[219] "V219"                            "V220"                           
[221] "V221"                            "V222"                           
[223] "V223"                            "V224"                           
[225] "V225"                            "V226"                           
[227] "tBodyAccJerkMag-mean()"          "tBodyAccJerkMag-std()"          
[229] "V229"                            "V230"                           
[231] "V231"                            "V232"                           
[233] "V233"                            "V234"                           
[235] "V235"                            "V236"                           
[237] "V237"                            "V238"                           
[239] "V239"                            "tBodyGyroMag-mean()"            
[241] "tBodyGyroMag-std()"              "V242"                           
[243] "V243"                            "V244"                           
[245] "V245"                            "V246"                           
[247] "V247"                            "V248"                           
[249] "V249"                            "V250"                           
[251] "V251"                            "V252"                           
[253] "tBodyGyroJerkMag-mean()"         "tBodyGyroJerkMag-std()"         
[255] "V255"                            "V256"                           
[257] "V257"                            "V258"                           
[259] "V259"                            "V260"                           
[261] "V261"                            "V262"                           
[263] "V263"                            "V264"                           
[265] "V265"                            "fBodyAcc-mean()-X"              
[267] "fBodyAcc-mean()-Y"               "fBodyAcc-mean()-Z"              
[269] "fBodyAcc-std()-X"                "fBodyAcc-std()-Y"               
[271] "fBodyAcc-std()-Z"                "V272"                           
[273] "V273"                            "V274"                           
[275] "V275"                            "V276"                           
[277] "V277"                            "V278"                           
[279] "V279"                            "V280"                           
[281] "V281"                            "V282"                           
[283] "V283"                            "V284"                           
[285] "V285"                            "V286"                           
[287] "V287"                            "V288"                           
[289] "V289"                            "V290"                           
[291] "V291"                            "V292"                           
[293] "V293"                            "fBodyAcc-meanFreq()-X"          
[295] "fBodyAcc-meanFreq()-Y"           "fBodyAcc-meanFreq()-Z"          
[297] "V297"                            "V298"                           
[299] "V299"                            "V300"                           
[301] "V301"                            "V302"                           
[303] "V303"                            "V304"                           
[305] "V305"                            "V306"                           
[307] "V307"                            "V308"                           
[309] "V309"                            "V310"                           
[311] "V311"                            "V312"                           
[313] "V313"                            "V314"                           
[315] "V315"                            "V316"                           
[317] "V317"                            "V318"                           
[319] "V319"                            "V320"                           
[321] "V321"                            "V322"                           
[323] "V323"                            "V324"                           
[325] "V325"                            "V326"                           
[327] "V327"                            "V328"                           
[329] "V329"                            "V330"                           
[331] "V331"                            "V332"                           
[333] "V333"                            "V334"                           
[335] "V335"                            "V336"                           
[337] "V337"                            "V338"                           
[339] "V339"                            "V340"                           
[341] "V341"                            "V342"                           
[343] "V343"                            "V344"                           
[345] "fBodyAccJerk-mean()-X"           "fBodyAccJerk-mean()-Y"          
[347] "fBodyAccJerk-mean()-Z"           "fBodyAccJerk-std()-X"           
[349] "fBodyAccJerk-std()-Y"            "fBodyAccJerk-std()-Z"           
[351] "V351"                            "V352"                           
[353] "V353"                            "V354"                           
[355] "V355"                            "V356"                           
[357] "V357"                            "V358"                           
[359] "V359"                            "V360"                           
[361] "V361"                            "V362"                           
[363] "V363"                            "V364"                           
[365] "V365"                            "V366"                           
[367] "V367"                            "V368"                           
[369] "V369"                            "V370"                           
[371] "V371"                            "V372"                           
[373] "fBodyAccJerk-meanFreq()-X"       "fBodyAccJerk-meanFreq()-Y"      
[375] "fBodyAccJerk-meanFreq()-Z"       "V376"                           
[377] "V377"                            "V378"                           
[379] "V379"                            "V380"                           
[381] "V381"                            "V382"                           
[383] "V383"                            "V384"                           
[385] "V385"                            "V386"                           
[387] "V387"                            "V388"                           
[389] "V389"                            "V390"                           
[391] "V391"                            "V392"                           
[393] "V393"                            "V394"                           
[395] "V395"                            "V396"                           
[397] "V397"                            "V398"                           
[399] "V399"                            "V400"                           
[401] "V401"                            "V402"                           
[403] "V403"                            "V404"                           
[405] "V405"                            "V406"                           
[407] "V407"                            "V408"                           
[409] "V409"                            "V410"                           
[411] "V411"                            "V412"                           
[413] "V413"                            "V414"                           
[415] "V415"                            "V416"                           
[417] "V417"                            "V418"                           
[419] "V419"                            "V420"                           
[421] "V421"                            "V422"                           
[423] "V423"                            "fBodyGyro-mean()-X"             
[425] "fBodyGyro-mean()-Y"              "fBodyGyro-mean()-Z"             
[427] "fBodyGyro-std()-X"               "fBodyGyro-std()-Y"              
[429] "fBodyGyro-std()-Z"               "V430"                           
[431] "V431"                            "V432"                           
[433] "V433"                            "V434"                           
[435] "V435"                            "V436"                           
[437] "V437"                            "V438"                           
[439] "V439"                            "V440"                           
[441] "V441"                            "V442"                           
[443] "V443"                            "V444"                           
[445] "V445"                            "V446"                           
[447] "V447"                            "V448"                           
[449] "V449"                            "V450"                           
[451] "V451"                            "fBodyGyro-meanFreq()-X"         
[453] "fBodyGyro-meanFreq()-Y"          "fBodyGyro-meanFreq()-Z"         
[455] "V455"                            "V456"                           
[457] "V457"                            "V458"                           
[459] "V459"                            "V460"                           
[461] "V461"                            "V462"                           
[463] "V463"                            "V464"                           
[465] "V465"                            "V466"                           
[467] "V467"                            "V468"                           
[469] "V469"                            "V470"                           
[471] "V471"                            "V472"                           
[473] "V473"                            "V474"                           
[475] "V475"                            "V476"                           
[477] "V477"                            "V478"                           
[479] "V479"                            "V480"                           
[481] "V481"                            "V482"                           
[483] "V483"                            "V484"                           
[485] "V485"                            "V486"                           
[487] "V487"                            "V488"                           
[489] "V489"                            "V490"                           
[491] "V491"                            "V492"                           
[493] "V493"                            "V494"                           
[495] "V495"                            "V496"                           
[497] "V497"                            "V498"                           
[499] "V499"                            "V500"                           
[501] "V501"                            "V502"                           
[503] "fBodyAccMag-mean()"              "fBodyAccMag-std()"              
[505] "V505"                            "V506"                           
[507] "V507"                            "V508"                           
[509] "V509"                            "V510"                           
[511] "V511"                            "V512"                           
[513] "fBodyAccMag-meanFreq()"          "V514"                           
[515] "V515"                            "fBodyBodyAccJerkMag-mean()"     
[517] "fBodyBodyAccJerkMag-std()"       "V518"                           
[519] "V519"                            "V520"                           
[521] "V521"                            "V522"                           
[523] "V523"                            "V524"                           
[525] "V525"                            "fBodyBodyAccJerkMag-meanFreq()" 
[527] "V527"                            "V528"                           
[529] "fBodyBodyGyroMag-mean()"         "fBodyBodyGyroMag-std()"         
[531] "V531"                            "V532"                           
[533] "V533"                            "V534"                           
[535] "V535"                            "V536"                           
[537] "V537"                            "V538"                           
[539] "fBodyBodyGyroMag-meanFreq()"     "V540"                           
[541] "V541"                            "fBodyBodyGyroJerkMag-mean()"    
[543] "fBodyBodyGyroJerkMag-std()"      "V544"                           
[545] "V545"                            "V546"                           
[547] "V547"                            "V548"                           
[549] "V549"                            "V550"                           
[551] "V551"                            "fBodyBodyGyroJerkMag-meanFreq()"
[553] "V553"                            "V554"                           
[555] "V555"                            "V556"                           
[557] "V557"                            "V558"                           
[559] "V559"                            "V560"                           
[561] "V561"    

# in the next step - newset been applied to train.data and test.data as col names
# using renamestdmean function

# the next step was to attach activity descriptions to train.lbl and test.lbl
## head(train.mrglbls) is:
        V1  V2
1       5  STANDING
2       5  STANDING
3       5  STANDING
4       5  STANDING
5       5  STANDING
6       5  STANDING

# now we rename columns to be labelno and labeldesc
# train.lbl contains activity and activity desc for train
# test.lbl contains activity and activity desc for tes
# next step is to combine together activities with measurement data in both
# data frames: train.data now incorporates also train.lbl and
#              test.data incorporates test.lbl
# in both data frames we have the following cycles:
# labelno - labeldesc - tBodyAcc-mean()-X - tBodyAcc-mean()-Y- tBodyAcc-mean()-Z
# tBodyAcc-std()-X-tBodyAcc-std()-Y-tBodyAcc-std()-Z- V8 - V9 etc...

#now we are ready to combine both data frames (train.data and test.data) in one:
#  full.data<-rbind(train.data,test.data)

# the next step was to slice so created full.data into 3 slices:
# first contained labelno and labeldsc
# second all columns containing "std" in column name
# third one all columns containg "mean" in column name
# the next operation was to combine those 3 slices in one
# that way we don't have any not relevant columns (which don't heave std or mean)

# slices names are selected.labels, selected.full1 and selected.full2
# result of merge is called selected.full

# we are almost there - the next step now is create vector of names we want to
# display in tidy data as a columns names - titles
# using dcast we create tidy data frame with summarization for each of the 6 
# activities of average (mean) :
# tidy<-dcast(selected.full,labelno+labeldesc~titles,mean)
# and this is the final result, which we write to file 