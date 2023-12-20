***RetroRace***

**Overview**
This repository contains Swift files for the RetroRace game, created by Cameron Zenge and Hugh Karmozyn. The main files are:

GameScene.swift: Implements the main gameplay scene using the SpriteKit framework.
MapBuilder.swift: Provides a class for building and managing game maps.
AppDelegate.swift: Manages the application lifecycle and customization.

**GameScene.swift**
*Contents*
Player and Joystick Variables: Declaration of variables for the player, joystick, joystick knob, brake button, map builder, and camera.
Joystick Variables: Configuration variables for joystick functionality.
Sprite Engine: Variables related to the sprite engine for player movement.
Constants: Definition of the pi constant.
didMove: Initialization method that sets up the game scene, including player, joystick, brake button, camera, physics, and map generation.
Touches Extension: Implementation of touch event handlers for handling user input, including brake button and joystick interaction.
resetKnobPosition: Helper method to reset the joystick knob position.
Game Loop Extension: Implementation of the game loop for updating player movement, camera position, and joystick position.
Collisions (commented out): An extension that includes collision handling using SpriteKit's physics contact delegate. Currently commented out and marked as not functional.
Map Selection: The scene initializes with a selected map (currently "Tutorial"). Depending on the map, road, and grass tiles are generated. Additional code blocks can be added for other map selections.

*Usage*
Ensure the RetroRace project is set up with appropriate assets.
Integrate this GameScene.swift file into the project.
Customize map generation and gameplay logic based on the specific needs of the game.

*Touches*
touchesBegan: Handles the start of touches, determining whether the brake button or joystick knob is being interacted with.
touchesMoved: Handles touch movement, updating the joystick knob position.
touchesEnded: Handles the end of touches, resetting the joystick knob position if necessary.
Game Loop
The game loop updates player movement, camera position, and joystick position. It also handles player braking, acceleration, and damping based on user input.

*Collisions (commented out)*
The collision handling extension using SpriteKit's physics contact delegate is provided but currently commented out. This can be uncommented and modified as needed for collision interactions.

**MapBuilder.swift**
*Contents*
MapBuilder Class: Manages the creation and transition of game maps.
init: Initializes the MapBuilder with the initial scene and sets up the map.
setupMap: Placeholder method for adding code to create the map based on the scene and tileSize.
changeScene: Method to perform any scene transition logic by changing the current scene.

**AppDelegate.swift**
*Contents*
AppDelegate Class: Manages the application lifecycle and customization.
application(_:didFinishLaunchingWithOptions): Override point for customization after application launch.
applicationWillResignActive(_:): Sent when the application is about to move from active to inactive state.
applicationDidEnterBackground(_:): Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state.
applicationWillEnterForeground(_:): Called as part of the transition from the background to the active state.
applicationDidBecomeActive(_:): Restart any tasks that were paused while the application was inactive.

**Installation**
To install and run the RetroRace game:

1. Ensure you have Xcode installed on your macOS system.
2. Clone this repository to your local machine.
3. Open the RetroRace project in Xcode.
5. Build and run the project using the Xcode simulator or connect a physical device.

Here is an image of a successful run:
<img width="1440" alt="Screenshot 2023-12-18 at 1 41 47 PM" src="https://github.com/czenge25/RetroRace/assets/117951387/98438030-fdd5-4a34-9d2d-d38ebfdb70cb">


**Known Issues**
Currently, there is an Xcode Simulator bug that may not allow other people to properly run the Simulator and run the game on their device. The solution to this problem is not currently known, but will be updated as it is found.

**Unimplemented Features**
Objectives: Levels, finish lines, and scoring. 
Customizables: Cosmetics, an item shop, and car upgrades.
Gameplay: Pit stops, gas, coins, limited time modes.
Sound design: Music, sound effects.
