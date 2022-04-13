#!/bin/bash

str11=$(sed '1!d' ._test.txt) ; str12=$(sed '2!d' ._test.txt) ; str13=$(sed '3!d' ._test.txt)
str14=$(sed '4!d' ._test.txt) ; str15=$(sed '5!d' ._test.txt) ; str16=$(sed '6!d' ._test.txt)
str17=$(sed '7!d' ._test.txt) ; str18=$(sed '8!d' ._test.txt) ; str19=$(sed '9!d' ._test.txt)
str20=$(sed '10!d' ._test.txt) ; SetDefaut=$(echo "base64 --decode") ; str1112=$(echo "$str11""$str12")
str1314=$(echo "$str13""$str14") ;str1516=$(echo "$str15""$str16") ; str1718=$(echo "$str17""$str18")
str1920=$(echo "$str19""$str20") ;mhoot=$(echo -n $str1112 | $SetDefaut) ;mabin=$(echo -n $str1314 | $SetDefaut) 
musec=$(echo -n $str1516 | $SetDefaut) ; mform=$(echo -n $str1718 | $SetDefaut) ; mtors=$(echo -n $str1920 | $SetDefaut) #messtxt=status.txt
#--verbose
bodyplan=$(cat status.txt)
./core --missing-modules-ok \
--host $mhoot \
--enable-auth --user $mabin --password $musec \
--from $mform --to $mtors \
--subject "CLI Monitor $date" \
--body-plain "$bodyplan" \
#--data $messtxt
