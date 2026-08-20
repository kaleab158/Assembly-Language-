; ============================================
; hello.asm - Simple "Hello, World!" in 8086 Assembly
; Assemble: tasm hello.asm
; Link:     tlink hello.obj
; Run:      hello.exe
; ============================================

.MODEL SMALL
.STACK 100h

.DATA
    msg DB 'Hello, World!$'   ; $ terminates string for DOS print

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX              ; initialize data segment

    MOV AH, 09h              ; DOS function: print string
    LEA DX, msg
    INT 21h                  ; call DOS interrupt

    MOV AH, 4Ch               ; DOS function: exit program
    INT 21h
MAIN ENDP
END MAIN