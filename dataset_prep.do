* NOTE: You need to set the Stata working directory to the path
* where the data file is located.

set more off

clear
quietly infix                ///
  int     year      1-4      ///
  long    sample    5-10     ///
  double  serial    11-18    ///
  double  cbserial  19-31    ///
  double  hhwt      32-41    ///
  double  cluster   42-54    ///
  double  strata    55-66    ///
  byte    gq        67-67    ///
  int     pernum    68-71    ///
  double  perwt     72-81    ///
  byte    citizen   82-82    ///
  int     yrnatur   83-86    ///
  byte    speakeng  87-87    ///
  byte    educ      88-89    ///
  int     educd     90-92    ///
  int     ind       93-96    ///
  long    inctot    97-103   ///
  using `"usa_00003.dat"'

replace hhwt     = hhwt     / 100
replace perwt    = perwt    / 100

format serial   %8.0g
format cbserial %13.0g
format hhwt     %10.2f
format cluster  %13.0g
format strata   %12.0g
format perwt    %10.2f

label var year     `"Census year"'
label var sample   `"IPUMS sample identifier"'
label var serial   `"Household serial number"'
label var cbserial `"Original Census Bureau household serial number"'
label var hhwt     `"Household weight"'
label var cluster  `"Household cluster for variance estimation"'
label var strata   `"Household strata for variance estimation"'
label var gq       `"Group quarters status"'
label var pernum   `"Person number in sample unit"'
label var perwt    `"Person weight"'
label var citizen  `"Citizenship status"'
label var yrnatur  `"Year naturalized"'
label var speakeng `"Speaks English"'
label var educ     `"Educational attainment [general version]"'
label var educd    `"Educational attainment [detailed version]"'
label var ind      `"Industry"'
label var inctot   `"Total personal income"'

