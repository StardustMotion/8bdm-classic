# give the last used (in alphabetical order) sprites names 
find src/sprites -iname "*8CA*" -type f -printf "%f\n" | sort | uniq | tail -10