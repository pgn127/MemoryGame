# MemoryGame
The game will work by taking a collection of images and randomly apply them to game tiles. At the start of the game, all tiles display images of question marks.

A user plays the game by subsequently tapping tiles. When a user taps a tile its image is revealed. When the user taps a second tile its image is also revealed, but this time for 1 second only. After 1 second has elapsed one of two things can happen:
*1) if it is a match, both tiles vanish
*2) if it is a mismatch, both tiles return to displaying images of question marks

The game includes a scoring mechanism. A match adds 200 points to the score. A mismatch reduces the score by 100 points.

The user will continue to attempt to match the tiles until there are no tiles left, at which point the game ends and the score is presented to the user in an alert view.


#Specification:
The application is split into four parts, each part is under a separate GIT branch.
The basic structure of the application includes the following:
*Model - stores the game state, informs the controller of significant game events ( matched tiles, mismatched tiles, game completion)
*User Interface - contains image tiles (TileViews)
*TileView - code defining how a tile displays itself, is able to receive touch events.
*Controller - connects the Model with the User Interface


