//
//  AudioController.swift
//  Starfield
//
//  Created by Daniel Mathews on 2015-11-03.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

import AVFoundation

class AudioController: NSObject, AVAudioPlayerDelegate {
    
    let audioSession = AVAudioSession.sharedInstance()
    let backgroundMusicPlayer:AVAudioPlayer!
    
    override init(){
        let backgroundMusicPath = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("Mister_Lies", ofType: "caf")!)
        backgroundMusicPlayer = try! AVAudioPlayer(contentsOfURL: backgroundMusicPath)
        super.init()
        backgroundMusicPlayer.delegate = self
        backgroundMusicPlayer.numberOfLoops = -1
    }
    
    func playMusic() {
        backgroundMusicPlayer.prepareToPlay()
        backgroundMusicPlayer.play()
    }
    
    
}