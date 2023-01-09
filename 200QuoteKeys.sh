# ================================================= 					#
#  Add quotes to public keys to prepare them for .json 					#
# =================================================					#
cd 	pubkeys
truncate -s-1 				*.txt
for FILE in 				*.txt
do
	echo -ne \" 		> 	fix
	cat ${FILE} 		>> 	fix
	echo -ne '"' 		>> 	fix
	echo $(cat fix) 	> 	final
rm -f 		${FILE}
rm -f 		fix
mv 		final 			${FILE}
done
# =================================================					#