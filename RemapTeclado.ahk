Capslock::
    If (A_PriorHotKey = "~Capslock Up" AND A_TimeSincePriorHotkey < 400 AND A_TimeSincePriorHotkey > 50) ; double-press
        Send, {Esc} 
    SetTimer, RestoreCapslockState, 50
return

~Capslock Up:: return ; The tilde prefix (~) prevents AHK from blocking the key-down/up events

CapsLock & a::Send {Shift Down}
CapsLock & s::Send {Ctrl Down}
CapsLock & a up::Send {Shift Up}
CapsLock & s up::Send {Ctrl Up}
CapsLock & h::Send {Home}
CapsLock & j::Send {Left}
CapsLock & k::Send {Up}
CapsLock & l::Send {Down}
CapsLock & ñ::Send {Right}
CapsLock & ´::Send {End}
CapsLock & D::Send {Del}
CapsLock & F::Send {F7}

; Nuevo atajo para copiar la línea actual y pegarla en la línea de abajo
CapsLock & c::
    ; Guarda la posición actual del cursor
    Send, +{Home} ; Mueve el cursor al principio de la línea
    Send, +{End}  ; Selecciona hasta el final de la línea
    Send, ^c      ; Copia la selección al portapapeles
    ; Mueve el cursor a la línea de abajo y pega el texto copiado
    Send, {Enter}  ; Mueve el cursor a la línea de abajo
    Send, ^v      ; Pega el texto copiado
return

RestoreCapslockState:   
    KeyWait, Capslock ; wait for Capslock to be released
    SetTimer, RestoreCapslockState, OFF
    If (A_PriorKey != "Capslock") 
        SetCapsLockState % !GetKeyState("CapsLock", "T") ; Toggles CapsLock to its opposite state, requires [v1.1.30+]
return
