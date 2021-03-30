//
//  mainScreen.swift
//  RPG-Ultimate
//
//  Created by matéo lelong on 27/04/2020.
//  Copyright © 2020 Mateo Lelong. All rights reserved.
//

import UIKit
import AVFoundation
import UserNotifications

class mainScreen : UIViewController {
    
    var IsPlayMusic : Int = 0
    var mainAudio = AVAudioPlayer()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Notification
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        let content = UNMutableNotificationContent()
        content.title = "Come play with us !"
        content.body = "We don't see you today ! Why not play a game with your favorite character"
        let date = Date().addingTimeInterval(86400)
        let dateComponents = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        center.add(request) { (error) in
        }
        //Music
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
