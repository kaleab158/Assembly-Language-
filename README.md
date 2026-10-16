👋 Hello, World! in 8086 Assembly

A simple "Hello, World!" program written in 8086 assembly language for DOS. It is a great first step for learning how assembly programs are structured, how to print text, and how to exit cleanly.

📌 About

This program prints Hello, World! to the screen using a DOS interrupt (INT 21h) and then exits back to DOS.

Architecture: Intel 8086 (16-bit)
Assembler: TASM (Turbo Assembler)
Linker: TLINK
Memory model: SMALL
Platform: DOS (or DOSBox on modern systems)
📂 Project Structure
.
├── hello.asm      # Source code
└── README.md      # Project documentation
💻 Source Code
asm
.MODEL SMALL
.STACK 100h

.DATA
    msg DB 'Hello, World!$'   ; $ terminates string for DOS print

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX              ; initialize data segment

    MOV AH, 09h             ; DOS function: print string
    LEA DX, msg
    INT 21h                 ; call DOS interrupt

    MOV AH, 4Ch             ; DOS function: exit program
    INT 21h
MAIN ENDP
END MAIN
🧠 How It Works
Line	Meaning
.MODEL SMALL	Uses the small memory model (one code segment, one data segment)
.STACK 100h	Reserves 256 bytes for the stack
.DATA	Starts the data segment where variables are stored
msg DB 'Hello, World!$'	Defines the message. The $ tells DOS where the string ends
.CODE	Starts the code segment
MAIN PROC / MAIN ENDP	Start and end of the main procedure
MOV AX, @DATA	Loads the address of the data segment into AX
MOV DS, AX	Sets the DS register so the program can access its data
MOV AH, 09h	Selects the DOS function to print a string
LEA DX, msg	Loads the address of msg into DX
INT 21h	Calls DOS to run the selected function
MOV AH, 4Ch	Selects the DOS function to exit the program
END MAIN	Marks the end of the program and its entry point
🛠️ Requirements
TASM and TLINK (Borland Turbo Assembler package)
DOSBox (recommended for running on Windows, Linux, or macOS)
▶️ How to Assemble and Run
bash
tasm hello.asm
tlink hello.obj
hello.exe

Expected output:

Hello, World!
Running in DOSBox
Put hello.asm, TASM.EXE, and TLINK.EXE in one folder, for example C:\ASM.
Open DOSBox and mount the folder:
mount c c:\asm
c:
Run the three commands above.
📖 Registers and Instructions Used
Item	Purpose
AX	General-purpose register, used to load the data segment
DS	Data segment register, points to the program's data
AH	High byte of AX, holds the DOS function number
DX	Holds the address of the string to print
MOV	Copies a value into a register
LEA	Loads the address of a variable
INT 21h	Calls a DOS service

DOS functions used:

Function	Name	Description
09h	Print string	Prints the string at DS:DX until $
4Ch	Exit program	Ends the program and returns to DOS
🎯 What I Learned
The basic structure of an 8086 program (.MODEL, .STACK, .DATA, .CODE)
How to initialize the data segment
How to print text with DOS interrupt INT 21h
How to exit a program properly
🚀 Next Steps
Read input from the keyboard (AH = 01h or 0Ah)
Add two numbers and print the result
Use loops and conditional jumps
Write procedures and use the stack
📬 Contact
GitHub: kaleab158
Email: kalebasfaw8@gmail.com
⭐ If this helped you, give the repo a star!
