
label define ER25001L  ///
       1 "Release number 1, March 2007"  ///
       2 "Release number 2, May 2007"  ///
       3 "Release number 3, November 2013"  ///
       4 "Release number 4, February 2014"  ///
       5 "Release number 5, January 2016"  ///
       6 "Release number 6, November 2017"

label define ER25018L  ///
       1 "Male"  ///
       2 "Female"

label define ER25138L  ///
       1 "Yes"  ///
       5 "No"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  not working for money now (ER25104=03-08 or 99 and ER25108=5, 8, or 9); works for self only or for both someone else and self (ER25129=2, 3, 8, or 9)"

label define ER25139L  ///
       1 "Yes"  ///
       5 "No"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  not working for money now (ER25104=03-08 or 99 and ER25108=5, 8, or 9); works for self only or or for both someone else and self (ER25129=2, 3, 8, or 9); current job not covered by union contract (ER25138=5, 8, or 9)"

label define ER27392L  ///
       1 "Mexican"  ///
       2 "Mexican American"  ///
       3 "Chicano"  ///
       4 "Puerto Rican"  ///
       5 "Cuban"  ///
       7 "Other Spanish; Hispanic; Latino"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.: not Spanish, Hispanic or Latino"

label define ER27393L  ///
       1 "White"  ///
       2 "Black, African-American, or Negro"  ///
       3 "American Indian or Alaska Native"  ///
       4 "Asian"  ///
       5 "Native Hawaiian or Pacific Islander"  ///
       7 "Other"  ///
       0 "Wild code"  ///
       9 "NA; DK"
label define ER28047L        0 "Completed no grades of school"  , modify
forvalues n = 1/16 {
    label define ER28047L `n' "Actual number"  , modify
}
label define ER28047L       17 "At least some post-graduate work"  , modify
label define ER28047L       99 "NA; DK"  , modify

label define ER5001L  ///
       1 "Release number 1 - August 1995"  ///
       2 "Release number 2 - January 2003"  ///
       3 "Release number 3 - March 2004"  ///
       4 "Release number 4 - May 2008"  ///
       5 "Release number 5 - November 2013"  ///
       6 "Release number 6 - January 2016"
forvalues n = 14/96 {
    label define ER5006L `n' "Actual age"  , modify
}
label define ER5006L       97 "Ninety-seven years of age or older"  , modify
label define ER5006L        0 "Wild code"  , modify
label define ER5006L       98 "NA; DK"  , modify
label define ER5006L       99 "NA; DK"  , modify

label define ER5007L  ///
       1 "Male"  ///
       2 "Female"  ///
       0 "Wild code"

label define ER5078L  ///
       1 "Yes"  ///
       5 "No"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.: not working for money now; works for self only or for both someone else and self"

label define ER5079L  ///
       1 "Yes"  ///
       5 "No"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.: not working for money now; works for self only or also employed by someone else; current job not covered by union contract"

label define ER6811L  ///
       1 "Mexican"  ///
       2 "Mexican American"  ///
       3 "Chicano"  ///
       4 "Puerto Rican"  ///
       5 "Cuban"  ///
       6 "Combination; more than one mention"  ///
       7 "Other Spanish; Hispanic; Latino"  ///
       8 "DK"  ///
       9 "NA; refused"  ///
       0 "Inap.:  not Spanish, Hispanic or Latino"

label define ER6814L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "American Indian, Aleut, Eskimo"  ///
       4 "Asian, Pacific Islander"  ///
       5 "Mentions Latino origin or descent"  ///
       6 "Mentions color other than black or white"  ///
       7 "Other"  ///
       8 "DK"  ///
       9 "NA; refused"
label define ER6998L        0 "Completed no grades of school"  , modify
forvalues n = 1/16 {
    label define ER6998L `n' "Actual number"  , modify
}
label define ER6998L       17 "At least some post-graduate work"  , modify
label define ER6998L       99 "NA; DK"  , modify

label define V11101L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
label define V11120L        1 "Up to twenty-three months old"  , modify
forvalues n = 2/97 {
    label define V11120L `n' "Actual age"  , modify
}
label define V11120L       98 "Ninety-eight years old or older"  , modify
label define V11120L       99 "NA age; NA who is householder (V11118=9999)"  , modify
label define V11120L        0 "Inap.: FU is in institution (not off base armed forces)"  , modify

label define V11607L  ///
       1 "Male"  ///
       2 "Female"

label define V11649L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: not working for money now at all (V11639=5); works for self only or also employed by someone else (V11640=2, 3 or 9)"

label define V11650L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"  ///
       0 "Inap.: not working for money now at all (V11639=5); works for self only or also employed by someone else (V11640=2, 3 or 9); current job not covered by union contract (V11649=5 or 9)"

