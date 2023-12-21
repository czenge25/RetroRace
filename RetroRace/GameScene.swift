/*
CZ, HK
12/21/23
 */

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // Player and joystick vars
    var player : SKNode?
    var joystick : SKNode?
    var joystickKnob : SKNode?
    
    // Brake vars
    var brakeButton: SKSpriteNode?
    var isBraking = false
    
    // MapBuilder vars
    var sceneName : String?
    var mp : MapBuilder?

    // Camera var
    var sceneCamera : SKCameraNode = SKCameraNode()
    
    // Joystick variables
    var joystickAction = false
    var xKnobRadius: CGFloat = 50.0
    var yKnobRadius: CGFloat = 50.0
    
    // Sprite Engine
    var previousTimeInterval : TimeInterval = 0
    var playerIsFacingRight = true
    var playerSpeedX: CGFloat = 1.0
    var playerSpeedY: CGFloat = 1.0
    
    // Pi constant
    let pi = CGFloat.pi

    // didMove
    override func didMove(to view: SKView) {
        player = childNode(withName: "Car1")
        
        joystick = childNode(withName: "joystick")
        joystickKnob = joystick?.childNode(withName: "knob")
        
        // Create brake button as SKSpriteNode
        let brakeButtonTexture = SKTexture(imageNamed: "BrakeButton")
        brakeButton = SKSpriteNode(texture: brakeButtonTexture)
        brakeButton?.scale(to: CGSize(width: 100, height: 300))
        brakeButton?.name = "brakeButton"
        brakeButton?.zPosition = 2
        
        addChild(brakeButton!)

        camera = sceneCamera
        
        // Set up physics for the player
        player?.physicsBody = SKPhysicsBody(rectangleOf: player!.frame.size)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        player?.position = CGPoint(x: 0, y: 0)
        
// MARK: Map Selection
        mp = MapBuilder(scene: "Tutorial")
        sceneName = mp?.scene
        
        if (sceneName == "Tutorial") {
            // Creating road tiles
            var count = 0...5;
            for i in count {
                let roadTile = SKSpriteNode(imageNamed: "Road_01_Tile_03")
                roadTile.yScale = 0.25
                roadTile.xScale = 1.75
                roadTile.zPosition = 1
                roadTile.position.x = CGFloat(896 * i)
                roadTile.position.y = 0
                addChild(roadTile)
            }
            
            // Creating grass tiles
            count = 0...15
            var numbers = 0...25
            for i in numbers {
                for j in count {
                    let grassTile = SKSpriteNode(imageNamed: "Grass_Tile")
                    grassTile.yScale = 0.5
                    grassTile.xScale = 0.5
                    grassTile.zPosition = 0
                    grassTile.position.x = CGFloat(256 * i) - 1280
                    grassTile.position.y = CGFloat(256 * j) - 2560
                    addChild(grassTile)
                }
            }
            
        } else if (sceneName == "Level1") {
            // Code for Level1
        } else if (sceneName == "Level2") {
            // Code for Level2
        } else {
            // Code for other scenes
        }
    }
}

// MARK: Touches
extension GameScene {
    // Touch Began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            // Check if the touch is on the brakeButton
            if let brakeButton = brakeButton {
                let location = touch.location(in: self)
                isBraking = brakeButton.frame.contains(location)
            }
            // Check if the touch is on the joystickKnob
            if let joystickKnob = joystickKnob {
                let location = touch.location(in: joystick!)
                joystickAction = joystickKnob.frame.contains(location)
            }
        }
    }
    
    // Touch Moved
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let joystick = joystick else { return }
        guard let joystickKnob = joystickKnob else { return }
        
        if !joystickAction { return }
        
        // Move the joystick knob based on touch distance
        for touch in touches {
            let position = touch.location(in: joystick)
            let xLength = position.x
            let yLength = position.y

            let length = sqrt(pow(xLength, 2) + pow(yLength, 2))

            if length < xKnobRadius {
                joystickKnob.position = position
            } else {
                let angle = atan2(yLength, xLength)
                let xMovement = cos(angle) * xKnobRadius
                let yMovement = sin(angle) * yKnobRadius
                joystickKnob.position = CGPoint(x: xMovement, y: yMovement)
            }
        }
    }
    
    // Touch End
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isBraking = false
        for touch in touches {
            // Check joystick coordinates and reset knob position if necessary
            let xJoystickCoordinate = touch.location(in: joystick!).x
            let xLimit: CGFloat = 200.0
            if xJoystickCoordinate > -xLimit && xJoystickCoordinate < xLimit {
                resetKnobPosition()
            }
            let yJoystickCoordinate = touch.location(in: joystick!).y
            let yLimit: CGFloat = 200.0
            if yJoystickCoordinate > -yLimit && yJoystickCoordinate < yLimit {
                resetKnobPosition()
            }
        }
    }
}

