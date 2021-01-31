//
//  selectCharacterViewController.swift
//  RPG-Ultimate
//
//  Created by Mateo Lelong on 05/05/2020.
//  Copyright © 2020 Mateo Lelong. All rights reserved.
//

import UIKit
import AVFoundation

class selectCharacterScreen : UIViewController {
    //Initialization of Outlet
    @IBOutlet weak var Valider1: UIButton!
    @IBOutlet weak var Valider2: UIButton!
    @IBOutlet weak var LabelClasse1: UILabel!
    @IBOutlet weak var LabelClasse2 : UILabel!
    @IBOutlet weak var CharacterUser1: UIView!
    @IBOutlet weak var CharacterUser2: UIView!
    @IBOutlet weak var GoPlayScreen: UIButton!
    //
    //Initialization Music
    var audioSelectCharacter = AVAudioPlayer()
    var bruitReady = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do {
            audioSelectCharacter = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "audio-selectCharacter", ofType: "mp3")!))
            bruitReady = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "bruitReady", ofType: "mp3")!))
            audioSelectCharacter.prepareToPlay()
            bruitReady.prepareToPlay()
        }
        catch {
            print(error)
        }
    }
    //To lock orientation :
    override func viewWillAppear(_ animated : Bool) {
        super.viewWillAppear(animated)
        AppUtility.lockOrientation(.portrait)
        audioSelectCharacter.play()
    }
    override func viewWillDisappear(_ animated : Bool) {
        super.viewDidDisappear(animated)
        AppUtility.lockOrientation(.all)
        audioSelectCharacter.stop()
    }
    //Showing the actual class of User 1
    func changeClasse1 () {
        LabelClasse1.text = classe1
    }
    //Showing the actual class of User 2
    func changeClasse2 () {
        LabelClasse2.text = classe2
    }
    //Verification of the selection of a character
    @IBAction func VerificationAndInitialisation1(_ sender: Any) {
        if (classe1 == "") {
            LabelClasse1.text = "Choisissez une classe"
        }
        else {
            Character().choiceclass1()
            playScreen().choiceWeaponUser1()
            HaveVerified1 = true
            Valider1.isEnabled = false
            Valider1.backgroundColor = UIColor.blue
            CharacterUser1.isUserInteractionEnabled = false
            VerificationOfAll()
        }
    }
    @IBAction func VerificationAndInitialisation2(_ sender: Any) {
        if (classe2 == "") {
            LabelClasse2.text = "Choisissez une classe"
        }
        else {
            Character().choiceclass2()
            playScreen().choiceWeaponUser2()
            HaveVerified2 = true
            Valider2.isEnabled = false
            Valider2.backgroundColor = UIColor.blue
            CharacterUser2.isUserInteractionEnabled = false
            VerificationOfAll()
        }
    }
    //Verification of the 2 class of the 2 players and GO
    func VerificationOfAll() {
        if (HaveVerified1 == true)&&(HaveVerified2 == true) {
            GoPlayScreen.isEnabled = true
            GoPlayScreen.isHidden = false
            audioSelectCharacter.stop()
            bruitReady.play()
        }
    }
    @IBAction func Reset(_ sender: Any) {
        HaveVerified1 = false
        HaveVerified2 = false
        Valider1.isEnabled = true
        Valider2.isEnabled = true
        Valider1.backgroundColor = UIColor.green
        Valider2.backgroundColor = UIColor.green
        CharacterUser1.isUserInteractionEnabled = true
        CharacterUser2.isUserInteractionEnabled = true
        GoPlayScreen.isEnabled = false
        GoPlayScreen.isHidden = true
        audioSelectCharacter.stop()
    }
    //Choising the class of our first player
    @IBAction func selectGuerrier1(_ sender: Any) {
        classe1 = "Guerrier"
        changeClasse1()
    }
    @IBAction func selectArcher1(_ sender: Any) {
        classe1 = "Archer"
        changeClasse1()
    }
    @IBAction func selectMage1(_ sender: Any) {
        classe1 = "Mage"
        changeClasse1()
    }
    @IBAction func selectNinja1(_ sender: Any) {
        classe1 = "Ninja"
        changeClasse1()
    }
    @IBAction func selectAssassin1(_ sender: Any) {
        classe1 = "Assassin"
        changeClasse1()
    }
    @IBAction func selectGeant1(_ sender: Any) {
        classe1 = "Geant"
        changeClasse1()
    }
    @IBAction func selectGobelin1(_ sender: Any) {
        classe1 = "Gobelin"
        changeClasse1()
    }
    @IBAction func selectViking1(_ sender: Any) {
        classe1 = "Viking"
        changeClasse1()
    }
    //Choising the class of our second player
    @IBAction func selectGuerrier2(_ sender: Any) {
        classe2 = "Guerrier"
        changeClasse2()
    }
    @IBAction func selectArcher2(_ sender: Any) {
        classe2 = "Archer"
        changeClasse2()
    }
    @IBAction func selectMage2(_ sender: Any) {
        classe2 = "Mage"
        changeClasse2()
    }
    @IBAction func selectNinja2(_ sender: Any) {
        classe2 = "Ninja"
        changeClasse2()
    }
    @IBAction func selectAssassin2(_ sender: Any) {
        classe2 = "Assassin"
        changeClasse2()
    }
    @IBAction func selectGeant2(_ sender: Any) {
        classe2 = "Geant"
        changeClasse2()
    }
    @IBAction func selectGobelin2(_ sender: Any) {
        classe2 = "Gobelin"
        changeClasse2()
    }
    @IBAction func selectViking2(_ sender: Any) {
        classe2 = "Viking"
        changeClasse2()
    }
}