label define V11937L  ///
       1 "Mexican"  ///
       2 "Mexican American"  ///
       3 "Chicano"  ///
       4 "Puerto Rican"  ///
       5 "Cuban"  ///
       6 "Combination; more than 1 mention"  ///
       7 "Other Spanish"  ///
       9 "NA; DK"  ///
       0 "Inap.: is not Spanish/Hispanic"

label define V11938L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "American Indian, Aleut, Eskimo"  ///
       4 "Asian, Pacific Islander"  ///
       7 "Other"  ///
       8 "More than 2 mentions"  ///
       9 "NA; DK"  ///
       0 "Inap.: no second mention"

label define V12400L  ///
       1 "0-5 grades: V11945 equals 2 or 3 and V11948 or V11953 equals 01-05 and V11964 equals 5"  ///
       2 `"6-8 grades; "grade school": V11945 equals 2 or 3 and V11948 or V11953 equals 06-08, and V11964 equals 5"'  ///
       3 "9-11 grades: V11945 equals 2 or 3 and V11948 or V11953 equals 09-11, and V11964 equals 5"  ///
       4 `"12 grades and no further training; "high school": V11945 equals 1, V11956 equals 5, and V11964=5"'  ///
       5 "12 grades plus nonacademic training: V11945 and V11964 equals 1"  ///
       6 "College but no degree: V11956 equals 1 and V11959 equals 1-5, and V11961 does not equal 02-06"  ///
       7 "College BA but no advanced degree: V11959 equals 4 or 5 and V11961 equals 02"  ///
       8 "College and advanced or professional degree: V11959 equals 4 or 5 and V11961 equals 03-06"  ///
       9 "NA; DK: V11945, V11956 or V11959 equals 9; V11948 or V11953 equals 99"

label define V3801L  ///
       2 "Release number 2 - May 2008"  ///
       3 "Release number 3 - December 2013"
forvalues n = 16/97 {
    label define V3921L `n' "Actual age"  , modify
}
label define V3921L       98 "Ninety-eight years of age or older"  , modify
label define V3921L       99 "NA; DK age"  , modify

label define V3922L  ///
       1 "Male"  ///
       2 "Female"

label define V3968L  ///
       1 "Professional, technical and kindred workers"  ///
       2 "Managers, officials and proprietors"  ///
       3 "Self-employed businessmen"  ///
       4 "Clerical and sales workers"  ///
       5 "Craftsmen, foremen, and kindred workers"  ///
       6 "Operatives and kindred workers"  ///
       7 "Laborers and service workers, farm laborers"  ///
       8 "Farmers and farm managers"  ///
       9 "Miscellaneous (armed services, protective service workers), unemployed last year but looking for work; NA"  ///
       0 "Inap.: not in labor force at all in 1974; retired; permanently disabled or not in labor force and did no work last year; V3967 = 2-6"

label define V4087L  ///
       1 "Yes"  ///
       5 "No"  ///
       9 "NA; DK"

label define V4093L  ///
       0 "None"  ///
       1 "One"  ///
       2 "Two"  ///
       3 "Three"  ///
       4 "Four"  ///
       5 "Five"  ///
       6 "Six"  ///
       7 "Seven"  ///
       8 "Eight"  ///
       9 "Nine"  ///
      10 "Ten"  ///
      11 "Eleven"  ///
      12 "Twelve"  ///
      13 "Thirteen"  ///
      14 "Fourteen"  ///
      15 "Fifteen"  ///
      16 "Sixteen"  ///
      17 "Seventeen or more"  ///
      99 "NA; DK"

label define V4204L  ///
       1 "White"  ///
       2 "Black"  ///
       3 "Spanish-American"  ///
       7 "Other"  ///
       9 "NA"

label values ER25001    ER25001L
label values ER25018    ER25018L
label values ER25138    ER25138L
label values ER25139    ER25139L
label values ER27392    ER27392L
label values ER27393    ER27393L
label values ER28047    ER28047L
label values ER5001     ER5001L
label values ER5006     ER5006L
label values ER5007     ER5007L
label values ER5078     ER5078L
label values ER5079     ER5079L
label values ER6811     ER6811L
label values ER6814     ER6814L
label values ER6998     ER6998L
label values V11101     V11101L
label values V11120     V11120L
label values V11607     V11607L
label values V11649     V11649L
label values V11650     V11650L
label values V11937     V11937L
label values V11938     V11938L
label values V12400     V12400L
label values V3801      V3801L
label values V3921      V3921L
label values V3922      V3922L
label values V3968      V3968L
label values V4087      V4087L
label values V4093      V4093L
label values V4204      V4204L
