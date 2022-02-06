; homez.g
G91                                                  ; relative positioning
G1 H2 Z5 F6000                                       ; lift Z relative to current position
G90                                                  ; absolute positioning
G1 X{((move.axes[0].max - move.axes[0].min) / 2) - sensors.probes[0].offsets[0]} Y{((move.axes[1].max - move.axes[1].min) / 2) - sensors.probes[0].offsets[1]} F10000
M558 F500 A1                                         ; faster first probe
G30                                                  ; single probe
M98 P"config/probe/probe_config.g"                   ; default probe config
G30                                                  ; single probe
G1 Z25 F6000						                 ; lift Z 
G1 X{move.axes[0].min} Y{move.axes[1].min} F10000    ; home X and Y