label define year_lbl 1850 `"1850"'
label define year_lbl 1860 `"1860"', add
label define year_lbl 1870 `"1870"', add
label define year_lbl 1880 `"1880"', add
label define year_lbl 1900 `"1900"', add
label define year_lbl 1910 `"1910"', add
label define year_lbl 1920 `"1920"', add
label define year_lbl 1930 `"1930"', add
label define year_lbl 1940 `"1940"', add
label define year_lbl 1950 `"1950"', add
label define year_lbl 1960 `"1960"', add
label define year_lbl 1970 `"1970"', add
label define year_lbl 1980 `"1980"', add
label define year_lbl 1990 `"1990"', add
label define year_lbl 2000 `"2000"', add
label define year_lbl 2001 `"2001"', add
label define year_lbl 2002 `"2002"', add
label define year_lbl 2003 `"2003"', add
label define year_lbl 2004 `"2004"', add
label define year_lbl 2005 `"2005"', add
label define year_lbl 2006 `"2006"', add
label define year_lbl 2007 `"2007"', add
label define year_lbl 2008 `"2008"', add
label define year_lbl 2009 `"2009"', add
label define year_lbl 2010 `"2010"', add
label define year_lbl 2011 `"2011"', add
label define year_lbl 2012 `"2012"', add
label define year_lbl 2013 `"2013"', add
label define year_lbl 2014 `"2014"', add
label define year_lbl 2015 `"2015"', add
label define year_lbl 2016 `"2016"', add
label define year_lbl 2017 `"2017"', add
label define year_lbl 2018 `"2018"', add
label values year year_lbl

label define sample_lbl 201802 `"2018 PRCS"'
label define sample_lbl 201801 `"2018 ACS"', add
label define sample_lbl 201704 `"2013-2017, PRCS 5-year"', add
label define sample_lbl 201703 `"2013-2017, ACS 5-year"', add
label define sample_lbl 201702 `"2017 PRCS"', add
label define sample_lbl 201701 `"2017 ACS"', add
label define sample_lbl 201604 `"2012-2016, PRCS 5-year"', add
label define sample_lbl 201603 `"2012-2016, ACS 5-year"', add
label define sample_lbl 201602 `"2016 PRCS"', add
label define sample_lbl 201601 `"2016 ACS"', add
label define sample_lbl 201504 `"2011-2015, PRCS 5-year"', add
label define sample_lbl 201503 `"2011-2015, ACS 5-year"', add
label define sample_lbl 201502 `"2015 PRCS"', add
label define sample_lbl 201501 `"2015 ACS"', add
label define sample_lbl 201404 `"2010-2014, PRCS 5-year"', add
label define sample_lbl 201403 `"2010-2014, ACS 5-year"', add
label define sample_lbl 201402 `"2014 PRCS"', add
label define sample_lbl 201401 `"2014 ACS"', add
label define sample_lbl 201306 `"2009-2013, PRCS 5-year"', add
label define sample_lbl 201305 `"2009-2013, ACS 5-year"', add
label define sample_lbl 201304 `"2011-2013, PRCS 3-year"', add
label define sample_lbl 201303 `"2011-2013, ACS 3-year"', add
label define sample_lbl 201302 `"2013 PRCS"', add
label define sample_lbl 201301 `"2013 ACS"', add
label define sample_lbl 201206 `"2008-2012, PRCS 5-year"', add
label define sample_lbl 201205 `"2008-2012, ACS 5-year"', add
label define sample_lbl 201204 `"2010-2012, PRCS 3-year"', add
label define sample_lbl 201203 `"2010-2012, ACS 3-year"', add
label define sample_lbl 201202 `"2012 PRCS"', add
label define sample_lbl 201201 `"2012 ACS"', add
label define sample_lbl 201106 `"2007-2011, PRCS 5-year"', add
label define sample_lbl 201105 `"2007-2011, ACS 5-year"', add
label define sample_lbl 201104 `"2009-2011, PRCS 3-year"', add
label define sample_lbl 201103 `"2009-2011, ACS 3-year"', add
label define sample_lbl 201102 `"2011 PRCS"', add
label define sample_lbl 201101 `"2011 ACS"', add
label define sample_lbl 201008 `"2010 Puerto Rico 10%"', add
label define sample_lbl 201007 `"2010 10%"', add
label define sample_lbl 201006 `"2006-2010, PRCS 5-year"', add
label define sample_lbl 201005 `"2006-2010, ACS 5-year"', add
label define sample_lbl 201004 `"2008-2010, PRCS 3-year"', add
label define sample_lbl 201003 `"2008-2010, ACS 3-year"', add
label define sample_lbl 201002 `"2010 PRCS"', add
label define sample_lbl 201001 `"2010 ACS"', add
label define sample_lbl 200906 `"2005-2009, PRCS 5-year"', add
label define sample_lbl 200905 `"2005-2009, ACS 5-year"', add
label define sample_lbl 200904 `"2007-2009, PRCS 3-year"', add
label define sample_lbl 200903 `"2007-2009, ACS 3-year"', add
label define sample_lbl 200902 `"2009 PRCS"', add
label define sample_lbl 200901 `"2009 ACS"', add
label define sample_lbl 200804 `"2006-2008, PRCS 3-year"', add
label define sample_lbl 200803 `"2006-2008, ACS 3-year"', add
label define sample_lbl 200802 `"2008 PRCS"', add
label define sample_lbl 200801 `"2008 ACS"', add
label define sample_lbl 200704 `"2005-2007, PRCS 3-year"', add
label define sample_lbl 200703 `"2005-2007, ACS 3-year"', add
label define sample_lbl 200702 `"2007 PRCS"', add
label define sample_lbl 200701 `"2007 ACS"', add
label define sample_lbl 200602 `"2006 PRCS"', add
label define sample_lbl 200601 `"2006 ACS"', add
label define sample_lbl 200502 `"2005 PRCS"', add
label define sample_lbl 200501 `"2005 ACS"', add
label define sample_lbl 200401 `"2004 ACS"', add
label define sample_lbl 200301 `"2003 ACS"', add
label define sample_lbl 200201 `"2002 ACS"', add
label define sample_lbl 200101 `"2001 ACS"', add
label define sample_lbl 200008 `"2000 Puerto Rico 1%"', add
label define sample_lbl 200007 `"2000 1%"', add
label define sample_lbl 200006 `"2000 Puerto Rico 1% sample (old version)"', add
label define sample_lbl 200005 `"2000 Puerto Rico 5%"', add
label define sample_lbl 200004 `"2000 ACS"', add
label define sample_lbl 200003 `"2000 Unweighted 1%"', add
label define sample_lbl 200002 `"2000 1% sample (old version)"', add
label define sample_lbl 200001 `"2000 5%"', add
label define sample_lbl 199007 `"1990 Puerto Rico 1%"', add
label define sample_lbl 199006 `"1990 Puerto Rico 5%"', add
label define sample_lbl 199005 `"1990 Labor Market Area"', add
label define sample_lbl 199004 `"1990 Elderly"', add
label define sample_lbl 199003 `"1990 Unweighted 1%"', add
label define sample_lbl 199002 `"1990 1%"', add
label define sample_lbl 199001 `"1990 5%"', add
label define sample_lbl 198007 `"1980 Puerto Rico 1%"', add
label define sample_lbl 198006 `"1980 Puerto Rico 5%"', add
label define sample_lbl 198005 `"1980 Detailed metro/non-metro"', add
label define sample_lbl 198004 `"1980 Labor Market Area"', add
label define sample_lbl 198003 `"1980 Urban/Rural"', add
label define sample_lbl 198002 `"1980 1%"', add
label define sample_lbl 198001 `"1980 5%"', add
label define sample_lbl 197009 `"1970 Puerto Rico Neighborhood"', add
label define sample_lbl 197008 `"1970 Puerto Rico Municipio"', add
label define sample_lbl 197007 `"1970 Puerto Rico State"', add
label define sample_lbl 197006 `"1970 Form 2 Neighborhood"', add
label define sample_lbl 197005 `"1970 Form 1 Neighborhood"', add
label define sample_lbl 197004 `"1970 Form 2 Metro"', add
label define sample_lbl 197003 `"1970 Form 1 Metro"', add
label define sample_lbl 197002 `"1970 Form 2 State"', add
label define sample_lbl 197001 `"1970 Form 1 State"', add
label define sample_lbl 196002 `"1960 5%"', add
label define sample_lbl 196001 `"1960 1%"', add
label define sample_lbl 195001 `"1950 1%"', add
label define sample_lbl 194002 `"1940 100% database"', add
label define sample_lbl 194001 `"1940 1%"', add
label define sample_lbl 193004 `"1930 100% database"', add
label define sample_lbl 193003 `"1930 Puerto Rico"', add
label define sample_lbl 193002 `"1930 5%"', add
label define sample_lbl 193001 `"1930 1%"', add
label define sample_lbl 192003 `"1920 100% database"', add
label define sample_lbl 192002 `"1920 Puerto Rico sample"', add
label define sample_lbl 192001 `"1920 1%"', add
label define sample_lbl 191004 `"1910 100% database"', add
label define sample_lbl 191003 `"1910 1.4% sample with oversamples"', add
label define sample_lbl 191002 `"1910 1%"', add
label define sample_lbl 191001 `"1910 Puerto Rico"', add
label define sample_lbl 190004 `"1900 100% database"', add
label define sample_lbl 190003 `"1900 1% sample with oversamples"', add
label define sample_lbl 190002 `"1900 1%"', add
label define sample_lbl 190001 `"1900 5%"', add
label define sample_lbl 188003 `"1880 100% database"', add
label define sample_lbl 188002 `"1880 10%"', add
label define sample_lbl 188001 `"1880 1%"', add
label define sample_lbl 187003 `"1870 100% database"', add
label define sample_lbl 187002 `"1870 1% sample with black oversample"', add
label define sample_lbl 187001 `"1870 1%"', add
label define sample_lbl 186003 `"1860 100% database"', add
label define sample_lbl 186002 `"1860 1% sample with black oversample"', add
label define sample_lbl 186001 `"1860 1%"', add
label define sample_lbl 185002 `"1850 100% database"', add
label define sample_lbl 185001 `"1850 1%"', add
label values sample sample_lbl

label define gq_lbl 0 `"Vacant unit"'
label define gq_lbl 1 `"Households under 1970 definition"', add
label define gq_lbl 2 `"Additional households under 1990 definition"', add
label define gq_lbl 3 `"Group quarters--Institutions"', add
label define gq_lbl 4 `"Other group quarters"', add
label define gq_lbl 5 `"Additional households under 2000 definition"', add
label define gq_lbl 6 `"Fragment"', add
label values gq gq_lbl