extension GameScene {
    // Reset joystick knob position
    func resetKnobPosition() {
        let initialPoint = CGPoint(x: 0, y: 0)
        let moveBack = SKAction.move(to: initialPoint, duration: 0.1)
        moveBack.timingMode = .linear
        joystickKnob?.run(moveBack)
        joystickAction = false
    }
}

// MARK: Game Loop
extension GameScene {
    // Game loop for player movement and actions
    override func update(_ currentTime: TimeInterval) {
        // Update camera position based on player position
        camera?.position.x = player?.position.x ?? 0
        camera?.position.y = player?.position.y ?? 0
        
        // Update joystick position based on camera position
        joystick?.position.x = (camera?.position.x ?? 0) - 300
        joystick?.position.y = (camera?.position.y ?? 0) - 100
        
        let deltaTime = currentTime - previousTimeInterval
        previousTimeInterval = currentTime
        
        // Player Movement
        guard let joystickKnob = joystickKnob else { return }
        let xPosition = Double(joystickKnob.position.x)
        let yPosition = Double(joystickKnob.position.y)
        
        brakeButton?.position.x = (player?.position.x ?? 0) + 300
        brakeButton?.position.y = (player?.position.y ?? 0) - 175
        
        let maxSpeed: CGFloat = 350.0
        let acceleration: CGFloat = 2
        let damping: CGFloat = 0.995
        
        if isBraking {
            // Apply braking force
            let brakeFriction: CGFloat = 0.98
            
            player?.physicsBody?.velocity.dx *= brakeFriction
            player?.physicsBody?.velocity.dy *= brakeFriction
            
            if (abs(player?.physicsBody?.velocity.dx ?? 0) < 5.0 && abs(player?.physicsBody?.velocity.dy ?? 0) < 5.0) {
                player?.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                isBraking = false
            }
        }
        
        if (joystickAction) {
            // Calculate force components and apply force to the player's physics body
            let xForce = CGFloat(xPosition) * playerSpeedX * deltaTime
            let yForce = CGFloat(yPosition) * playerSpeedY * deltaTime
            
            player?.physicsBody?.applyForce(CGVector(dx: xForce, dy: yForce))
            
            player?.physicsBody?.velocity.dx = max(min((player?.physicsBody?.velocity.dx ?? 0) + xForce * acceleration, maxSpeed), -maxSpeed)
            player?.physicsBody?.velocity.dy = max(min((player?.physicsBody?.velocity.dy ?? 0) + yForce * acceleration, maxSpeed), -maxSpeed)
            
            let angle = atan2(yForce, xForce)
            
            player?.zRotation = angle
        } else {
            // Apply damping to gradually reduce velocity when there's no input
            player?.physicsBody?.velocity.dx *= damping
            player?.physicsBody?.velocity.dy *= damping
        }
        
        print("Player Position: \(player?.position ?? .zero)")
        print("Player Is Hidden: \(player?.isHidden ?? true)")
        print("Joystick Action: \(joystickAction)")
    }
}

// MARK: Collisions

// *Not currently properly functional*

/*
extension GameScene: SKPhysicsContactDelegate{
    
    struct Collision{
        enum Masks: Int{
            case killing, player, reward, ground
            var bitmask: UInt32{ return 1<<self.rawValue}
        }
        let masks: (first: UInt32, second:UInt32)
        func matches (first: Masks, second: Masks) -> Bool{
            return (first.bitmask==masks.first && second.bitmask == masks.second) ||
            (first.bitmask==masks.second && second.bitmask == masks.first)
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        let collision = Collision(masks: (first: contact.bodyA.categoryBitMask, second: contact.bodyB.categoryBitMask))
        
        if collision.matches(first: .player, second: .killing) {
            let die = SKAction.move(to: CGPoint(x: -300, y: -100), duration: 0.0)
            player?.run(die)
        }
    }
    
}
*/


