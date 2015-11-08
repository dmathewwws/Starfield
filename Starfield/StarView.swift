//
//  StarView.swift
//  Starfield
//
//  Created by Daniel Mathews on 2015-11-07.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

import SpriteKit

class StarView: SKView {

    var starFieldArray:[StarField]!
    
    override init(frame: CGRect) {
        
        let starField1 = StarField(count: 15, speed: 30.0, color: SKColor.darkGrayColor(), xbounds: frame.width, ybounds: frame.height, minStarSize:2, maxStarSize:5, xDirMovement:0, yDirMovement:-0.8)
        let starField2 = StarField(count: 30, speed: 10.0, color: SKColor.grayColor(), xbounds: frame.width, ybounds: frame.height, minStarSize:2, maxStarSize:5, xDirMovement:0, yDirMovement:-0.8)
        let starField3 = StarField(count: 50, speed: 10.0, color: SKColor.lightGrayColor(), xbounds: frame.width, ybounds: frame.height, minStarSize:2, maxStarSize:5, xDirMovement:0, yDirMovement:-0.8)
        let starField4 = StarField(count: 2, speed: 10.0, color: SKColor.redColor(), xbounds: frame.width, ybounds: frame.height, minStarSize:3, maxStarSize:3, xDirMovement:0, yDirMovement:-0.8)
        let starField5 = StarField(count: 2, speed: 10.0, color: SKColor.yellowColor(), xbounds: frame.width, ybounds: frame.height, minStarSize:3, maxStarSize:3, xDirMovement:0, yDirMovement:-0.8)
        
        starFieldArray = [starField1, starField2, starField3, starField4, starField5]
        
        super.init(frame: frame)
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getStars() -> [SKSpriteNode] {
        
        var stars = [SKSpriteNode]()
        
        for starField in starFieldArray {
            stars += starField.starArray
        }
        
        return stars
    }
    
    func rootUpdated(deltaTime:CGFloat){
        
        for starField in starFieldArray {
            for star in starField.starArray {
                let new_x = star.position.x + starField.xDirMovement * starField.starSpeed * deltaTime
                let new_y = star.position.y + starField.yDirMovement * starField.starSpeed * deltaTime
                star.position = boundsCheck(CGPoint(x: new_x, y: new_y))
            }
        }
        
    }
    
    func boundsCheck(pos:CGPoint) -> CGPoint {
        
        var x = pos.x
        var y = pos.y
        
        let xFrame = self.frame.width
        let yFrame = self.frame.height
        
        
        if x < 0 {
            x += xFrame
            y = CGFloat(arc4random_uniform((UInt32)(yFrame)))
        }
        
        if y < 0 {
            y += yFrame
            x = CGFloat(arc4random_uniform((UInt32)(xFrame)))
        }
        
        if x > xFrame {
            x -= xFrame
            y = CGFloat(arc4random_uniform((UInt32)(yFrame)))
        }
        
        if y > yFrame {
            y -= yFrame
            x = CGFloat(arc4random_uniform((UInt32)(xFrame)))
        }
        
        return CGPoint(x: x, y: y)
    }

}
