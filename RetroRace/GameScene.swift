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
    var joystickX : SKNode?
    var joystickY : SKNode?
    var joystickKnob : SKNode?
    
    // Boolean
    var joystickAction = false
    
    // Measure
    var knobRadius : CGFloat = 50.0
    
    // didmove
    override func didMove(to view: SKView) {
        
        player = childNode(withName: "car")
        joystickX = childNode(withName: "arrowX")
        joystickY = childNode(withName: "arrowY")
        joystickKnob = joystick?.childNode(withName: "knob")
        joystick = joystickKnob + joystickX + joystickY
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
            
            let length = sqrt(pow(position.y, 2) + pow(position.x, 2))
            let angle = atan2(position.y, position.x)
            
            if knobRadius > length {
                joystickKnob.position = position
            } else {
                joystickKnob.position = CGPoint(x: cos(angle) * knobRadius, y: sin(angle) * knobRadius)
            }
        }
    }
    
    // Touch End
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
