//
//  playScreen.swift
//  RPG-Ultimate
//
//  Created by laurent lelong on 06/05/2020.
//  Copyright © 2020 Mateo Lelong. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class playScreen : UIViewController {
    //Initialization Outlet
        //For the return, global and externous
    @IBOutlet weak var StackViewPlay: UIStackView!
    @IBOutlet weak var ReturnCharacterScreenButton: UIButton!
    @IBOutlet weak var WhoWin: UILabel!
    @IBOutlet weak var ScreenUser1: UIView!
    @IBOutlet weak var ScreenUser2: UIView!
        //Graphics informations
    @IBOutlet weak var Joueur1: UILabel!
    @IBOutlet weak var Joueur2: UILabel!
    @IBOutlet weak var ClasseUser1: UILabel!
    @IBOutlet weak var ClasseUser2: UILabel!
    @IBOutlet weak var imageUser1: UIImageView!
    @IBOutlet weak var imageUser2: UIImageView!
    @IBOutlet weak var hp1Script: UILabel!
    @IBOutlet weak var hp2Script: UILabel!
    @IBOutlet weak var hp1Graphic: UISlider!
    @IBOutlet weak var hp2Graphic: UISlider!
    @IBOutlet weak var dammage1Script: UILabel!
    @IBOutlet weak var dammage2Script: UILabel!
    @IBOutlet weak var SpecialAttaqueButton1: UIButton!
    @IBOutlet weak var SpecialAttaqueButton2: UIButton!
    @IBOutlet weak var IconEpee1: UIImageView!
    @IBOutlet weak var IconEndormis1: UIImageView!
    @IBOutlet weak var IconBouclier1: UIImageView!
    @IBOutlet weak var IconPoison1: UIImageView!
    @IBOutlet weak var IconEpee2: UIImageView!
    @IBOutlet weak var IconEndormis2: UIImageView!
    @IBOutlet weak var IconBouclier2: UIImageView!
    @IBOutlet weak var IconPoison2: UIImageView!
        //For the interraction
    @IBOutlet weak var InterractionToUser1: UITextView!
    @IBOutlet weak var InterractionToUser2: UITextView!
    //Initialization music things
    var bruitCoupEpee = AVAudioPlayer()
    var bruitCoupPoingt = AVAudioPlayer()
    var bruitFleche = AVAudioPlayer()
    var bruitHache = AVAudioPlayer()
    var bruitAmelioration = AVAudioPlayer()
    var bruitSpecial = AVAudioPlayer()
    var bruitBegin = AVAudioPlayer()
    var bruitWin = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        AppUtility.lockOrientation(.landscape)
        //Loading music
        do {
            bruitCoupEpee = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "coup-depee", ofType: "mp3")!))
            bruitCoupPoingt = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "bruitage-claque", ofType: "mp3")!))
            bruitFleche = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "bruitFleche", ofType: "mp3")!))
            bruitHache = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "bruitHache", ofType: "mp3")!))
            bruitAmelioration = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "bruitAmelioration", ofType: "mp3")!))
            bruitSpecial = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "bruitSpecial", ofType: "mp3")!))
            bruitBegin = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "bruitBegin", ofType: "mp3")!))
            bruitWin = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "bruitWin", ofType: "mp3")!))
            bruitCoupEpee.prepareToPlay()
            bruitCoupPoingt.prepareToPlay()
            bruitFleche.prepareToPlay()
            bruitHache.prepareToPlay()
            bruitAmelioration.prepareToPlay()
            bruitSpecial.prepareToPlay()
            bruitBegin.prepareToPlay()
            bruitWin.prepareToPlay()
        }
        catch {
            print(error)
        }
    }
    //To return to selectCharacterScreen
    @IBAction func returnCharacterScreen(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    //For the Hide Bar, the lock orientation and others graphics caracteristics :
    override func viewWillAppear(_ animated : Bool) {
        super.viewWillAppear(animated)
        //Interface loading
        self.navigationController?.isNavigationBarHidden = true
        //Music launching
        bruitBegin.play()
        //Initialisation des variables globales
        SpecialGuerrier1 = false
        SpecialNinja1  = false
        SpecialGobelin1 = false
        EndormisUser1 = false
        ReturnSpecialGeant1 = 0
        IsUsedGuerrier1 = 2
        IsUsedArcher1 = 1
        IsUsedMage1 = 2
        IsUsedNinja1 = 1
        IsUsedAssassin1 = 1
        IsUsedGeant1 = 5
        IsUsedGobelin1 = 1
        IsUsedViking1 = 2
        SpecialGuerrier2 = false
        SpecialNinja2 = false
        SpecialGobelin2 = false
        EndormisUser2 = false
        ReturnSpecialGeant2 = 0
        IsUsedGuerrier2 = 2
        IsUsedArcher2 = 1
        IsUsedMage2 = 2
        IsUsedNinja2 = 1
        IsUsedAssassin2 = 1
        IsUsedGeant2 = 5
        IsUsedGobelin2 = 1
        IsUsedViking2 = 2
        poison1 = false
        poison2 = false
        poisontime1 = 15
        poisontime2 = 15
        round = 0
        //
        //Loading Images and view
        ReturnCharacterScreenButton.isEnabled = false
        ReturnCharacterScreenButton.isHidden = true
        StackViewPlay.isHidden = false
        StackViewPlay.isUserInteractionEnabled = true
        loadingImages()
        loadingButtonSpecial()
        //Loading sliders
        hp1Graphic.value = hp1
        hp1Graphic.setThumbImage(UIImage(named: "coeurSlider"), for: .normal)
        hp2Graphic.value = hp2
        hp2Graphic.setThumbImage(UIImage(named: "coeurSlider"), for: .normal)
        //Loading values and Labels
        ClasseUser1.text = classe1
        ClasseUser2.text = classe2
        hp1Script.text = " hp : \(hp1)"
        hp2Script.text = " hp : \(hp2)"
        dammage1Script.text = " Dommage : \(dammage1)"
        dammage2Script.text = " Dommage : \(dammage2)"
        PasseSonTour1 = false
        PasseSonTour2 = false
        //Loading accessibility
        ScreenUser1.isUserInteractionEnabled = true
        ScreenUser2.isUserInteractionEnabled = false
        SpecialAttaqueButton1.isHidden = false
        SpecialAttaqueButton1.isEnabled = true
        SpecialAttaqueButton2.isHidden = false
        SpecialAttaqueButton2.isEnabled = true
        IconEpee1.isHidden = true
        IconEndormis1.isHidden = true
        IconBouclier1.isHidden = true
        IconPoison1.isHidden = true
        IconEpee2.isHidden = true
        IconEndormis2.isHidden = true
        IconBouclier2.isHidden = true
        IconPoison2.isHidden = true
    }
    //When you return to the selectCharacterScreen
    override func viewWillDisappear(_ animated : Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
        AppUtility.lockOrientation(.all)
    }
    //Controll all the music things in the screen
    func MusicChoosing1() {
        if classe1 == "Archer"  {
            bruitFleche.play()
        }
        else if classe1 == "Guerrier" || classe1 == "Assassin" || classe1 == "Ninja"{
            bruitCoupEpee.play()
        }
        else if classe1 == "Viking" {
            bruitHache.play()
        }
        else {
            bruitCoupPoingt.play()
        }
    }
    func MusicChoosing2() {
        if classe2 == "Archer"  {
            bruitFleche.play()
        }
        else if classe2 == "Guerrier" || classe2 == "Assassin" || classe2 == "Ninja"{
            bruitCoupEpee.play()
        }
        else if classe2 == "Viking" {
            bruitHache.play()
        }
        else {
            bruitCoupPoingt.play()
        }
    }
    //Load images
    func loadingImages() {
        //For the image of User1
        if classe1 == "Guerrier" {
            imageUser1.image = UIImage(named : "Guerrier Play")
        }
        else if classe1 == "Archer" {
            imageUser1.image = UIImage(named : "Archer Play")
        }
        else if classe1 == "Mage" {
            imageUser1.image = UIImage(named : "Mage Play")
        }
        else if classe1 == "Ninja" {
            imageUser1.image = UIImage(named : "Ninja Play")
        }
        else if classe1 == "Assassin" {
            imageUser1.image = UIImage(named : "Assassin Play")
        }
        else if classe1 == "Geant" {
            imageUser1.image = UIImage(named : "Geant Play")
        }
        else if classe1 == "Gobelin" {
            imageUser1.image = UIImage(named : "Gobelin Play")
        }
        else if classe1 == "Viking" {
            imageUser1.image = UIImage(named : "Viking Choix")
        }
        //For the image of User2
        if classe2 == "Guerrier" {
            imageUser2.image = UIImage(named : "Guerrier Play")
        }
        else if classe2 == "Archer" {
            imageUser2.image = UIImage(named : "Archer Play")
        }
        else if classe2 == "Mage" {
            imageUser2.image = UIImage(named : "Mage Play")
        }
        else if classe2 == "Ninja" {
            imageUser2.image = UIImage(named : "Ninja Play")
        }
        else if classe2 == "Assassin" {
            imageUser2.image = UIImage(named : "Assassin Play")
        }
        else if classe2 == "Geant" {
            imageUser2.image = UIImage(named : "Geant Play")
        }
        else if classe2 == "Gobelin" {
            imageUser2.image = UIImage(named : "Gobelin Play")
        }
        else if classe2 == "Viking" {
            imageUser2.image = UIImage(named : "Viking Choix")
        }
    }
    //Load Special Attack
    func loadingButtonSpecial() {
        if classe1 == "Guerrier" {
            SpecialAttaqueButton1.setTitle("Bouclier Incontrollable", for: .normal)
        }
        else if classe1 == "Archer" {
            SpecialAttaqueButton1.setTitle("Fleche Magique", for: .normal)
        }
        else if classe1 == "Mage" {
            SpecialAttaqueButton1.setTitle("Potion de Soin", for: .normal)
        }
        else if classe1 == "Ninja" {
            SpecialAttaqueButton1.setTitle("Camouflage", for: .normal)
        }
        else if classe1 == "Assassin" {
            SpecialAttaqueButton1.setTitle("Dague Empoisonnée", for: .normal)
        }
        else if classe1 == "Geant" {
            SpecialAttaqueButton1.setTitle("Coup Dévastateur", for: .normal)
        }
        else if classe1 == "Gobelin" {
            SpecialAttaqueButton1.setTitle("Flechette Endormissante", for: .normal)
        }
        else if classe1 == "Viking" {
            SpecialAttaqueButton1.setTitle("Brise Heaume", for: .normal)
        }
        //For the image of User2
        if classe2 == "Guerrier" {
            SpecialAttaqueButton2.setTitle("Bouclier Incontrollable", for: .normal)
        }
        else if classe2 == "Archer" {
            SpecialAttaqueButton2.setTitle("Fleche Magique", for: .normal)
        }
        else if classe2 == "Mage" {
            SpecialAttaqueButton2.setTitle("Potion de Soin", for: .normal)
        }
        else if classe2 == "Ninja" {
            SpecialAttaqueButton2.setTitle("Camouflage", for: .normal)
        }
        else if classe2 == "Assassin" {
            SpecialAttaqueButton2.setTitle("Dague Empoisonnée", for: .normal)
        }
        else if classe2 == "Geant" {
            SpecialAttaqueButton2.setTitle("Coup Dévastateur", for: .normal)
        }
        else if classe2 == "Gobelin" {
            SpecialAttaqueButton2.setTitle("Flechette Endormissante", for: .normal)
        }
        else if classe2 == "Viking" {
            SpecialAttaqueButton2.setTitle("Brise Heaume", for: .normal)
        }
    }
    func VerifyingIcons() {
        if SpecialGuerrier1 == true {
            IconBouclier1.isHidden = false
        }
        else {
            IconBouclier1.isHidden = true
        }
        if SpecialGuerrier2 == true {
            IconBouclier2.isHidden = false
        }
        else {
            IconBouclier2.isHidden = true
        }
        if poison1 == true {
            IconPoison2.isHidden = false
        }
        else {
            IconPoison2.isHidden = true
        }
        if poison2 == true {
            IconPoison1.isHidden = false
        }
        else {
            IconPoison1.isHidden = true
        }
        if PasseSonTour1 == true {
            IconEndormis1.isHidden = false
        }
        else {
            IconEndormis1.isHidden = true
        }
        if PasseSonTour2 == true {
            IconEndormis2.isHidden = false
        }
        else {
            IconEndormis2.isHidden = true
        }
    }
    //Interraction for actions of User 1 and 2
    //
    //User 1
    @IBAction func ActionAttaquer1(_ sender: Any) {
        ControllRound()
        RoundOfWho()
        VerificationPassifArcher1()
        attaquerUser2()
        MusicChoosing1()
        LoadValues()
        //And when everything is clear, do this :
        verifyWin()
    }
    @IBAction func ActionAmeliorer1(_ sender: Any) {
        ControllRound()
        RoundOfWho()
        ameliorerWeapon1()
        bruitAmelioration.play()
        LoadValues()
        //And when everything is clear, do this :
        verifyWin()
    }
    @IBAction func ActionAttaqueSpeciale1(_ sender: Any) {
        ControllRound()
        RoundOfWho()
        if classe1 == "Assassin" {
            PoisonAssassin1()
        }
        else {
            attaqueSpecial1()
        }
        bruitSpecial.play()
        LoadValues()
        //And when everything is clear, do this :
        verifyWin()
        IsUsedVerification()
    }
    //User 2
    @IBAction func ActionAttaquer2(_ sender: Any) {
        RoundOfWho()
        ControllRound()
        VerificationPassifArcher2()
        attaquerUser1()
        MusicChoosing2()
        LoadValues()
        //And when everything is clear, do this :
        verifyWin()
    }
    @IBAction func ActionAmeliorer2(_ sender: Any) {
        RoundOfWho()
        ControllRound()
        ameliorerWeapon2()
        bruitAmelioration.play()
        LoadValues()
        //And when everything is clear, do this :
        verifyWin()
    }
    @IBAction func ActionAttaqueSpeciale2(_ sender: Any) {
        ControllRound()
        RoundOfWho()
        if classe2 == "Assassin" {
            PoisonAssassin2()
        }
        else {
            attaqueSpecial2()
        }
        bruitSpecial.play()
        LoadValues()
        //And when everything is clear, do this :
        verifyWin()
        IsUsedVerification()
    }
    //
    //Controll passives, specials and others
    func ControllRound() {
        if TourUser == 1 { // Si c'est le tour du Joueur 1
            //Passives
            VerificationPassifViking1()
            VerificationPassifGobelin1()
            //Specials
            VerificationPoisonUser1()
            VerificationFlechetteGobelin2()
            //others
            round = round + 1
            VerifyingIcons()
        }
        else if TourUser == 2 { //Si c'est le Tour du Joueur 2
            //Passives
            VerificationPassifViking2()
            VerificationPassifGobelin2()
            //Specials
            VerificationPoisonUser2()
            VerificationFlechetteGobelin1()
            //others
            round = round + 1
            VerifyingIcons()
        }
    }
    //Controll of the acess controll of rounds
    //
    func RoundOfWho() {
        if TourUser == 1 {
            if (PasseSonTour2 == true) {
                Joueur1.textColor = UIColor.blue
                Joueur2.textColor = UIColor.white
                ScreenUser2.isUserInteractionEnabled = false
                ScreenUser1.isUserInteractionEnabled = true
                PasseSonTour2 = false
                TourUser = 1
            }
            else {
                Joueur2.textColor = UIColor.red
                Joueur1.textColor = UIColor.white
                ScreenUser1.isUserInteractionEnabled = false
                ScreenUser2.isUserInteractionEnabled = true
                TourUser = 2
            }
        }
        else if TourUser == 2 {
            if (PasseSonTour1 == true) {
                Joueur2.textColor = UIColor.red
                Joueur1.textColor = UIColor.white
                ScreenUser1.isUserInteractionEnabled = false
                ScreenUser2.isUserInteractionEnabled = true
                PasseSonTour1 = false
                TourUser = 2
            }
            else {
                Joueur1.textColor = UIColor.blue
                Joueur2.textColor = UIColor.white
                ScreenUser2.isUserInteractionEnabled = false
                ScreenUser1.isUserInteractionEnabled = true
                TourUser = 1
            }
        }
    }
    //
    //function for the reloading of the values every round
    func LoadValues() {
        //User 1
            //Graphic (storyboard)
        hp1Graphic.value = hp1
        hp1Script.text = "hp : \(hp1)"
        dammage1Script.text = " Dommage : \(dammage1)"
        //Loading random values
        TranquilissantArcher1 = Float.random(in : 0...100)
        gainHpMage1 = Float.random(in: 0...100)
        drainAssassin1 = Float.random(in: 0...100)
        EsquiveNinja1 = Float.random(in : 0...100)
        //User 2
            //Graphic (storyboard)
        hp2Graphic.value = hp2
        hp2Script.text = "hp : \(hp2)"
        dammage2Script.text = " Dommage : \(dammage2)"
            //Loading random values
        TranquilissantArcher2 = Float.random(in : 0...100)
        gainHpMage2 = Float.random(in: 0...100)
        drainAssassin2 = Float.random(in: 0...100)
        EsquiveNinja2 = Float.random(in : 0...100)
    }
    //Verification of the accessibility and the proprety of Attack Special Button
    func IsUsedVerification() {
        if (IsUsedGuerrier1 == 0) || (IsUsedArcher1 == 0) || (IsUsedMage1 == 0) || (IsUsedNinja1 == 0) || (IsUsedAssassin1 == 0) || (IsUsedGeant1 == 0) || (IsUsedGobelin1 == 0) || (IsUsedViking1 == 0) {
            SpecialAttaqueButton1.isHidden = true
            SpecialAttaqueButton1.isEnabled = false
        }
        if (IsUsedGuerrier2 == 0) || (IsUsedArcher2 == 0) || (IsUsedMage2 == 0) || (IsUsedNinja2 == 0) || (IsUsedAssassin2 == 0) || (IsUsedGeant2 == 0) || (IsUsedGobelin2 == 0) || (IsUsedViking2 == 0) {
            SpecialAttaqueButton2.isHidden = true
            SpecialAttaqueButton2.isEnabled = false
        }
    }
    //              ----WEAPON----
    //Fonctions pour les actions et les modifications
    //Anciennement mise dans une classe Weapon qui a disparu a cause de bug (optionnal values)
    //
    //
    //Définition des dégats en fonction de la classe du User 1
    //Aucune sortie
    func choiceWeaponUser1() {
        if (classe1 == "Guerrier") {
            dammage1 = 12
        }
        else if (classe1 == "Archer") {
            dammage1 = 12
        }
        else if (classe1 == "Mage") {
            dammage1 = 15
        }
        else if (classe1 == "Ninja") {
            dammage1 = 18
        }
        else if (classe1 == "Assassin") {
            dammage1 = 14
        }
        else if (classe1 == "Geant") {
            dammage1 = 15
        }
        else if (classe1 == "Gobelin") {
            dammage1 = 10
        }
        else if (classe1 == "Viking") {
            dammage1 = 16
        }
        else {
            dammage1 = 10
        }
    }
    //Définition des dégats en fonction de la classe du User 2
    //Aucune sortie
    func choiceWeaponUser2() {
        if (classe2 == "Guerrier") {
            dammage2 = 12
        }
        else if (classe2 == "Archer") {
            dammage2 = 12
        }
        else if (classe2 == "Mage") {
            dammage2 = 15
        }
        else if (classe2 == "Ninja") {
            dammage2 = 18
        }
        else if (classe2 == "Assassin") {
            dammage2 = 14
        }
        else if (classe2 == "Geant") {
            dammage2 = 15
        }
        else if (classe2 == "Gobelin") {
            dammage2 = 10
        }
        else if (classe2 == "Viking") {
            dammage2 = 16
        }
    }
    //
    //Amélioration de chacune des armes en fonction des classes
    //
    func ameliorerWeapon1() {
        if (classe1 == "Guerrier") {
            dammage1 = dammage1 + 10
        }
        else if (classe1 == "Archer") {
            dammage1 = dammage1 + 12
        }
        else if (classe1 == "Mage") {
            dammage1 = dammage1 + 14
            if (classe1 == "Mage") && (gainHpMage1 <= 50) { //Passif du Mage
                InterractionToUser1.text = "Grace à votre passif, vous regagnez de la vie : + 15 hp et vous gagnez de l'attaque également"
                hp1 = hp1 + 15
            }
            else {
                InterractionToUser1.text = "Vous avez décidé d'augmenter votre attaque ! Vous etes desormais a \(dammage1) mais vous ne gagnez pas d'hp ! "
            }
        }
        else if (classe1 == "Ninja") {
            dammage1 = dammage1 + 15
        }
        else if (classe1 == "Assassin") {
            dammage1 = dammage1 + 12
        }
        else if (classe1 == "Geant") {
            dammage1 = dammage1 + 7
        }
        else if (classe1 == "Gobelin") {
            dammage1 = dammage1 + 5
        }
        else if (classe1 == "Viking") {
            dammage1 = dammage1 + 6
        }
        if classe1 != "Mage" {
            InterractionToUser1.text = "Vous avez décidé d'augmenter votre attaque ! Vous etes desormais a \(dammage1)"
        }
        InterractionToUser2.text = "Votre adversairre a améliorer son attaque !"
    }
    //Amélioration de chacune des armes en fonction des classes !
    //Aucune sortie
    func ameliorerWeapon2() {
        if (classe2 == "Guerrier") {
            dammage2 = dammage2 + 10
        }
        else if (classe2 == "Archer") {
            dammage2 = dammage2 + 12
        }
        else if (classe2 == "Mage") {
            dammage2 = dammage2 + 14
            if (classe2 == "Mage") && (gainHpMage2 <= 50) { //Passif du Mage
                InterractionToUser2.text = "Grace à votre passif, vous regagnez de la vie : + 15 hp et vous gagnez de l'attaque également : +14"
                hp2 = hp2 + 15
            }
            else {
                InterractionToUser2.text = "Vous avez décidé d'augmenter votre attaque ! Vous etes desormais a \(dammage2) mais vous ne gagnez pas d'hp ! "
            }
        }
        else if (classe2 == "Ninja") {
            dammage2 = dammage2 + 15
        }
        else if (classe2 == "Assassin") {
            dammage2 = dammage2 + 12
        }
        else if (classe2 == "Geant") {
            dammage2 = dammage2 + 7
        }
        else if (classe2 == "Gobelin") {
            dammage2 = dammage2 + 5
        }
        else if (classe2 == "Viking") {
            dammage2 = dammage2 + 6
        }
        if classe2 != "Mage" {
            InterractionToUser2.text = "Vous avez décidé d'augmenter votre attaque ! Vous etes desormais a \(dammage2)"
        }
        InterractionToUser1.text = "Votre adversairre a améliorer son attaque !"
    }
    //
    //Attaque le joueur 2 et vérification des passifs et attaques spéciales du joueur 2 et du joueur 1
    //Aucune sortie
    func attaquerUser2 () {
        InterractionToUser1.text = "Vous avez décider d'attaquer."
        if (poison1 == true) && (hp1 <= 50) && (drainAssassin1 <= 50) { // Vérification Passif Assassin
            InterractionToUser1.text = InterractionToUser1.text + " Le drain de vie a fonctionnée ! Vous regagnez 25 hp et inligez des dégats a votre adverssaire !"
            hp1 = hp1 + 25
            if (SpecialGuerrier2 == true) {
                InterractionToUser2.text = "Votre bouclier a été brisé, vous subissez tout de meme 5 dégats de poison ..."
                hp2 = hp2 - 5
                SpecialGuerrier2 = false
            }
            else if (SpecialNinja2 == true) {
                InterractionToUser2.text = "Votre Camouflage a été désactivé, aucun dommage recu !"
                SpecialNinja2 = false
            }
            else {
                InterractionToUser2.text = "Vous subissez 1O dégats "
                hp2 = hp2 - 10
            }
        }
        else if (SpecialGuerrier2 == true) { //Verification Spécial Guerrier
            hp2 = hp2 - dammage1 / 2
            SpecialGuerrier2 = false
            InterractionToUser1.text = InterractionToUser1.text + " Vous avez détruit le bouclier de votre adverssaire !"
            InterractionToUser2.text = "Votre bouclier a été brisé, dommage divisé par deux !"
        }
        else if (SpecialNinja2 == true) { //Vérification Spécial Ninja
            hp2 = hp2 - 0
            SpecialNinja2 = false
            InterractionToUser1.text = InterractionToUser1.text + "Vous avez désactivé le Camouflage de votre adverssaire !"
            InterractionToUser2.text = "Votre Camouflage a été désactivé, aucun dommage recu !"
        }
        else if (classe2 == "Ninja") && (hp2 <= 45) && (EsquiveNinja2 <= 33.33) { //Vérification du passif du joueur 2 si classe Ninja
            InterractionToUser1.text = InterractionToUser1.text + "Oh nan ! Votre adverssaire l'a esquivé grace à son passif !"
            InterractionToUser2.text = "Vous avez esquivé l'attaque grace a votre passif !"
        }
        else {
            if (classe1 == "Geant") && (hp1 <= 50) { //Verification du passif du joueur 1 si classe géant
                InterractionToUser1.text = InterractionToUser1.text + " Votre rage est intense ! Dommage multiplié par Deux !"
                if SpecialGuerrier2 == true {
                    hp2 = hp2 - dammage1
                    InterractionToUser2.text = "Dommage divisé par deux, \(dammage1) dommages recus et bouclier brisé pour l'adverssaire"
                    SpecialGuerrier2 = false
                }
                else if (classe2 == "Guerrier") {
                    hp2 = hp2 - 1.8 * dammage1
                    InterractionToUser2.text = "Vous avez subi d'immense dommage mais moins que prévu grace à votre passif"
                }
                else if (SpecialNinja2 == true) {
                    hp2 = hp2 - 0
                    SpecialNinja2 = false
                    InterractionToUser1.text = InterractionToUser1.text + " Malheureusement, votre attaque a été esquivé par l'adverssaire"
                    InterractionToUser2.text = "Camouflage desactivé, aucun dommage recu"
                }
                else {
                    hp2 = hp2 - 2 * dammage1
                    InterractionToUser2.text = "Vous avez subi d'immense dommage"
                }
            }
            else { //Si aucune des conditions précédentes sont remplies alors :
                if (classe2 == "Guerrier") { //toujours passif du guerrier
                    hp2 = hp2 - 0.9 * dammage1
                    InterractionToUser2.text = "Vous avez subi moins de dommage que prévu grace à votre passif"
                }
                else { // et enfin on attaque normalement
                    hp2 = hp2 - dammage1
                    InterractionToUser2.text = "Vous avez subi de sacré dommage : \(dammage1)"
                }
            }
        }
    }
    //
    //Attaque le joueur 1 et vérification des passifs et attaques spéciales du joueur 1 et 2
    //Aucune sortie
    func attaquerUser1 () {
        InterractionToUser2.text = "Vous avez décider d'attaquer."
        if (poison2 == true) && (hp2 <= 50) && (drainAssassin2 <= 50) { // Vérification Passif Assassin
            InterractionToUser2.text = InterractionToUser2.text + " Le drain de vie a fonctionnée ! Vous regagnez 25 hp et inligez des dégats a votre adverssaire !"
            hp2 = hp2 + 25
            if (SpecialGuerrier1 == true) {
                InterractionToUser1.text = "Votre bouclier a été brisé, vous subissez tout de meme 5 dégats de poison ..."
                hp1 = hp1 - 5
                SpecialGuerrier1 = false
            }
            else if (SpecialNinja1 == true) {
                InterractionToUser1.text = "Votre Camouflage a été désactivé, aucun dommage recu !"
                SpecialNinja1 = false
            }
            else {
                InterractionToUser1.text = "Vous subissez 1O dégats "
                hp1 = hp1 - 10
            }
        }
        else if (SpecialGuerrier1 == true) { //Verification Spécial Guerrier
            hp1 = hp1 - dammage2 / 2
            SpecialGuerrier1 = false
            InterractionToUser1.text = InterractionToUser2.text + " Vous avez détruit le bouclier de votre adverssaire !"
            InterractionToUser1.text = "Votre bouclier a été brisé, dommage divisé par deux !"
        }
        else if (SpecialNinja1 == true) { //Vérification Spécial Ninja
            hp1 = hp1 - 0
            SpecialNinja1 = false
            InterractionToUser2.text = InterractionToUser2.text + "Vous avez désactivé le Camouflage de votre adverssaire !"
            InterractionToUser1.text = "Votre Camouflage a été désactivé, aucun dommage recu !"
        }
        else if (classe1 == "Ninja") && (hp1 <= 45) && (EsquiveNinja1 <= 33.33) { //Vérification du passif du joueur 2 si classe Ninja
            InterractionToUser2.text = InterractionToUser2.text + "Oh nan ! Votre adverssaire l'a esquivé grace à son passif !"
            InterractionToUser1.text = "Vous avez esquivé l'attaque grace a votre passif !"
        }
        else if (classe2 == "Archer") { //Passif de l'Archer
            if (TranquilissantArcher2 <= 33.33) {
                hp1 = hp1 - 15
                PasseSonTour1 = true
                InterractionToUser2.text = InterractionToUser2.text + " Oh ! Le tranquilisant a fonctionné !"
                InterractionToUser1.text = "Vous avez perdu 15 hp et passez votre tour une fois"
            }
            else {
                if (classe1 == "Guerrier") { //Verification du passif du joueur 2 si classe guerrier
                    hp1 = hp1 - 0.9 * dammage2
                    InterractionToUser1.text = "Vous avez subi de sacré dommage mais moins que prévu grace à votre passif"
                }
                else {
                    hp1 = hp1 - dammage2
                    InterractionToUser1.text = " Vous avez subi de sacré dommage : \(dammage2)"
                }
            }
        }
        else {
            if (classe2 == "Geant") && (hp2 <= 50) { //Verification du passif du joueur 1 si classe géant
                InterractionToUser2.text = InterractionToUser2.text + " Votre rage est intense ! Dommage multiplié par Deux !"
                if (SpecialGuerrier1 == true) {
                    hp1 = hp1 - dammage2
                    InterractionToUser1.text = "Dommage divisé par deux, \(dammage2) dommages recus et bouclier brisé pour l'adverssaire"
                    SpecialGuerrier1 = false
                }
                else if (classe1 == "Guerrier") {
                    hp1 = hp1 - 1.8 * dammage2
                    InterractionToUser1.text = "Vous avez subi d'immense dommage mais moins que prévu grace à votre passif"
                }
                else if (SpecialNinja1 == true) {
                    hp1 = hp1 - 0
                    SpecialNinja1 = false
                    InterractionToUser2.text = InterractionToUser2.text + " Malheureusement, votre attaque a été esquivé par l'adverssaire"
                    InterractionToUser1.text = "Camouflage desactivé, aucun dommage recu"
                }
                else {
                    hp1 = hp1 - 2 * dammage2
                    InterractionToUser1.text = "Vous avez subi d'immense dommage"
                }
            }
            else { //Si aucune des conditions précédentes sont remplies alors :
                if (classe1 == "Guerrier") { //toujours passif du guerrier
                    hp1 = hp1 - 0.9 * dammage2
                    InterractionToUser1.text = "Vous avez subi moins de dommage que prévu grace à votre passif"
                }
                else { // et enfin on attaque normalement
                    hp1 = hp1 - dammage2
                    InterractionToUser1.text = "Vous avez subi de sacré dommage : \(dammage2)"
                }
            }
        }
    }
    //
    //Attaque spéciale des différentes classes du User1
    //Aucune sortie
    func attaqueSpecial1() {
        if (classe1 == "Viking") && (IsUsedViking1 > 0) {
            InterractionToUser1.text = "Vous avez utilisé votre attaque spécial : Brise Heaume, Attaque Inesquivable et Inarétable !"
            if (hp1 >= 80) {
                hp2 = hp2 - 10
                InterractionToUser2.text = "Vous subissez 10 dégats"
            }
            else if (hp1 < 80) && (hp1 > 40) {
                hp2 = hp2 - 25
                InterractionToUser2.text = "Vous subissez 25 dégats"
            }
            else {
                hp2 = hp2 - 40
                InterractionToUser2.text = "Vous subissez 40 dégats"
            }
            SpecialGuerrier2 = false
            SpecialNinja2 = false
            IsUsedViking1 = IsUsedViking1 - 1
        }
        else if (classe1 == "Guerrier") && (IsUsedGuerrier1 > 0) { //Attaque Spécial du Joueur 1 si classe Guerrier
            IsUsedGuerrier1 = IsUsedGuerrier1 - 1
            hp1 = hp1 + 15
            dammage1 = dammage1 + 6
            SpecialGuerrier1 = true
            InterractionToUser1.text = "Vous avez utilisé son attaque spécial : Le Bouclier Incontrolable, + 15hp, +6 dégats et 50% de dommage en moins"
            InterractionToUser2.text = "Votre adverssaire a utilisé son Bouclier Incontrollable, Prenez garde !"
        }
        else if (classe1 == "Archer") && (IsUsedArcher1 > 0) { //Attaque Spécial du Joueur 2 si classe Archer
            IsUsedArcher1 = IsUsedArcher1 - 1
            InterractionToUser1.text = "Vous avez utilisé l'attaque spécial : Fleche Magique ! "
            if SpecialNinja2 == true { //Verification du camouflage du joueur 2
                hp2 = hp2 - 0
                InterractionToUser1.text = InterractionToUser1.text + "Votre fleche magique a été esquivée"
                InterractionToUser2.text = "Le camouflage a arrété la flèche magique !!"
                SpecialNinja2 = false
            }
            else if (classe2 == "Ninja") && (hp2 <= 45) && (EsquiveNinja2 <= 33.33) { // Verification de l'esquive du joueur 2
                InterractionToUser1.text = InterractionToUser1.text + "Votre fleche magique a été esquivée"
                InterractionToUser2.text = "Flèche magique esquivée !"
            }
            else if (SpecialGuerrier2 == true) { // Vérification du bouclier du joueur 2 si classe Guerrier
                hp2 = hp2 - dammage1
                InterractionToUser1.text = InterractionToUser1.text + "Les dégats ont été réduit -50%, Bouclier de l'adverssaire détruire !"
                InterractionToUser2.text = "Le bouclier a arrété une partie des dégats de la flèche magique ! Dégat subis \(dammage1)"
            }
            else if (classe2 == "Guerrier") { // Verification du passif du joueur 2 si classe Guerrier
                hp2 = hp2 - 1.8 * dammage1
                InterractionToUser2.text = "Vous avez arrété une partie des dégats grace a votre passif !"
            }
            else { // si aucune des conditions ne sont pas respéctés alors on attaque normalement
                hp2 = hp2 - dammage1*2
                InterractionToUser2.text = "Vous subissez l'attaque de plein fouet "
            }
        }
        else if (classe1 == "Mage") && (IsUsedMage1 >= 0) { // Attaque Spécial du Mage
            IsUsedMage1 = IsUsedMage1 - 1
            hp1 = hp1 + 40
            InterractionToUser1.text = "Vous avez utilisé votre attaque spécial : Potion Magique, + 40 hp"
            InterractionToUser2.text = "Votre adverssaire a utilisé sa potion magique"
        }
        else if (classe1 == "Ninja") && (IsUsedNinja1 > 0) { // Attaque Spécial du Ninja
            IsUsedNinja1 = IsUsedNinja1 - 1
            SpecialNinja1 = true
            InterractionToUser1.text = "Camouflage Activé !! Vous obtenez 20 hp, 5 de dégats en plus, serez invisible et ne recevrez pas de dommage tant que le camoulfage est actif !"
            InterractionToUser2.text = "Votre adverssaire a utilisé son camouflage, il est invisible jusqu'a qu'il subisse des dégats"
            hp1 = hp1 + 20
            dammage1 = dammage1 + 5
        }
        else if (classe1 == "Geant") && (IsUsedGeant1 > 0) { // Attaque Spécial du Géant
            InterractionToUser1.text = "Vous avez utilisé votre attaque spécial : Poing de la destruction"
            if SpecialNinja2 == true { // Verification camouflage
               InterractionToUser2.text = "Aucun Dégats subis. Le camouflage est désormais desactivé !"
                SpecialNinja2 = false
            }
            else if (classe2 == "Ninja") && (hp2 <= 45) && (EsquiveNinja2 <= 33.33) { // Verification passif Ninja
                InterractionToUser2.text = "Dégats du Poings de la destruction esquivée ! Aucun dégats ont été recu"
            }
            else if (SpecialGuerrier2 == true) { // Verification attaque spécial du guerrier
                hp2 = hp2 - SpecialGeant1 / 2
                InterractionToUser2.text = "Dégats diviser par deux ! Vous subissez 13 dégats"
            }
            else if (classe2 == "Guerrier") { // Verification passif du Guerrier
                hp2 = hp2 - SpecialGeant1 * 0.9
                hp1 = hp1 - ReturnSpecialGeant1
                InterractionToUser2.text = "Vous subissez moins de dégats grace à votre passif"
            }
            else {
                hp2 = hp2 - SpecialGeant1
                hp1 = hp1 - ReturnSpecialGeant1
                InterractionToUser2.text = "Vous subissez 25 dégats"
            }
            InterractionToUser1.text = InterractionToUser1.text + "Vos poings ont frappés forts ! Vous avez tellement tapé fort que vous subissez des dommages ! -\(ReturnSpecialGeant1) hp"
            ReturnSpecialGeant1 = ReturnSpecialGeant1 + 10
            IsUsedGeant1 = IsUsedGeant1 - 1
        }
        else if (classe1 == "Gobelin")&&(IsUsedGobelin1 > 0) {
            IsUsedGobelin1 = IsUsedGobelin1 - 1
            InterractionToUser1.text = "Vous avez utilisé votre attaque Spécial : Fléchette Endormissante ! "
            if SpecialNinja2 == true {
                InterractionToUser2.text = "Fléchette esquivée mais votre camouflage a été désactivé"
                SpecialNinja2 = false
            }
            else if (classe2 == "Ninja") && (hp2 <= 45) && (EsquiveNinja2 <= 33.33) { // Verification passif Ninja
                InterractionToUser2.text = "Fléchette esquivée grace a votre passif !"
            }
            else {
                InterractionToUser1.text = InterractionToUser1.text + "La Flechette a fait effet ! "
                SpecialGobelin1 = true
                InterractionToUser2.text = "Vous resterez endormi pendant deux tours"
            }
        }
    }
    //
    //Attaque spéciale des différentes classes du User2
    //Aucune sortie
    func attaqueSpecial2() {
        if (classe2 == "Viking") && (IsUsedViking2 > 0) {
            InterractionToUser2.text = "Vous avez utilisé votre attaque spécial : Brise Heaume ! Attaque inesquivable et inarétable !"
            if (hp2 >= 80) {
                hp1 = hp1 - 10
                InterractionToUser1.text = "Vous subissez 10 dégats"
            }
            else if (hp2 < 80) && (hp2 > 40) {
                hp1 = hp1 - 25
                InterractionToUser1.text = "Vous subissez 25 dégats"
            }
            else {
                hp1 = hp1 - 40
                InterractionToUser1.text = "Vous subissez 40 dégats"
            }
            SpecialGuerrier1 = false
            SpecialNinja1 = false
            IsUsedViking2 = IsUsedViking2 - 1
        }
        else if (classe2 == "Guerrier") && (IsUsedGuerrier1 > 0) {
            IsUsedGuerrier2 = IsUsedGuerrier2 - 1
            hp2 = hp2 + 15
            dammage2 = dammage2 + 6
            SpecialGuerrier2 = true
            InterractionToUser2.text = "Vous avez utilisé son attaque spécial : Le Bouclier Incontrolable ! +15hp, +6 dégats et 50% de dommage en moins à la prochaine attaque"
            InterractionToUser1.text = "Votre adverssaire a utilisé son Bouclier Incontrollable, Prenez garde !"
        }
        else if (classe2 == "Archer") && (IsUsedArcher1 > 0) {
            IsUsedArcher2 = IsUsedArcher2 - 1
           InterractionToUser2.text = "Vous avez utilisé l'attaque spécial : Fleche Magique ! "
            if SpecialNinja1 == true {
                InterractionToUser2.text = InterractionToUser2.text + "Votre fleche magique a été esquivée"
                InterractionToUser1.text = "Le camouflage a empéché la flèche magique de vous atteindre !"
            }
            else if (classe1 == "Ninja") && (hp1 <= 45) && (EsquiveNinja1 <= 33.33) {
                InterractionToUser2.text = InterractionToUser2.text + "Votre fleche magique a été esquivée"
                InterractionToUser1.text = "Vous avez esquivé la flèche magique !"
            }
            else if (SpecialGuerrier1 == true) {
                hp1 = hp1 - dammage2
                InterractionToUser2.text = InterractionToUser2.text + "Les dégats ont été réduit -50%, Bouclier de l'adverssaire détruire !"
                InterractionToUser1.text = "Le bouclier incontrolable a arrété la flèche magique ! Dégat subis : \(dammage2)"
            }
            else if (classe1 == "Guerrier"){
                hp1 = hp1 - 1.8 * dammage2
                InterractionToUser1.text = "Votre passif a arrété une partie des dégats !"
            }
            else {
                hp1 = hp1 - dammage2 * 2
                InterractionToUser1.text = "Vous subissez l'attaque de plein fouet"
            }
        }
        else if (classe2 == "Mage") && (IsUsedMage2 > 0) {
            IsUsedMage2 = IsUsedMage2 - 1
            hp2 = hp2 + 40
            InterractionToUser2.text = "Vous avez utilisé votre attaque spécial : Potion Magique, +40 hp"
            InterractionToUser1.text = "Votre adverssaire a utilisé sa potion magique"
        }
        else if (classe2 == "Ninja") && (IsUsedNinja1 > 0) {
            IsUsedNinja2 = IsUsedNinja2 - 1
            SpecialNinja2 = true
            InterractionToUser2.text = "Camouflage Activé !! + 20 hp, +5 de dégats, vous serez invisible et ne recevrez pas de dommage tant que son camoulfage sera actif !"
            InterractionToUser1.text = "Votre adverssaire a utilisé son camouflage, il est invisible jusqu'a qu'il subisse des dégats"
            hp2 = hp2 + 20
            dammage2 = dammage2 + 5
        }
        else if (classe2 == "Geant") && (IsUsedGeant2 > 0) {
            InterractionToUser2.text = "Vous avez utilisé votre attaque spécial : Poing de la destruction"
            if SpecialNinja1 == true {
                InterractionToUser1.text = "Aucun Dégats subis"
            }
            else if (classe1 == "Ninja") && (hp1 <= 45) && (EsquiveNinja1 <= 33.33) {
                InterractionToUser1.text = "Dégats du Poings de la destruction esquivée ! Aucun dégats ont été recu"
            }
            else if (SpecialGuerrier1 == true) { // Verification attaque spécial du guerrier
                hp1 = hp1 - SpecialGeant2 / 2
               InterractionToUser1.text = "Dégats diviser par deux ! Vous subissez \(SpecialGeant1/2)"
            }
            else if (classe1 == "Guerrier") { // Verification passif du Guerrier
                hp1 = hp1 - SpecialGeant2 * 0.9
                hp2 = hp2 - ReturnSpecialGeant2
                InterractionToUser1.text = "Vous subissez moins de dégats grace avotre passif"
            }
            else {
                hp1 = hp1 - SpecialGeant2
                hp2 = hp2 - ReturnSpecialGeant2
                InterractionToUser1.text = "Vous subissez 25 dégats"
            }
            InterractionToUser2.text = InterractionToUser2.text + "Vos poings ont frappés forts ! Vous avez tellement tapé fort que vous subissez des dommages ! -\(ReturnSpecialGeant2) hp"
            ReturnSpecialGeant2 = ReturnSpecialGeant2 + 10
            IsUsedGeant2 = IsUsedGeant2 - 1
        }
        else if (classe2 == "Gobelin") && (IsUsedGobelin2 > 0) {
            IsUsedGobelin2 = IsUsedGobelin2 - 1
            InterractionToUser2.text = "Vous avez utilisé votre attaque Spécial : Fléchette Endormissante ! "
            if SpecialNinja1 == true {
                InterractionToUser1.text = "Fléchette esquivée mais camouflage desactivée"
                SpecialNinja1 = false
            }
            else if (classe1 == "Ninja") && (hp1 <= 45) && (EsquiveNinja1 <= 33.33) { // Verification passif Ninja
                InterractionToUser1.text = "Fléchette esquivée grace a votre passif"
            }
            else {
                InterractionToUser2.text = InterractionToUser2.text + "La fléchette a touché sa cible !"
                InterractionToUser1.text = "Vous resterez endormi pendant deux tours"
                SpecialGobelin2 = true
            }
        }
    }
    //
    func PoisonAssassin1() { //Fonction pour le poison de l'assassin du User 2
        if (poison1 == false) {
            if (classe2 == "Guerrier") {
                InterractionToUser2.text = "Le poison a fait son effet, perte de \(poisontime1 * 0.9) hp grace à votre passif. Perte de dégats successifs pendant 6 tours !"
                hp2 = hp2 - poisontime1 * 0.9
            }
            else {
                InterractionToUser2.text =  "Le poison fait son effet, perte de \(poisontime1) hp  et perte de dégats successifs pendant 6 tours !"
                hp2 = hp2 - poisontime1
            }
            poison1 = true
            IsUsedAssassin1 = IsUsedAssassin1 - 1
        }
        else if (poisontime1 < 3) {
            poison1 = false
        }
    }
   func PoisonAssassin2() { //Fonction pour le poison de l'assassin du User 1
        if (poison2 == false) {
            if (classe1 == "Guerrier") {
                InterractionToUser1.text = "Le poison a fait son effet, perte de \(poisontime2 * 0.9) hp grace à votre passif. Perte de dégats successifs pendant 6 tours !"
                hp1 = hp1 - poisontime2 * 0.9
            }
            else {
                InterractionToUser1.text = "Le poison fait son effet, perte de \(poisontime2) hp  et perte de dégats successifs pendant 6 tours !"
                hp1 = hp1 - poisontime2
            }
            poison2 = true
            IsUsedAssassin2 = IsUsedAssassin2 - 1
        }
        else if (poisontime2 < 3) {
            poison2 = false
        }
    }
    func VerificationPoisonUser1 () {
        if (poison2 == true) && (poisontime2 >= 3) {// Vérification de l'état du poison du User 1
            if (classe1 == "Guerrier") {
                poisontime2 = poisontime2 - 2
                hp1 = hp1 - poisontime2 * 0.9
                InterractionToUser2.text = "Dégat de poison subit  garce à votre passif ! -\(poisontime2 * 0.9)"
            }
            else {
                poisontime2 = poisontime2 - 2
                hp1 = hp1 - poisontime2
                InterractionToUser2.text = "Dégat de poison subit ! -\(poisontime1)"
            }
        }
    }
    func VerificationPoisonUser2 () {
        if (poison1 == true) && (poisontime1 >= 3) {// Vérification de l'état du poison du User 1
            if (classe2 == "Guerrier") {
                poisontime1 = poisontime1 - 2
                hp2 = hp2 - poisontime1 * 0.9
                InterractionToUser1.text = "Dégat de poison subit  garce à votre passif ! -\(poisontime1 * 0.9)"
            }
            else {
                poisontime1 = poisontime1 - 2
                hp2 = hp2 - poisontime1
                InterractionToUser1.text = "Dégat de poison subit ! -\(poisontime1)"
            }
        }
    }
    //Fonction qui vérifie Si la flechette du Gobelin est activé ou non et le passif du gobelin
    func VerificationFlechetteGobelin1() {
       //Le spécial du User 1
       if SpecialGobelin1 == true {
        InterractionToUser2.text = "Vous vennez de vous endormir et ce pour 2 tours !"
        RoundActuel1 = round + 2
        SpecialGobelin1 = false
        EndormisUser1 = true
        PasseSonTour2 = true
       }
       else if EndormisUser1 == true {
           if RoundActuel1 == round {
               PasseSonTour2 = false
               EndormisUser1 = false
               return
           }
           else {
            PasseSonTour2 = true
            InterractionToUser2.text = "Vous dormez profondémment !"
           }
       }
    }
    func VerificationFlechetteGobelin2 () {
        //Le spécial du User 2
        if (SpecialGobelin2 == true) {
            InterractionToUser1.text = "Vous vennez de vous endormir et ce pour 2 tours !"
            RoundActuel2 = round + 2
            SpecialGobelin2 = false
            EndormisUser2 = true
            PasseSonTour1 = true
        }
        else if (EndormisUser2 == true) {
            if (RoundActuel2 == round) {
                PasseSonTour1 = false
                EndormisUser2 = false
                return
            }
            else {
                PasseSonTour1 = true
                InterractionToUser1.text = "Vous dormez profondémment !"
            }
        }
    }
    //Passif Archer User 1
    func VerificationPassifArcher1() {
        if (classe1 == "Archer") && (TranquilissantArcher1 <= 33.33) {
            hp2 = hp2 - 15
            PasseSonTour2 = true
            InterractionToUser1.text = InterractionToUser1.text + " Oh ! Le tranquilisant a fonctionné !"
            InterractionToUser2.text = "Vous avez perdu 15 hp et passez votre tour une fois"
        }
    }
    func VerificationPassifArcher2() {
        if (classe2 == "Archer") && (TranquilissantArcher2 <= 33.33) {
            hp1 = hp1 - 15
            PasseSonTour1 = true
            InterractionToUser2.text = InterractionToUser2.text + " Oh ! Le tranquilisant a fonctionné !"
            InterractionToUser1.text = "Vous avez perdu 15 hp et passez votre tour une fois"
        }
    }
    func VerificationPassifGobelin1 () {
        //Le passif du joueur 1
        if (classe1 == "Gobelin") && (hp1 <= 40) && (PassifGobelin1 == true) {
            InterractionToUser1.text = "Vous etes enragé, vous volez l'attaque de votre adverssaire et l'aditionnez à la votre !"
            dammage1 = dammage2 + dammage1
            PassifGobelin1 = false
        }
        else {
            return
        }
    }
    func VerificationPassifGobelin2 () {
        //Le passif du joueur 2
        if (classe2 == "Gobelin") && (hp2 <= 40) && (PassifGobelin2 == true) {
            InterractionToUser2.text = "Vous etes enragé, vous volez l'attaque de votre adverssaire et l'aditionnez à la votre !"
            dammage2 = dammage1 + dammage2
            PassifGobelin2 = false
        }
        else {
            return
        }
    }
    //Verification du passif du User 1 si classe Viking
    func VerificationPassifViking1 () {
        if (classe1 == "Viking") && (dammage2 >= 35) && (PassifViking1 == true) {
            dammage1 = dammage1 * 1.5
            PassifViking1 = false
            InterractionToUser1.text = "Hache de Guerre activée , Vos dommages sont multipliés par 1.5"
        }
    }
    func VerificationPassifViking2 () {
        if (classe2 == "Viking") && (dammage1 >= 35) && (PassifViking2 == true) {
            dammage2 = dammage2 * 1.5
            PassifViking2 = false
            InterractionToUser2.text = "Hache de Guerre activée , Vos dommages sont multipliés par 1.5"
        }
    }
    //
    //Verification of the winner and redirection of players
    func verifyWin() {
        if hp1 <= 0 {
            StackViewPlay.isHidden = true
            StackViewPlay.isUserInteractionEnabled = false
            ReturnCharacterScreenButton.isHidden = false
            ReturnCharacterScreenButton.isEnabled = true
            WhoWin.text = "Le Joueur 2 a gagné !"
            bruitWin.play()
        }
        else if hp2 <= 0 {
            StackViewPlay.isHidden = true
            StackViewPlay.isUserInteractionEnabled = false
            ReturnCharacterScreenButton.isHidden = false
            ReturnCharacterScreenButton.isEnabled = true
            WhoWin.text = "Le Joueur 1 a gagné !"
            bruitWin.play()
        }
        else {
            return
        }
    }
}
