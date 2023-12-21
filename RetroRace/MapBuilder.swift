/*
CZ, HK
12/21/23
 */

import Foundation
import SpriteKit

class MapBuilder {
    
    var scene: String
    
    init(scene: String) {
        self.scene = scene
        
        // Additional setup code can go here
        setupMap()
    }
    
    public func setupMap() {
        // Add code to create the map based on the scene and tileSize
        // For example, you could add nodes to the scene to represent the map
        
    }
    
    public func changeScene(to newScene: String) {
        // Perform any scene transition logic here
        scene = newScene
    }
    
}
