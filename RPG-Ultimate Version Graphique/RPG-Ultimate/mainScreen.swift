//
//  mainScreen.swift
//  RPG-Ultimate
//
//  Created by matéo lelong on 27/04/2020.
//  Copyright © 2020 Mateo Lelong. All rights reserved.
//

import UIKit
import AVFoundation

class mainScreen : UIViewController {
    
    var IsPlayMusic : Int = 0
    var mainAudio = AVAudioPlayer()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            mainAudio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio-main", ofType: "mp3")!))
            mainAudio.prepareToPlay()
        }
        catch {
            print(error)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if IsPlayMusic == 0 {
            mainAudio.play()
            IsPlayMusic = IsPlayMusic + 1
        }
        else {
            
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if IsPlayMusic == 1 {
            mainAudio.stop()
            IsPlayMusic = IsPlayMusic + 1
        }
        else {
            
        }
    }
}
