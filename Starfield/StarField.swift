//
//  StarField.swift
//  Starfield
//
//  Created by Daniel Mathews on 2015-10-18.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

import SpriteKit

class StarField {
    
    let starCount:Int!
    let starSpeed:CGFloat!
    let xbounds:CGFloat!
    let ybounds:CGFloat!
    let minStarSize:Float!
    let maxStarSize:Float!
    let starColor:SKColor!
    let xDirMovement:CGFloat!
    let yDirMovement:CGFloat!
    var starArray = [SKSpriteNode]()
    
    init(count:Int, speed:CGFloat, color:SKColor, xbounds:CGFloat, ybounds:CGFloat, minStarSize:Float, maxStarSize:Float, xDirMovement:CGFloat, yDirMovement:CGFloat){
        starCount = count
        starSpeed = speed
        starColor = color
        self.xbounds = xbounds
        self.ybounds = ybounds
        self.minStarSize = minStarSize
        self.maxStarSize = maxStarSize
        self.xDirMovement = xDirMovement
        self.yDirMovement = yDirMovement
        generateStars()
    }
    
    func generateStars() {
        for _ in 1...starCount {
            let texture = SKTexture(imageNamed: "spark")
            let star = SKSpriteNode(texture: texture)
            let randomStarSize = CGFloat(Float.random(minStarSize, upper:maxStarSize))
            star.size = CGSize(width: randomStarSize, height: randomStarSize)
            let x_pos = CGFloat(arc4random_uniform((UInt32)(xbounds)))
            let y_pos = CGFloat(arc4random_uniform((UInt32)(ybounds)))
            star.position = CGPoint(x: x_pos, y: y_pos)
            star.colorBlendFactor = 1
            star.color = starColor
            starArray.append(star)
        }

    }
    
}