label define citizen_lbl 0 `"N/A"'
label define citizen_lbl 1 `"Born abroad of American parents"', add
label define citizen_lbl 2 `"Naturalized citizen"', add
label define citizen_lbl 3 `"Not a citizen"', add
label define citizen_lbl 4 `"Not a citizen, but has received first papers"', add
label define citizen_lbl 5 `"Foreign born, citizenship status not reported"', add
label values citizen citizen_lbl

label define yrnatur_lbl 1806 `"1806"'
label define yrnatur_lbl 1807 `"1807"', add
label define yrnatur_lbl 1808 `"1808"', add
label define yrnatur_lbl 1809 `"1809"', add
label define yrnatur_lbl 1810 `"1810"', add
label define yrnatur_lbl 1811 `"1811"', add
label define yrnatur_lbl 1812 `"1812"', add
label define yrnatur_lbl 1813 `"1813"', add
label define yrnatur_lbl 1814 `"1814"', add
label define yrnatur_lbl 1815 `"1815"', add
label define yrnatur_lbl 1816 `"1816"', add
label define yrnatur_lbl 1817 `"1817"', add
label define yrnatur_lbl 1818 `"1818"', add
label define yrnatur_lbl 1819 `"1819"', add
label define yrnatur_lbl 1820 `"1820"', add
label define yrnatur_lbl 1821 `"1821"', add
label define yrnatur_lbl 1822 `"1822"', add
label define yrnatur_lbl 1823 `"1823"', add
label define yrnatur_lbl 1824 `"1824"', add
label define yrnatur_lbl 1825 `"1825"', add
label define yrnatur_lbl 1826 `"1826"', add
label define yrnatur_lbl 1827 `"1827"', add
label define yrnatur_lbl 1828 `"1828"', add
label define yrnatur_lbl 1829 `"1829"', add
label define yrnatur_lbl 1830 `"1830"', add
label define yrnatur_lbl 1831 `"1831"', add
label define yrnatur_lbl 1832 `"1832"', add
label define yrnatur_lbl 1833 `"1833"', add
label define yrnatur_lbl 1834 `"1834"', add
label define yrnatur_lbl 1835 `"1835"', add
label define yrnatur_lbl 1836 `"1836"', add
label define yrnatur_lbl 1837 `"1837"', add
label define yrnatur_lbl 1838 `"1838"', add
label define yrnatur_lbl 1839 `"1839"', add
label define yrnatur_lbl 1840 `"1840"', add
label define yrnatur_lbl 1841 `"1841"', add
label define yrnatur_lbl 1842 `"1842"', add
label define yrnatur_lbl 1843 `"1843"', add
label define yrnatur_lbl 1844 `"1844"', add
label define yrnatur_lbl 1845 `"1845"', add
label define yrnatur_lbl 1846 `"1846"', add
label define yrnatur_lbl 1847 `"1847"', add
label define yrnatur_lbl 1848 `"1848"', add
label define yrnatur_lbl 1849 `"1849"', add
label define yrnatur_lbl 1850 `"1850"', add
label define yrnatur_lbl 1851 `"1851"', add
label define yrnatur_lbl 1852 `"1852"', add
label define yrnatur_lbl 1853 `"1853"', add
label define yrnatur_lbl 1854 `"1854"', add
label define yrnatur_lbl 1855 `"1855"', add
label define yrnatur_lbl 1856 `"1856"', add
label define yrnatur_lbl 1857 `"1857"', add
label define yrnatur_lbl 1858 `"1858"', add
label define yrnatur_lbl 1859 `"1859"', add
label define yrnatur_lbl 1860 `"1860"', add
label define yrnatur_lbl 1861 `"1861"', add
label define yrnatur_lbl 1862 `"1862"', add
label define yrnatur_lbl 1863 `"1863"', add
label define yrnatur_lbl 1864 `"1864"', add
label define yrnatur_lbl 1865 `"1865"', add
label define yrnatur_lbl 1866 `"1866"', add
label define yrnatur_lbl 1867 `"1867"', add
label define yrnatur_lbl 1868 `"1868"', add
label define yrnatur_lbl 1869 `"1869"', add
label define yrnatur_lbl 1870 `"1870"', add
label define yrnatur_lbl 1871 `"1871"', add
label define yrnatur_lbl 1872 `"1872"', add
label define yrnatur_lbl 1873 `"1873"', add
label define yrnatur_lbl 1874 `"1874"', add
label define yrnatur_lbl 1875 `"1875"', add
label define yrnatur_lbl 1876 `"1876"', add
label define yrnatur_lbl 1877 `"1877"', add
label define yrnatur_lbl 1878 `"1878"', add
label define yrnatur_lbl 1879 `"1879"', add
label define yrnatur_lbl 1880 `"1880"', add
label define yrnatur_lbl 1881 `"1881"', add
label define yrnatur_lbl 1882 `"1882"', add
label define yrnatur_lbl 1883 `"1883"', add
label define yrnatur_lbl 1884 `"1884"', add
label define yrnatur_lbl 1885 `"1885"', add
label define yrnatur_lbl 1886 `"1886"', add
label define yrnatur_lbl 1887 `"1887"', add
label define yrnatur_lbl 1888 `"1888"', add
label define yrnatur_lbl 1889 `"1889"', add
label define yrnatur_lbl 1890 `"1890"', add
label define yrnatur_lbl 1891 `"1891"', add
label define yrnatur_lbl 1892 `"1892"', add
label define yrnatur_lbl 1893 `"1893"', add
label define yrnatur_lbl 1894 `"1894"', add
label define yrnatur_lbl 1895 `"1895"', add
label define yrnatur_lbl 1896 `"1896"', add
label define yrnatur_lbl 1897 `"1897"', add
label define yrnatur_lbl 1898 `"1898"', add
label define yrnatur_lbl 1899 `"1899"', add
label define yrnatur_lbl 1900 `"1900"', add
label define yrnatur_lbl 1901 `"1901"', add
label define yrnatur_lbl 1902 `"1902"', add
label define yrnatur_lbl 1903 `"1903"', add
label define yrnatur_lbl 1904 `"1904"', add
label define yrnatur_lbl 1905 `"1905"', add
label define yrnatur_lbl 1906 `"1906"', add
label define yrnatur_lbl 1907 `"1907"', add
label define yrnatur_lbl 1908 `"1908"', add
label define yrnatur_lbl 1909 `"1909"', add
label define yrnatur_lbl 1910 `"1910"', add
label define yrnatur_lbl 1911 `"1911"', add
label define yrnatur_lbl 1912 `"1912"', add
label define yrnatur_lbl 1913 `"1913"', add
label define yrnatur_lbl 1914 `"1914"', add
label define yrnatur_lbl 1915 `"1915"', add
label define yrnatur_lbl 1916 `"1916"', add
label define yrnatur_lbl 1917 `"1917"', add
label define yrnatur_lbl 1918 `"1918"', add
label define yrnatur_lbl 1919 `"1919"', add
label define yrnatur_lbl 1920 `"1920"', add
label define yrnatur_lbl 1921 `"1921"', add
label define yrnatur_lbl 1922 `"1922"', add
label define yrnatur_lbl 1923 `"1923"', add
label define yrnatur_lbl 1924 `"1924"', add
label define yrnatur_lbl 1925 `"1925 (1925 or earlier, ACS/PRCS pre 2012)"', add
label define yrnatur_lbl 1926 `"1925 (1925 or earlier, ACS/PRCS pre 2012)"', add
label define yrnatur_lbl 1927 `"1927"', add
label define yrnatur_lbl 1928 `"1928 (1928 or earlier, 2012-2016 ACS/PRCS)"', add
label define yrnatur_lbl 1929 `"1929 (1929-1933, 2012-2016 ACS/PRCS)"', add
label define yrnatur_lbl 1930 `"1930"', add
label define yrnatur_lbl 1931 `"1931 (1931-1935, ACS/PRCS pre 2012)"', add
label define yrnatur_lbl 1932 `"1932"', add
label define yrnatur_lbl 1933 `"1933"', add
label define yrnatur_lbl 1934 `"1934 (1934-1939, 2012-2016 ACS/PRCS)"', add
label define yrnatur_lbl 1935 `"1935"', add
label define yrnatur_lbl 1936 `"1936 (1936-1940, ACS/PRCS pre 2012)"', add
label define yrnatur_lbl 1937 `"1937"', add
label define yrnatur_lbl 1938 `"1938"', add
label define yrnatur_lbl 1939 `"1939 (1939 or earlier, 2017-onward ACS/PRCS)"', add
label define yrnatur_lbl 1940 `"1940 (1940-1942, 2012-2016 ACS/PRCS; 1940-1944, 2017-onward ACS/PRCS)"', add
label define yrnatur_lbl 1941 `"1941 (1941-1942, ACS/PRCS pre 2012)"', add
label define yrnatur_lbl 1942 `"1942"', add
label define yrnatur_lbl 1943 `"1943 (1943-44, 2012-2016 ACS/PRCS)"', add
label define yrnatur_lbl 1944 `"1944"', add
label define yrnatur_lbl 1945 `"1945 (1945-1947, 2017-onward ACS/PRCS)"', add
label define yrnatur_lbl 1946 `"1946 (1946-1947, 2012-2016 ACS/PRCS)"', add
label define yrnatur_lbl 1947 `"1947"', add
label define yrnatur_lbl 1948 `"1948 (1948-1949, 2017-onward ACS/PRCS)"', add
label define yrnatur_lbl 1949 `"1949"', add
label define yrnatur_lbl 1950 `"1950"', add
label define yrnatur_lbl 1951 `"1951"', add
label define yrnatur_lbl 1952 `"1952"', add
label define yrnatur_lbl 1953 `"1953"', add
label define yrnatur_lbl 1954 `"1954"', add
label define yrnatur_lbl 1955 `"1955"', add
label define yrnatur_lbl 1956 `"1956"', add
label define yrnatur_lbl 1957 `"1957"', add
label define yrnatur_lbl 1958 `"1958"', add
label define yrnatur_lbl 1959 `"1959"', add
label define yrnatur_lbl 1960 `"1960"', add
label define yrnatur_lbl 1961 `"1961"', add
label define yrnatur_lbl 1962 `"1962"', add
label define yrnatur_lbl 1963 `"1963"', add
label define yrnatur_lbl 1964 `"1964"', add
label define yrnatur_lbl 1965 `"1965"', add
label define yrnatur_lbl 1966 `"1966"', add
label define yrnatur_lbl 1967 `"1967"', add
label define yrnatur_lbl 1968 `"1968"', add
label define yrnatur_lbl 1969 `"1969"', add
label define yrnatur_lbl 1970 `"1970"', add
label define yrnatur_lbl 1971 `"1971"', add
label define yrnatur_lbl 1972 `"1972"', add
label define yrnatur_lbl 1973 `"1973"', add
label define yrnatur_lbl 1974 `"1974"', add
label define yrnatur_lbl 1975 `"1975"', add
label define yrnatur_lbl 1976 `"1976"', add
label define yrnatur_lbl 1977 `"1977"', add
label define yrnatur_lbl 1978 `"1978"', add
label define yrnatur_lbl 1979 `"1979"', add
label define yrnatur_lbl 1980 `"1980"', add
label define yrnatur_lbl 1981 `"1981"', add
label define yrnatur_lbl 1982 `"1982"', add
label define yrnatur_lbl 1983 `"1983"', add
label define yrnatur_lbl 1984 `"1984"', add
label define yrnatur_lbl 1985 `"1985"', add
label define yrnatur_lbl 1986 `"1986"', add
label define yrnatur_lbl 1987 `"1987"', add
label define yrnatur_lbl 1988 `"1988"', add
label define yrnatur_lbl 1989 `"1989"', add
label define yrnatur_lbl 1990 `"1990"', add
label define yrnatur_lbl 1991 `"1991"', add
label define yrnatur_lbl 1992 `"1992"', add
label define yrnatur_lbl 1993 `"1993"', add
label define yrnatur_lbl 1994 `"1994"', add
label define yrnatur_lbl 1995 `"1995"', add
label define yrnatur_lbl 1996 `"1996"', add
label define yrnatur_lbl 1997 `"1997"', add
label define yrnatur_lbl 1998 `"1998"', add
label define yrnatur_lbl 1999 `"1999"', add
label define yrnatur_lbl 2000 `"2000"', add
label define yrnatur_lbl 2001 `"2001"', add
label define yrnatur_lbl 2002 `"2002"', add
label define yrnatur_lbl 2003 `"2003"', add
label define yrnatur_lbl 2004 `"2004"', add
label define yrnatur_lbl 2005 `"2005"', add
label define yrnatur_lbl 2006 `"2006"', add
label define yrnatur_lbl 2007 `"2007"', add
label define yrnatur_lbl 2008 `"2008"', add
label define yrnatur_lbl 2009 `"2009"', add
label define yrnatur_lbl 2010 `"2010"', add
label define yrnatur_lbl 2011 `"2011"', add
label define yrnatur_lbl 2012 `"2012"', add
label define yrnatur_lbl 2013 `"2013"', add
label define yrnatur_lbl 2014 `"2014"', add
label define yrnatur_lbl 2015 `"2015"', add
label define yrnatur_lbl 2016 `"2016"', add
label define yrnatur_lbl 2017 `"2017"', add
label define yrnatur_lbl 2018 `"2018"', add
label define yrnatur_lbl 9997 `"Unknown"', add
label define yrnatur_lbl 9998 `"Illegible"', add
label define yrnatur_lbl 9999 `"N/A"', add
label values yrnatur yrnatur_lbl

