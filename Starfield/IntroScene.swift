//
//  IntroScene.swift
//  Starfield
//
//  Created by Daniel Mathews on 2015-10-28.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

import SpriteKit

class IntroScene: SKScene {
    
    let playButton = SKSpriteNode(imageNamed: "play")
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        self.backgroundColor = UIColor.blackColor()
        
        playButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        self.addChild(playButton)
    
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            if self.nodeAtPoint(location) == playButton {
                let scene = GameScene(size: self.size)
                let skView = self.view as SKView!
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .ResizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
                
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
