M558 P9 C"^probe" H3 F120 T8000 A5 S0.01             ; set Z probe type to bltouch and the dive height + speeds
M98 P"config/probe/probe_offset.g"                   ; load probe offset
M98 P"config/probe/mesh_grid.g"                      ; load mesh grid