//
//  Character.swift
//  RetroRace
//
//  Created by Cameron Zenge on 11/9/23.
//

import SpriteKit

class Character: SKSpriteNode {

    let movePointsPerSecond: CGFloat = 150.0
    var velocity = CGVector(dx: 0.0, dy: 0.0)
    var isMoving = false
    
}
