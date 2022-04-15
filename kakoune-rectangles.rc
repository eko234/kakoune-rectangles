declare-option str kakoune_rectangles_script_path "%val{config}/plugins/kakoune-rectangles/kakoune-rectangles.raku"

define-command rectangle -override %{
  evaluate-commands %sh{
    raku "$kak_opt_kakoune_rectangles_script_path" CLASSIC "$kak_selection_desc"
  }
}
