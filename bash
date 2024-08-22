#!/bin/bash
FILES=*.sh
for f in $FILES
do
	sed -i "s|^openId=.*|&'https://esgf-node.llnl.gov/esgf-idp/openid/Fiboonatchi'|" $f

#	sed -i '/# read csv here document into proper/i\	if [[ $i4 -gt 1 ]]; then\n 		cdo sellonlatbox,62,30,36,63 $fname "caspian_${fname}_${i4}.nc"\n 		rm -rf $fname\n 	fi' $f

	sed -i '/#Process the file/i\ if [[ $file == tas* ]] || [[ $file == sfcWind* ]] || [[ $file == psl* ]] || [[ $file == hurs* ]] || [[ $file == pr* ]] || [[ $file == zg* ]] ; then' $f

#	sed -i '/done <<<"$download_files"/i\	fname=$file\n	echo $fname\n	i4=$((i4+1))\n fi' $f

	sed -i '/done <<<"$download_files"/i\	cdo sellonlatbox,30,62,36,62 $file "caspian_${file}"\n 		rm -rf $file\n fi' $f

	sed -i "/fi #use cookies/i\ password_c='Fiboonatchi12_mahya' " $f

	sed -e  '/read -s -p "Enter password : "/ s/^#*/#/' -i $f
done
