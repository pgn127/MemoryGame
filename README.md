# MemoryGame
The game will work by taking a collection of images and randomly apply them to game tiles. At the start of the game, all tiles display images of question marks.

A user plays the game by subsequently tapping tiles. When a user taps a tile its image is revealed. When the user taps a second tile its image is also revealed, but this time for 1 second only. After 1 second has elapsed one of two things can happen:
* 1) if it is a match, both tiles vanish
* 2) if it is a mismatch, both tiles return to displaying images of question marks

The game includes a scoring mechanism. A match adds 200 points to the score. A mismatch reduces the score by 100 points.

The user will continue to attempt to match the tiles until there are no tiles left, at which point the game ends and the score is presented to the user in an alert view.
![End game image](MemoryGame/master/endgame.png "OptionalTitle")


##Specification:
The application is split into four parts, each part is under a separate GIT branch.
The basic structure of the application includes the following:
* Model - stores the game state, informs the controller of significant game events ( matched tiles, mismatched tiles, game completion)
* User Interface - contains image tiles (TileViews)
* TileView - code defining how a tile displays itself, is able to receive touch events.
* Controller - connects the Model with the User Interface

###Part 1: The Model
####Class - GameModel
This part sets up model class for the application. It includes a 'TileData' object (as a struct) that contains an image identifier and an image object. The GameModel object is responsible for handling the game state and managing an array of shuffled TileData objects. This GameModel is also responsible for maintaining the state of the last two selected tiles and notify another class via a delegate function if the two tiles match.

###Part2: The User Interface

This part creates a user interface that works on several different iOS device types (tested on iPhone 4s and iPhone 6+). The game model or game logic is not yet connected to the user interface in this part. The view controller in storyboard is set up with organized tiles.


###Part3: TileView Implementation
This part will have the User Interface implemented and testable but the game logic is still not linked.
####Class - TileView 
This class contains properties that correspond to each individual tile set up in the storyboard (by a tile index) and is responsible for contains a reveal image function. A TileView object is responsible for informing the ViewController class when it has been tapped on. It is also responsible for managing its own logic as if it is tapped - change state by revealing an image. 

###Part4: The Controller
This part implements the Controller, filling in missing link between GameModel and TileViews. 
####Class- ViewController
This class sets up the TileViews in the UI by linking each tileview to the TileData struct from GameModel. This class also implements the interface defined in the TileView so that controller is informed when a tile is tapped and what the index of the tapped tile is.




