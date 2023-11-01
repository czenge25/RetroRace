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
    
    // Sprite Enginge
    var previousTimeInterval : TimeInterval = 0
    var playerIsFacingRight = true
    var playerSpeedX: Double = 4.0
    var playerSpeedY: Double = 4.0
    
    // didmove
    override func didMove(to view: SKView) {
        player = childNode(withName: "car1")
        joystick = childNode(withName: "joystick")
        joystickKnob = joystick?.childNode(withName: "knob")
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
        let initialPoint = CGPoint(x: 0,y: 0)
        let moveBack = SKAction.move(to: initialPoint, duration: 0.1)
        moveBack.timingMode = .linear
        joystickKnob?.run(moveBack)
        joystickAction = false
    }
}

// MARK: Game Loop
extension GameScene {
    override func update(_ currentTime: TimeInterval) {
    let deltaTime = currentTime - previousTimeInterval
    previousTimeInterval = currentTime
    
    // Player Movement
    guard let joystickKnob = joystickKnob else { return }
    let xPosition = Double(joystickKnob.position.x)
    let yPosition = Double(joystickKnob.position.y)
    
    let xDisplacement = CGVector(dx: deltaTime * xPosition * playerSpeedX, dy: 0)
    let yDisplacement = CGVector(dx: 0, dy: deltaTime * yPosition * playerSpeedY)
    
    let moveX = SKAction.move(by: xDisplacement, duration: 0)
    let moveY = SKAction.move(by: yDisplacement, duration: 0)
    
    var faceAction: SKAction
    
    if xPosition < 0 {
        if playerIsFacingRight {
            playerIsFacingRight = false
            let faceMovement = SKAction.scaleX(to: -1, duration: 0.0)
            faceAction = SKAction.sequence([moveX, faceMovement, moveY])
        } else {
            faceAction = SKAction.sequence([moveX, moveY])
        }
    } else if xPosition > 0 {
        if !playerIsFacingRight {
            playerIsFacingRight = true
            let faceMovement = SKAction.scaleX(to: 1, duration: 0.0)
            faceAction = SKAction.sequence([moveX, faceMovement, moveY])
        } else {
            faceAction = SKAction.sequence([moveX, moveY])
        }
    } else {
        faceAction = moveY
    }
    
    player?.run(faceAction)

    }
}








// collisions
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