label define speakeng_lbl 0 `"N/A (Blank)"'
label define speakeng_lbl 1 `"Does not speak English"', add
label define speakeng_lbl 2 `"Yes, speaks English..."', add
label define speakeng_lbl 3 `"Yes, speaks only English"', add
label define speakeng_lbl 4 `"Yes, speaks very well"', add
label define speakeng_lbl 5 `"Yes, speaks well"', add
label define speakeng_lbl 6 `"Yes, but not well"', add
label define speakeng_lbl 7 `"Unknown"', add
label define speakeng_lbl 8 `"Illegible"', add
label values speakeng speakeng_lbl

label define educ_lbl 00 `"N/A or no schooling"'
label define educ_lbl 01 `"Nursery school to grade 4"', add
label define educ_lbl 02 `"Grade 5, 6, 7, or 8"', add
label define educ_lbl 03 `"Grade 9"', add
label define educ_lbl 04 `"Grade 10"', add
label define educ_lbl 05 `"Grade 11"', add
label define educ_lbl 06 `"Grade 12"', add
label define educ_lbl 07 `"1 year of college"', add
label define educ_lbl 08 `"2 years of college"', add
label define educ_lbl 09 `"3 years of college"', add
label define educ_lbl 10 `"4 years of college"', add
label define educ_lbl 11 `"5+ years of college"', add
label values educ educ_lbl

label define educd_lbl 000 `"N/A or no schooling"'
label define educd_lbl 001 `"N/A"', add
label define educd_lbl 002 `"No schooling completed"', add
label define educd_lbl 010 `"Nursery school to grade 4"', add
label define educd_lbl 011 `"Nursery school, preschool"', add
label define educd_lbl 012 `"Kindergarten"', add
label define educd_lbl 013 `"Grade 1, 2, 3, or 4"', add
label define educd_lbl 014 `"Grade 1"', add
label define educd_lbl 015 `"Grade 2"', add
label define educd_lbl 016 `"Grade 3"', add
label define educd_lbl 017 `"Grade 4"', add
label define educd_lbl 020 `"Grade 5, 6, 7, or 8"', add
label define educd_lbl 021 `"Grade 5 or 6"', add
label define educd_lbl 022 `"Grade 5"', add
label define educd_lbl 023 `"Grade 6"', add
label define educd_lbl 024 `"Grade 7 or 8"', add
label define educd_lbl 025 `"Grade 7"', add
label define educd_lbl 026 `"Grade 8"', add
label define educd_lbl 030 `"Grade 9"', add
label define educd_lbl 040 `"Grade 10"', add
label define educd_lbl 050 `"Grade 11"', add
label define educd_lbl 060 `"Grade 12"', add
label define educd_lbl 061 `"12th grade, no diploma"', add
label define educd_lbl 062 `"High school graduate or GED"', add
label define educd_lbl 063 `"Regular high school diploma"', add
label define educd_lbl 064 `"GED or alternative credential"', add
label define educd_lbl 065 `"Some college, but less than 1 year"', add
label define educd_lbl 070 `"1 year of college"', add
label define educd_lbl 071 `"1 or more years of college credit, no degree"', add
label define educd_lbl 080 `"2 years of college"', add
label define educd_lbl 081 `"Associate's degree, type not specified"', add
label define educd_lbl 082 `"Associate's degree, occupational program"', add
label define educd_lbl 083 `"Associate's degree, academic program"', add
label define educd_lbl 090 `"3 years of college"', add
label define educd_lbl 100 `"4 years of college"', add
label define educd_lbl 101 `"Bachelor's degree"', add
label define educd_lbl 110 `"5+ years of college"', add
label define educd_lbl 111 `"6 years of college (6+ in 1960-1970)"', add
label define educd_lbl 112 `"7 years of college"', add
label define educd_lbl 113 `"8+ years of college"', add
label define educd_lbl 114 `"Master's degree"', add
label define educd_lbl 115 `"Professional degree beyond a bachelor's degree"', add
label define educd_lbl 116 `"Doctoral degree"', add
label define educd_lbl 999 `"Missing"', add
label values educd educd_lbl


