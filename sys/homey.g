; homey.g
; called to home the Y axis
;
; generated by RepRapFirmware Configuration Tool v3.1.10+4-LPC on Tue Jan 19 2021 17:25:01 GMT+0800 (中国标准时间)
G91                                   ; relative positioning

M18 Y                                 ; motors off
M915 P1 T45				              ; set coolstep threshold (disables stall detection)
M569 P1 D3 V45	    	              ; set stealthChop mode, set tpwmthrs and thigh
G1 H2 Z5 F6000                        ; lift Z relative to current position

G1 H2 Y-0.02 F6000                    ; small move to energise Y motor
G4 P250					              ; pause
G1 H1 Y{-move.axes[1].max - 10} F5000 ; move quickly to Y axis endstop and stop there (first pass)
G1 H2 Y5 F6000                        ; go back a few mm
G1 H1 Y{-move.axes[1].max - 10} F360  ; move slowly to Y axis endstop once more (second pass)
G1 H2 Z-5 F6000                       ; lower Z again
G90                                   ; absolute positioning
