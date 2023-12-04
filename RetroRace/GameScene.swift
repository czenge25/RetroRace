//
//  GameScene.swift
//  RetroRace
//
//  Created by Cameron Zenge on 9/18/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // Nodes
    var player : SKNode?
    var joystick : SKNode?
    var joystickKnob : SKNode?
    
    // Boolean
    var joystickAction = false
    
    // Measure
    var xKnobRadius: CGFloat = 50.0
    var yKnobRadius: CGFloat = 50.0
    
    // Sprite Engine
    var previousTimeInterval : TimeInterval = 0
    var playerIsFacingRight = true
    var playerSpeedX: CGFloat = 200.0
    var playerSpeedY: CGFloat = 200.0
    
    var needsRotation = false
    
    let pi = CGFloat.pi

    // didmove
    override func didMove(to view: SKView) {
        player = childNode(withName: "Car1")
        joystick = childNode(withName: "joystick")
        joystickKnob = joystick?.childNode(withName: "knob")
        
        // Set up physics for the player
        player?.physicsBody = SKPhysicsBody(rectangleOf: player!.frame.size)
        player?.physicsBody?.categoryBitMask = Collision.Masks.player.bitmask
        player?.physicsBody?.contactTestBitMask = Collision.Masks.killing.bitmask
        player?.physicsBody?.collisionBitMask = Collision.Masks.ground.bitmask
        player?.physicsBody?.affectedByGravity = false
        player?.physicsBody?.allowsRotation = false
    }
}

// MARK: Touches
extension GameScene {
    // Touch Began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
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
        
        // Distance
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
        for touch in touches {
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

// MARK: Action
extension GameScene {
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
    override func update(_ currentTime: TimeInterval) {
        needsRotation = false
        let deltaTime = currentTime - previousTimeInterval
        previousTimeInterval = currentTime
        
        // Player Movement
        guard let joystickKnob = joystickKnob else { return }
        let xPosition = Double(joystickKnob.position.x)
        let yPosition = Double(joystickKnob.position.y)
        
        let xForce = CGFloat(xPosition) * playerSpeedX
        let yForce = CGFloat(yPosition) * playerSpeedY
        
        player?.physicsBody?.applyForce(CGVector(dx: xForce, dy: yForce))

        var rotationAngle = atan2(yPosition, xPosition)

        if (rotationAngle == pi || rotationAngle == -pi) {
            needsRotation = true
        }

        if (needsRotation && rotationAngle == -pi) {
            rotationAngle += pi
        }

        if (needsRotation && rotationAngle == pi) {
            rotationAngle -= pi
        }

        let torque = SKAction.applyTorque(CGFloat(rotationAngle), duration: 0.1)
        
        // Group the torque action with other actions as needed
        let combinedAction = SKAction.group([torque])

        player?.run(combinedAction)

        // Adjusting Facing Direction
        if xPosition < 0 {
            if !playerIsFacingRight {
                // If facing left and turning left, smooth the rotation
                let faceMovement = SKAction.scaleX(to: 1, duration: 0.1)
                player?.run(faceMovement)
                playerIsFacingRight = true
            }
        } else if xPosition > 0 {
            if playerIsFacingRight {
                // If facing right and turning right, smooth the rotation
                let faceMovement = SKAction.scaleX(to: -1, duration: 0.1)
                player?.run(faceMovement)
                playerIsFacingRight = false
            }
        }
    }
}

// MARK: Collisions
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
