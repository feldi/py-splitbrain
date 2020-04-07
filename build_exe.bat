@echo off

pyinstaller -wF splitBrainLauncher.spec

cp dist/SplitBrainChess.exe ./SplitBrainChess.exe 

