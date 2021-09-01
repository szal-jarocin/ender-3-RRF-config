; homeall.g
G91                                 ; relative positioning
G1 H2 Z5 F6000                      ; lift Z relative to current position
G1 H1 X-240 Y-240 F3000             ; move quickly to X and Y axis endstops and stop there (first pass)
G1 H2 X5 Y5 F6000                   ; go back a few mm
G1 H1 X-240 Y-240 F360              ; move slowly to X and Y axis endstops once more (second pass)

; probe Z
G91                                 ; relative positioning
G1 H2 Z5 F6000                      ; lift Z relative to current position
G90                                 ; absolute positioning
G1 X{(move.axes[0].max / 2) - sensors.probes[0].offsets[0]} Y{(move.axes[1].max / 2) - sensors.probes[0].offsets[1]} F6000
M558 F250 A1                        ; faster first probe
G30                                 ; single probe
M98 P"config/probe/probe_config.g"  ; default probe config
G30                                 ; single probe
G1 X0 Y0 F6000                      ; home X and Y