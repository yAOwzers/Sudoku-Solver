let debug_enabled = ref false
let enable_debug () = debug_enabled := true
let disable_debug () = debug_enabled := false
let debug fmt = Printf.printf ("[DEBUG] " ^^ fmt ^^ "\n")
