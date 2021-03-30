
//  Character.swift
//  TP-RPG
//
//  Created by Mateo lelong on 17/04/2020.
//  Copyright © 2020 Mateo Lelong. All rights reserved.
//

import Foundation

//Initialisation des variables globales
//Les classes des personnages
var classe1 : String = ""
var classe2 : String = ""
//Variable pour verifier si ils ont bien valider leur choix
var HaveVerified1 : Bool = false
var HaveVerified2 : Bool = false
//Controll round
var TourUser : Int = 1
//Les vies des deux joueurs
var hp1 : Float = 1
var hp2 : Float = 1
//Leurs dégats
var dammage1 : Float = 1
var dammage2 : Float = 1
//Passer le tour
var PasseSonTour1 : Bool = false
var PasseSonTour2 : Bool = false
//Systeme de round
var RoundActuel1 : Int = 0
var RoundActuel2 : Int = 0
//Les passifs
//User 1
var TranquilissantArcher1 : Float = 100
var gainHpMage1 : Float = Float.random(in : 0...100)
var EsquiveNinja1 : Float = Float.random(in: 0...100)
var PassifGobelin1 : Bool = true
var PassifViking1 : Bool = true
//User 2
var TranquilissantArcher2 : Float = 100
var gainHpMage2 : Float = Float.random(in : 0...100)
var EsquiveNinja2 : Float = Float.random(in: 0...100)
var PassifGobelin2 : Bool = true
var PassifViking2 : Bool = true
//Les attaques spéciales
//User 1
var SpecialGuerrier1 : Bool = false
var SpecialNinja1 : Bool = false
var SpecialGeant1 : Float = 25
var SpecialGobelin1 : Bool = false
var EndormisUser1 : Bool = false
var ReturnSpecialGeant1 : Float = 0
var IsUsedGuerrier1 : Int = 2
var IsUsedArcher1 : Int = 1
var IsUsedMage1 : Int = 2
var IsUsedNinja1 : Int = 1
var IsUsedAssassin1 : Int = 1
var IsUsedGeant1 : Int = 5
var IsUsedGobelin1 : Int = 1
var IsUsedViking1 : Int = 2
//User 2
var SpecialGuerrier2 : Bool = false
var SpecialNinja2 : Bool = false
var SpecialGeant2 : Float = 25
var SpecialGobelin2 : Bool = false
var EndormisUser2 : Bool = false
var ReturnSpecialGeant2 : Float = 0
var IsUsedGuerrier2 : Int = 2
var IsUsedArcher2 : Int = 1
var IsUsedMage2 : Int = 2
var IsUsedNinja2 : Int = 1
var IsUsedAssassin2 : Int = 1
var IsUsedGeant2 : Int = 5
var IsUsedGobelin2 : Int = 1
var IsUsedViking2 : Int = 2
//Pour l'assassin :
var poison1 : Bool = false
var poison2 : Bool = false
var poisontime1 : Float = 15
var poisontime2 : Float = 15
var drainAssassin1 : Float = Float.random(in : 0...100)
var drainAssassin2 : Float = Float.random(in : 0...100)
//Initialisation des tours
var round : Int = 0
//
//
//Initialisation des classes
//Creation d'une classe Character pour le personnage
class Character {
    func choiceclass1() {//Choix de la classe du User 1
        if (classe1 == "Guerrier") {
            hp1 = 130
        }
        else if (classe1 == "Archer") {
            hp1 = 100
        }
        else if (classe1 == "Mage") {
            hp1 = 85
        }
        else if (classe1 == "Ninja") {
            hp1 = 70
        }
        else if (classe1 == "Assassin") {
            hp1 = 110
        }
        else if (classe1 == "Geant") {
            hp1 = 150
        }
        else if (classe1 == "Gobelin") {
            hp1 = 140
        }
        else if (classe1 == "Viking") {
            hp1 = 120
        }
    }
    func choiceclass2() {//Choix de la classe du User 2
        if (classe2 == "Guerrier") {
            hp2 = 130
        }
        else if (classe2 == "Archer") {
            hp2 = 100
        }
        else if (classe2 == "Mage") {
            hp2 = 85
        }
        else if (classe2 == "Ninja") {
            hp2 = 70
        }
        else if (classe2 == "Assassin") {
            hp2 = 110
        }
        else if (classe2 == "Geant") {
            hp2 = 150
        }
        else if (classe2 == "Gobelin") {
            hp2 = 140
        }
        else if (classe2 == "Viking") {
            hp2 = 120
        }
    }
}
