# ASM - x86 Assembly Projects

This repository contains x86 Assembly language projects and development tools for DOS environments.

## Contents

### Development Tools
- **MASM.EXE** - Microsoft Macro Assembler for assembling x86 assembly code
- **TASM.EXE** - Turbo Assembler, an alternative assembler
- **LINK.EXE** - Linker for creating executable files from object files
- **DEBUG.EXE** - DOS debugger for testing and debugging programs
- **DOSBox 0.74-3.lnk** - Shortcut to DOSBox emulator for running DOS programs on modern systems

### Projects

#### 1. REC3.asm - Serial Communication Program
A serial port communication program that implements:
- UART (Universal Asynchronous Receiver/Transmitter) initialization
- Real-time serial data transmission and reception via COM port
- Keyboard input handling for sending data
- Screen output for received data with color-coded display (purple for received, green for sent)
- Automatic scrolling and cursor management
- Baud rate configuration (115200 baud)
- ESC key to exit the program

**Features:**
- Bidirectional serial communication
- Split-screen display showing received and sent messages
- Real-time character-by-character transmission

#### 2. breaker.asm - Breakout Game
A Breakout/Arkanoid-style arcade game implementation featuring:
- Paddle (breaker) control with smooth movement
- Graphics mode programming
- Game mechanics for a brick-breaking game
- Support for multiple breakers/paddles
- Configurable paddle dimensions, colors, and movement smoothness

**Game Elements:**
- Adjustable paddle length (40 pixels default)
- Customizable paddle colors
- Smooth paddle movement control
- Multiple paddle support (first and second breaker configurations)

## Requirements

- **DOSBox** or a DOS-compatible environment to run the compiled executables
- The assembler tools (MASM.EXE or TASM.EXE) are included for building the source files

## Usage

### To Assemble and Run Programs:

1. Open DOSBox or your DOS environment
2. Navigate to the repository directory
3. Assemble the code:
   ```
   MASM REC3.asm;
   LINK REC3.obj;
   REC3.EXE
   ```
   or
   ```
   TASM breaker.asm
   LINK breaker.obj
   breaker.EXE
   ```

### Pre-compiled Executables:
- **REC3.EXE** - Serial communication program (ready to run)
- **TEST.EXE** - Test executable

## File Structure

```
.
├── MASM.EXE          # Microsoft Macro Assembler
├── TASM.EXE          # Turbo Assembler
├── LINK.EXE          # Linker
├── DEBUG.EXE         # DOS Debugger
├── REC3.asm          # Serial communication source code
├── REC3.OBJ          # Compiled object file
├── REC3.EXE          # Serial communication executable
├── breaker.asm       # Breakout game source code
├── TEST.EXE          # Test executable
└── DOSBox 0.74-3.lnk # DOSBox shortcut
```

## Technical Details

- **Architecture:** x86 (16-bit)
- **Memory Model:** Small (for REC3.asm)
- **Stack Size:** 100h bytes
- **Programming Language:** x86 Assembly (MASM/TASM syntax)
- **Target Platform:** DOS

## Learning Resources

This repository serves as a practical example of:
- Low-level hardware programming (serial ports, video memory)
- Interrupt handling (INT 10h for video, INT 21h for DOS, INT 16h for keyboard)
- Real-time I/O operations
- Game development in assembly language
- DOS programming techniques

## License

Please refer to the repository license for usage terms.
