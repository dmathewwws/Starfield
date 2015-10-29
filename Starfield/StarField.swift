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
    let starColor:SKColor!
    var starArray = [SKSpriteNode]()
    
    init(count:Int, speed:CGFloat, color:SKColor, xbounds:CGFloat, ybounds:CGFloat){
        starCount = count
        starSpeed = speed
        starColor = color
        self.xbounds = xbounds
        self.ybounds = ybounds
        generateStars()
    }
    
    func generateStars() {
        for _ in 1...starCount {
            let star = SKSpriteNode(imageNamed: "star")
            let randomStarSize = CGFloat(Float.random(5, upper:15))
            star.alpha = 0.8
            star.size = CGSize(width: randomStarSize, height: randomStarSize)
            let x_pos = CGFloat(arc4random_uniform((UInt32)(xbounds)))
            let y_pos = CGFloat(arc4random_uniform((UInt32)(ybounds)))
            star.position = CGPoint(x: x_pos, y: y_pos)
            starArray.append(star)
        }

    }
    
}