; homez.g
G91                                 ; relative positioning
G1 H2 Z5 F6000                      ; lift Z relative to current position
G90                                 ; absolute positioning
G1 X{(move.axes[0].max / 2) - sensors.probes[0].offsets[0]} Y{(move.axes[1].max / 2) - sensors.probes[0].offsets[1]} F6000
M558 F250 A1                        ; faster first probe
G30                                 ; single probe
M98 P"config/probe/probe_config.g"  ; default probe config
G30                                 ; single probe
G1 X0 Y0 F6000                      ; home X and Y