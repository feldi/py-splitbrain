# py-splitrain
An UCI "chess engine" that combines the power of NN (neural net) and AB (alpha beta) engines.

The code borrows heavily from the project [CombiChess](https://github.com/tom0334/CombiChess).
Many Thanks to Tom Friederich for his work!

SplitBrainChess a "chess engine" that supports the UCI chess protocol and combines 2 engines (called 'left brain' and 'right brain', respectively) into one. It works by asking the engines what they think the best move is for a given position, and then applying some logic to determine what move to actually do.

The rules that it uses are fairly simple:

  * If an engine sees a mate, then do that move leading to mate immediately.

  * If both engines give the same best move, then do that move.
  
  * if the engines say something else, and the score of the counselor is better than that of the boss by a margin 'cp' (see self.score_margin in code) do the counselor's move. The default margin is 0.5 centipawns.
  
  * Else, always listen to the 'right engine'. 

Think of the "left brain hemisphere" as the analytical, strong tactical part (e.g. Stockfish) 
and the "right brain hemisphere"  as the synthetical, strong strategical part (e.g. Lc0)

Just now i stumbled over this:
[Adviser](https://github.com/dkappe/leela-chess-weights/wiki/Real-Time-Blunder-Checking)

This "adviser" attempt by D. Kappe led to the following conclusions:

 * Leela really doesn't blunder that often.
 * Too small of a window, and you kill Leela's style. Too big, and you might not catch blunders.
 * How can an AB engine distinguish between a blunder and a patented Leela positional sacrifice?
 * Without using AB data in the MCTS, having an AB engine blundercheck Leela is of limited use.
 * You can't just use any old engine to provide advice on tactical blunders. It will try to give advice on any position that moves the needle, not just on ones with material loss. So the strength of the engine is crucial.
 * The adviser had a small but noticeable positive effect, with a few exception.
 * An 80 cp window was most positive: Sf9 at 80 cp made the most difference   

My considerations:

 * Regarding the fifth point, I use the strongest Stockfish available.
 * The third point is still open and crucial and under my investogation.


## Using SplitBrainChess
To use SplitBrainChess, clone the project or download it as a zip. Unzip it if needed, and then place the engines you want to use in the engines folder. Open SplitBrainLauncher.py and change the filenames to the ones in the engines folder you want to use.

SplitBrainChess has one dependency: python-chess. Assuming you have python on your computer, you can install it by opening a terminal and typing the following:

```
pip install python-chess
```

To run SplitBrainChess as a python program, execute the SplitBrainLauncher.py, NOT the SplitBrainChess.py!

## Using SplitBrainChess on Windows as an UCI engine

On Windows, you may run SplitBrain.bat for conveniance. This can be used as the engine command in Arena, CuteChess, etc.

To build a Windows EXE, which is needed for Chessbase / Fritz UCI engines, get the tool PyInstaller by doing

```
pip install pyinstaller
```

and run ``.\build_exe.bat`` which will put the executable file ``SplitBrainChess.exe`` in the root folder of this project.


