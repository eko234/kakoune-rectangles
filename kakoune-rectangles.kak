define-command rectangle -override %{
  evaluate-commands %sh{
    start_end=($(echo $kak_selection_desc | sed 's/,/\n/g'))
    start_row_col=($(echo ${start_end[0]} | sed 's/\./\n/g'))
    end_row_col=($(echo ${start_end[1]} | sed 's/\./\n/g'))
    row=$(( ${start_row_col[0]} < ${end_row_col[0]} ? ${start_row_col[0]} :  ${end_row_col[0]} ))
    colmin=$(( ${start_row_col[1]} < ${end_row_col[1]} ? ${start_row_col[1]} :  ${end_row_col[1]} ))
    colmax=$(( ${start_row_col[1]} > ${end_row_col[1]} ? ${start_row_col[1]} :  ${end_row_col[1]} ))
    count=$(( ${start_row_col[0]} - ${end_row_col[0]} ))
    printf "select $row.$colmin,$row.$colmax\n"
    printf "execute-keys ${count#-}%s\n" "C"
  }
}
