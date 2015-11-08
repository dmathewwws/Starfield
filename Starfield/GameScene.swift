//
//  GameScene.swift
//  Starfield
//
//  Created by Daniel Mathews on 2015-10-18.
//  Copyright (c) 2015 Daniel Mathews. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var starView:StarView!
    
    var lastUpdatedTime:NSTimeInterval = 0
    let deltaTimeConstant:CGFloat = 0.01666
    var deltaTime:CGFloat = 0.01666
    
    let audioController = AudioController()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        self.backgroundColor = SKColor.blackColor()
        
        starView = StarView(frame:self.frame)
        let starsArray = starView.getStars()
        
        for stars in starsArray {
            addChild(stars)
        }
        
        audioController.playMusic()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        deltaTime = CGFloat(currentTime - lastUpdatedTime)
        lastUpdatedTime = currentTime
        
        if deltaTime > 1.0 {
            deltaTime = deltaTimeConstant
        }
        
        starView.rootUpdated(deltaTime)

    }
    
        
}
