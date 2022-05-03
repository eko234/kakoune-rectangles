define-command rectangle -override %{
  evaluate-commands %sh{
    start_end=($(echo $kak_selection_desc | sed 's/,/\n/g'))
    start_row_col=($(echo ${start_end[0]} | sed 's/\./\n/g'))
    end_row_col=($(echo ${start_end[1]} | sed 's/\./\n/g'))
    offset=($(printf "$kak_quoted_selection" | tail -n +2 | head -n -1 | grep -v  "[^\n]\{${start_row_col[1] + 1},\}" | wc -l ))
    row=$(( ${start_row_col[0]} < ${end_row_col[0]} ? ${start_row_col[0]} :  ${end_row_col[0]} ))
    colmin=$(( ${start_row_col[1]} < ${end_row_col[1]} ? ${start_row_col[1]} :  ${end_row_col[1]} ))
    colmax=$(( ${start_row_col[1]} > ${end_row_col[1]} ? ${start_row_col[1]} :  ${end_row_col[1]} ))
    length=$(( $colmax - $colmin ))
    count=$(( ${start_row_col[0]} -  ${end_row_col[0]} ))
    computedcount=$(( ${count#-} - $offset ))
    printf "select $row.$colmin,$row.$colmin\n"
    printf "execute-keys $computedcount%s\n" "C"
    printf "execute-keys <a-K>\\\n<ret>\n"
    printf "execute-keys ?[^\\\n]{,$length}<ret>\n"
    printf "info %s\n" $offset
  }
}

# NOTE: seems that the last char that is a newline matches, giving the impression that the count is wrong
# NOTE: maybe moving the range from the first grep could help
# xxZxxxxxxxxxxxxxx
# xxxxxxxxxxxxxx
# xx
# xxxxxZxxxxxx
# sadfasdfas
#   hola
#   perro
#   care
#   chumba
