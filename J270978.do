#delimit ;
*  PSID DATA CENTER *****************************************************
   JOBID            : 270978                            
   DATA_DOMAIN      : FAM                               
   USER_WHERE       : NULL                              
   FILE_TYPE        : NULL                              
   OUTPUT_DATA_TYPE : ASCII                             
   STATEMENTS       : do                                
   CODEBOOK_TYPE    : PDF                               
   N_OF_VARIABLES   : 43                                
   N_OF_OBSERVATIONS: 18317                             
   MAX_REC_LENGTH   : 93                                
   DATE & TIME      : February 4, 2020 @ 11:53:26
*************************************************************************
;

infix
      V3801                1 - 1           V3802                2 - 5           V3827                6 - 9     
      V3921               10 - 11          V3922               12 - 12          V3968               13 - 13    
      V4087               14 - 14          V4093               15 - 16          V4174               17 - 21    
      V4204               22 - 22          V11101              23 - 23          V11102              24 - 27    
      V11120              28 - 29          V11607              30 - 30          V11649              31 - 31    
      V11650              32 - 32          V11684              33 - 35          V11937              36 - 36    
      V11938              37 - 37          V12377              38 - 42          V12400              43 - 43    
      ER5001              44 - 44          ER5002              45 - 49          ER5006              50 - 51    
      ER5007              52 - 52          ER5078              53 - 53          ER5079              54 - 54    
      ER6811              55 - 55          ER6814              56 - 56          ER6857              57 - 59    
      ER6988              60 - 66          ER6998              67 - 68          ER25001             69 - 69    
      ER25002             70 - 74          ER25017             75 - 77          ER25018             78 - 78    
      ER25127             79 - 81          ER25138             82 - 82          ER25139             83 - 83    
      ER27392             84 - 84          ER27393             85 - 85          ER28003             86 - 91    
      ER28047             92 - 93    
using J270978.txt, clear 
;
label variable V3801         "RELEASE NUMBER"                           ;
label variable V3802         "1975 INT #"                               ;
label variable V3827         "HRS HD UNEMP"                             ;
label variable V3921         "AGE OF HEAD"                              ;
label variable V3922         "SEX OF HEAD"                              ;
label variable V3968         "OCC-HD (E)"                               ;
label variable V4087         "WTR LABOR UNION-HD"                       ;
label variable V4093         "EDUCATION-HD"                             ;
label variable V4174         "HDS AVG HRLY EARN"                        ;
label variable V4204         "RACE"                                     ;
label variable V11101        "RELEASE NUMBER"                           ;
label variable V11102        "1985 INTERVIEW NUMBER"                    ;
label variable V11120        "AGE OF HOUSEHOLDER    85"                 ;
label variable V11607        "SEX OF 1985 HEAD"                         ;
label variable V11649        "B13 JOB NOW UNION? (H-E)"                 ;
label variable V11650        "B14 BELONG UNION? (HD-E)"                 ;
label variable V11684        "B49-50 LAST OCC    (H-E)"                 ;
label variable V11937        "G31 SPANISH DESCENT-HEAD"                 ;
label variable V11938        "G32 RACE OF HEAD (1 MEN)"                 ;
label variable V12377        "HEAD 84 AVG HRLY EARNING"                 ;
label variable V12400        "EDUCATION 1985 HEAD"                      ;
label variable ER5001        "RELEASE NUMBER"                           ;
label variable ER5002        "1995 INTERVIEW #"                         ;
label variable ER5006        "AGE OF HEAD"                              ;
label variable ER5007        "SEX OF HEAD"                              ;
label variable ER5078        "B7 JOB NOW UNION? (H-E)"                  ;
label variable ER5079        "B8 BELONG UNION? (HD-E)"                  ;
label variable ER6811        "L31 SPANISH DESCENT 1 HD"                 ;
label variable ER6814        "L32 RACE OF HEAD      1"                  ;
label variable ER6857        "B9-9A MAIN OCCUPATION: 3 DIGIT (HD-E)"    ;
label variable ER6988        "HEAD WAGE RATE-1994"                      ;
label variable ER6998        "COMPLETED ED-HD"                          ;
label variable ER25001       "RELEASE NUMBER"                           ;
label variable ER25002       "2005 FAMILY INTERVIEW (ID) NUMBER"        ;
label variable ER25017       "AGE OF HEAD"                              ;
label variable ER25018       "SEX OF HEAD"                              ;
label variable ER25127       "BC20 MAIN OCC FOR JOB 1: 2000 CODE (HD)"  ;
label variable ER25138       "BC26 JOB NOW UNION? (H-E)"                ;
label variable ER25139       "BC27 BELONG UNION? (HD-E)"                ;
label variable ER27392       "L39A SPANISH DESCENT-HEAD"                ;
label variable ER27393       "L40 RACE OF HEAD-MENTION 1"               ;
label variable ER28003       "HEAD WAGE RATE-2004"                      ;
label variable ER28047       "COMPLETED ED-HD"                          ;
