start_end=($(echo $2 | sed 's/,/\n/g'))
start_row_col=($(echo ${start_end[0]} | sed 's/\./\n/g'))
end_row_col=($(echo ${start_end[1]} | sed 's/\./\n/g'))
row=$(( ${start_row_col[0]} < ${end_row_col[0]} ? ${start_row_col[0]} :  ${end_row_col[0]} ))
colmin=$(( ${start_row_col[1]} < ${end_row_col[1]} ? ${start_row_col[1]} :  ${end_row_col[1]} ))
colmax=$(( ${start_row_col[1]} > ${end_row_col[1]} ? ${start_row_col[1]} :  ${end_row_col[1]} ))
count=$(( ${start_row_col[0]} - ${end_row_col[0]} ))
echo "select $row.$colmin,$row.$colmax"
echo "execute-keys ${count#-}""C"