; homeall.g
G91                                                     ; relative positioning

; stealthChop tuning
M18                                                      ; motors off
M915 P0 T45				; set coolstep threshold (disables stall detection)
M915 P1 T45				; set coolstep threshold (disables stall detection)
M915 P2 T150				; set coolstep threshold (disables stall detection)
M569 P0 D3 V45		    ; set stealthChop mode, set tpwmthrs
M569 P1 D3 V45		    ; set stealthChop mode, set tpwmthrs
M569 P2 D3 V150		    ; set stealthChop mode, set tpwmthrs

G1 H2 Z0.02             ; small move to energise Z motor
G4 P250					; pause
G1 H2 Z5 F6000                                          ; lift Z relative to current position

G1 H2 X-0.02 Y-0.02     ; small move to energise X and Y motors
G4 P250					; pause
G1 H1 X{-move.axes[0].max - 10} Y{-move.axes[1].max - 10} F5000             ; move quickly to X and Y axis endstops and stop there (first pass)
G1 H2 X5 Y5 F6000                                       ; go back a few mm
G1 H1 X{-move.axes[0].max - 10} Y{-move.axes[1].max - 10} F360              ; move slowly to X and Y axis endstops once more (second pass)

; probe Z
G91                                                     ; relative positioning
G1 H2 Z5 F6000                                          ; lift Z relative to current position
G90                                                     ; absolute positioning
G1 X{((move.axes[0].max - move.axes[0].min) / 2) - sensors.probes[0].offsets[0]} Y{((move.axes[1].max - move.axes[1].min) / 2) - sensors.probes[0].offsets[1]} F10000
M558 F500 A1                                            ; faster first probe
G30                                                     ; single probe
M98 P"config/probe/probe_config.g"                      ; default probe config
G30                                                     ; single probe
G1 Z10 F6000						                    ; lift Z 
G1 X{move.axes[0].min} Y{move.axes[1].min} F10000       ; home X and Y
