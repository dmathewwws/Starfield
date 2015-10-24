//
//  GameScene.swift
//  Starfield
//
//  Created by Daniel Mathews on 2015-10-18.
//  Copyright (c) 2015 Daniel Mathews. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var starField1: StarField!
    var starField2: StarField!
    var starField3: StarField!
    
    var lastUpdatedTime:NSTimeInterval = 0
    let deltaTimeConstant:CGFloat = 0.01666
    var deltaTime:CGFloat = 0.01666
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        self.backgroundColor = SKColor.blackColor()
        
        starField1 = StarField(count: 6, speed: 30.0, color: SKColor.whiteColor(), xbounds: self.frame.width, ybounds: self.frame.height)
        starField2 = StarField(count: 20, speed: 10.0, color: SKColor.whiteColor(), xbounds: self.frame.width, ybounds: self.frame.height)
        starField3 = StarField(count: 50, speed: 10.0, color: SKColor.whiteColor(), xbounds: self.frame.width, ybounds: self.frame.height)
        
        for stars in starField1.starArray {
            addChild(stars)
        }
        
        for stars in starField2.starArray {
            addChild(stars)
        }
        
        for stars in starField3.starArray {
            addChild(stars)
        }
        
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
        
        moveSingleLayer(starField1, xDir: 0.2, yDir: -0.8)
        moveSingleLayer(starField2, xDir: 0, yDir: -0.5)
        moveSingleLayer(starField3, xDir: 0, yDir: 0)
    }
    
    
    func moveSingleLayer(starField: StarField, xDir:CGFloat, yDir:CGFloat){
        
        for star in starField.starArray {
            let new_x = star.position.x + xDir * starField.starSpeed * deltaTime
            let new_y = star.position.y + yDir * starField.starSpeed * deltaTime
            star.position = boundsCheck(CGPoint(x: new_x, y: new_y))
        }
    }
    
    func boundsCheck(pos:CGPoint) -> CGPoint {
        
        var x = pos.x
        var y = pos.y
        
        let xFrame = self.frame.width
        let yFrame = self.frame.height

        
        if x < 0 {
            x += xFrame
        }
        
        if y < 0 {
            y += yFrame
        }
        
        if x > xFrame {
            x -= xFrame
        }
        
        if y > yFrame {
            y -= yFrame
        }
        
        return CGPoint(x: x, y: y)
    }
    
}
