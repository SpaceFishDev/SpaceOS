nasm D:/SpaceOS/src/bootloader.asm -f bin -o D:/spaceos/bin/bootloader.bin 

nasm D:/SpaceOS/src/ExtendedProgram.asm -f bin -o D:/spaceos/bin/ExtendedProgram.bin 

copy /b "D:\spaceos\bin\bootloader.bin" + "D:\spaceos\bin\ExtendedProgram.bin" "..\bin\bootloader.flp"

start "" "D:/SpaceOS/bin/bochsrc.bxrc"

pause
