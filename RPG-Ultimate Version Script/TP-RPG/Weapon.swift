//
//  Weapon.swift
//  TP-RPG
//
//  Created by Mateo lelong on 17/04/2020.
//  Copyright © 2020 Mateo Lelong. All rights reserved.
//

import Foundation

//
//Creation d'une class Weapon pour gérer les attaques et améliorations
//La classe gère aussi les attaques spéciales ainsi que certains attributs comme le poison et certains passifs
class Weapon {
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
    //Amélioration de chacune des armes en fonction des classes !
    //Aucune sortie
    func ameliorerWeapon1() {
        if (classe1 == "Guerrier") {
            dammage1 = dammage1 + 10
        }
        else if (classe1 == "Archer") {
            dammage1 = dammage1 + 12
        }
        else if (classe1 == "Mage") {
            dammage1 = dammage1 + 14
            gainHpMage1 = Float.random(in: 0...100)
            if (classe1 == "Mage") && (gainHpMage1 <= 50) { //Passif du Mage
                print("Grace à son passif," + name2 + " regagnez de la vie : 15 hp")
                hp1 = hp1 + 15
                print("Vie actuelle de " + name1 + " : \(hp1)")
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
        print("Vous avez décidez d'augmentez votre attaque !")
        print("Les nouveaux dommages de " + name1 + " sont : \(dammage1)")
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
            gainHpMage2 = Float.random(in: 0...100)
            if (classe2 == "Mage") && (gainHpMage2 <= 50) {
                print("Grace à son passif," + name2 + " regagnez de la vie : 15 hp")
                hp2 = hp2 + 15
                print("Vie actuelle de " + name2 + " : \(hp2)")
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
        print("Vous avez décidez d'augmentez votre attaque !")
        print("Les nouveaux dommages de " + name2 + " sont : \(dammage2)")
    }
    //
    //Attaque le joueur 2 et vérification des passifs et attaques spéciales du joueur 2 et du joueur 1
    //Aucune sortie
    func attaquerUser2 () {
        if (poison1 == true) && (hp1 <= 50) && (drainAssassin1 <= 50) { // Vérification Passif Assassin
            print("Le drain de vie a fonctionnée !")
            print(name1 + " regagne  : 25 hp")
            hp1 = hp1 + 25
            print("Vie actuelle de " + name1 + " \(hp1)")
            print("Vie actuelle de " + name2 + " \(hp2)")
            if (SpecialGuerrier2 == true) {
                print("Le bouclier a été brisé pour " + name2)
                print(name2 + " subit 5 dégats")
                hp2 = hp2 - 5
                SpecialGuerrier2 = false
            }
            else if (SpecialNinja2 == true) {
                print("Camouflage désactivé pour " + name2)
                print(name2 + " ne subit pas de dégats")
                SpecialNinja2 = false
            }
            else {
                print(name2 + " subit 1O dégats ")
                hp2 = hp2 - 10
            }
        }
        else if (SpecialGuerrier2 == true) { //Verification Spécial Guerrier
            hp2 = hp2 - dammage1 / 2
            SpecialGuerrier2 = false
            print("Le bouclier a été brisé pour " + name2)
            print("Dommage recu diviser par deux : \(dammage1/2)")
            print("Vie actuelle de " + name2 + " : \(hp2)")
        }
        else if (SpecialNinja2 == true) { //Vérification Spécial Ninja
            hp2 = hp2 - 0
            SpecialNinja2 = false
            print("Camouflage désactivé pour " + name2)
            print("Aucun dommage recu")
        }
        else if (classe2 == "Ninja") && (hp2 <= 45) && (EsquiveNinja2 <= 33.33) { //Vérification du passif du joueur 2 si classe Ninja
            print("Attaque esquivée !")
            print("Aucun dégats ont été recu pour " + name2)
            EsquiveNinja2 = Float.random(in : 0...100)
        }
        else if (classe1 == "Archer") { //Passif de l'Archer
            if (TranquilissantArcher1 <= 33.33) {
                hp2 = hp2 - 15
                PasseSonTour2 = true
                print("Oh ! Le tranquilisant de " + name1 + " a fonctionné ! " + name2 + " a perdu 15 hp et passe son tour une fois" )
                TranquilissantArcher1 = Float.random(in : 0...100)
            }
            else {
                if (classe2 == "Guerrier") { //Verification du passif du joueur 2 si classe guerrier
                    hp2 = hp2 - 0.9 * dammage1
                    print("Le tranquilisant n'a pas fonctionné !")
                    print(name2 + " a subi de sacré dommage mais moins que prévu grace à son passif : \(0.9 * dammage1)")
                }
                else {
                    hp2 = hp2 - dammage1
                    print("Le tranquilisant n'a pas fonctionné !")
                    print(name2 + " a subi de sacré dommage : \(dammage1)")
                }
            }
        }
        else {
            if (classe1 == "Geant") && (hp1 <= 50) { //Verification du passif du joueur 1 si classe géant
                print("La rage du Géant est intense !")
                if SpecialGuerrier2 == true {
                    hp2 = hp2 - dammage1
                    print("Dommage divisé par deux")
                    print("Le bouclier a été brisée pour " + name2)
                    SpecialGuerrier2 = false
                }
                else if (classe2 == "Guerrier") {
                    hp2 = hp2 - 1.8 * dammage1
                    print(name2 + " a subi d'immense dommage mais moins que prévu grace à son passif : \(dammage1 * 1.8)")
                }
                else if (SpecialNinja2 == true) {
                    hp2 = hp2 - 0
                    SpecialNinja2 = false
                    print("Camouflage désactivé pour " + name2)
                    print("Aucun dommage recu")
                }
                else {
                    hp2 = hp2 - 2 * dammage1
                    print(name2 + " a subi d'immense dommage : \(dammage1 * 2)")
                }
            }
            else { //Si aucune des conditions précédentes sont remplies alors :
                if (classe2 == "Guerrier") { //toujours passif du guerrier
                    hp2 = hp2 - 0.9 * dammage1
                    print(name2 + " a subi moins de dommage que prévu grace à son passif : \(0.9 * dammage1)")
                }
                else { // et enfin on attaque normalement
                    hp2 = hp2 - dammage1
                    print(name2 + " a subi de sacré dommage : \(dammage1)")
                }
            }
        }
    }
    //
    //Attaque le joueur 1 et vérification des passifs et attaques spéciales du joueur 1 et 2
    //Aucune sortie
    func attaquerUser1 () {
        if (poison2 == true) && (hp2 <= 50) && (drainAssassin2 <= 50) {
            print("Le drain de vie a fonctionnée !")
            print(name2 + " regagne : 25 hp")
            hp2 = hp2 + 25
            print("Vie actuelle de " + name2 + " \(hp2)")
            if (SpecialGuerrier1 == true) {
                print("Le bouclier a été brisé pour " + name1)
                print(name1 + " subit 5 dégats")
                hp1 = hp1 - 5
                SpecialGuerrier1 = false
                print("Vie actuelle de " + name1 + " \(hp1)")
            }
            else if (SpecialNinja1 == true) {
                print("Camouflage désactivé pour " + name1)
                print(name1 + " ne subit pas de dégats")
                SpecialNinja1 = false
            }
            else {
                print(name1 + " subit 1O dégats ")
                hp1 = hp1 - 10
                print("Vie actuelle de " + name1 + " \(hp1)")
            }
        }
        else if (SpecialGuerrier1 == true) {
            hp1 = hp1 - dammage2 / 2
            SpecialGuerrier1 = false
            print("Le bouclier a été brisée pour " + name1)
            print("Dommage recu diviser par deux : \(dammage2/2)")
            print("Vie actuelle de " + name1 + " : \(hp1)")
        }
        else if (SpecialNinja1 == true) {
            hp1 = hp1 - 0
            SpecialNinja1 = false
            print("Camouflage désactivé pour " + name1)
        }
        else if (classe1 == "Ninja") && (hp1 <= 45) && (EsquiveNinja1 <= 33.33) {
            print("Attaque esquivée !")
            print("Aucun dégats ont été recu pour " + name1)
            EsquiveNinja1 = Float.random(in : 0...100)
        }
        else if (classe2 == "Archer") {
            if (TranquilissantArcher2 <= 33.33) {
                hp1 = hp1 - 15
                PasseSonTour1 = true
                print("Oh ! Le tranquilisant de " + name2 + " a fonctionné ! " + name1 + " a perdu 15 hp et passe son tour une fois" )
            }
            else {
                hp1 = hp1 - dammage2
                print("Le tranquilisant n'a pas fonctionné !")
                print(name1 + " a subi de sacré dommage : \(dammage2)")
            }
        }
        else {
            if (classe2 == "Geant") && (hp2 <= 50) {
                print("La rage du Géant est intense !")
                if (SpecialGuerrier1 == true) {
                    hp1 = hp1 - dammage2
                    print("Dommage divisé par deux")
                    print("Le bouclier a été brisée pour " + name1)
                    SpecialGuerrier1 = false
                }
                else if (classe1 == "Guerrier") {
                    hp1 = hp1 - 1.8 * dammage2
                    print(name1 + " a subi d'immense dommage mais moins que prévu grace à son passif : \(dammage2 * 1.8)")
                }
                else if (SpecialNinja1 == true) {
                    hp1 = hp1 - 0
                    SpecialNinja1 = false
                    print("Camouflage désactivé pour " + name1)
                }
                else {
                    hp1 = hp1 - 2 * dammage2
                    print(name1 + " a subi d'immense dommage : \(dammage2 * 2)")
                }
            }
            else {
                if (classe1 == "Guerrier") {
                    hp1 = hp1 - 0.9 * dammage2
                    print(name1 + " a subi moins de dommage que prévu grace à son passif : \(0.9 * dammage2)")
                }
                else {
                    hp1 = hp1 - dammage2
                    print(name1 + " a subi de sacré dommage : \(dammage2)")
                }
            }
        }
    }
    //
    //Attaque spéciale des différentes classes du User1
    //Aucune sortie
    func attaqueSpecial1() {
        if (classe1 == "Viking") && (IsUsedViking1 > 0) {
            print(name1 + " a utilisé son attaque spécial : Brise Heaume")
            print("Attaque inesquivable et inarétable ! Toutes les protections et effets sont enlevés et n'ont aucune repercution sur l'attaque !")
            if (hp1 >= 80) {
                hp2 = hp2 - 10
                print(name2 + " subit 10 dégats")
            }
            else if (hp1 < 80) && (hp1 > 40) {
                hp2 = hp2 - 25
                print(name2 + " subit 25 dégats")
            }
            else {
                hp2 = hp2 - 40
                print(name2 + " subit 40 dégats")
            }
            SpecialGuerrier2 = false
            SpecialNinja2 = false
            IsUsedViking1 = IsUsedViking1 - 1
            print("Vie actuelle de " + name2 + " : \(hp2)")
        }
        else if (classe1 == "Guerrier") && (IsUsedGuerrier1 > 0) { //Attaque Spécial du Joueur 1 si classe Guerrier
            IsUsedGuerrier1 = IsUsedGuerrier1 - 1
            hp1 = hp1 + 15
            dammage1 = dammage1 + 6
            SpecialGuerrier1 = true
            print(name1 + "a utilisé son attaque spécial : Le Bouclier Incontrolable")
            print("Il gagne 15 hp, son attaque augmente de 6 et il recevra 50% de dommage en moins à la prochaine attque")
            print("Vie actuelle de " + name1 + " : \(hp1)")
            print("Degat actuel de " + name1 + " : \(dammage1)")
        }
        else if (classe1 == "Archer") && (IsUsedArcher1 > 0) { //Attaque Spécial du Joueur 2 si classe Archer
            IsUsedArcher1 = IsUsedArcher1 - 1
            print(name1 + "a utilisé l'attaque spécial : Fleche Magique ! ")
            if SpecialNinja2 == true { //Verification du camouflage du joueur 2
                hp2 = hp2 - 0
                print("Le camouflage a arrété la flèche magique !!")
                SpecialNinja2 = false
            }
            else if (classe2 == "Ninja") && (hp2 <= 45) && (EsquiveNinja2 <= 33.33) { // Verification de l'esquive du joueur 2
                print("Flèche magique esquivée esquivée !")
                print("Aucun dégats ont été recu pour " + name2)
                EsquiveNinja2 = Float.random(in : 0...100)
            }
            else if (SpecialGuerrier2 == true) { // Vérification du bouclier du joueur 2 si classe Guerrier
                hp2 = hp2 - dammage1
                print("Le bouclier a arrété une partie des dégats de la flèche magique ! Dégat subis par " + name2 + " : \(dammage1)")
            }
            else if (classe2 == "Guerrier") { // Verification du passif du joueur 2 si classe Guerrier
                hp2 = hp2 - 1.8 * dammage1
                print("Le passif de " + name2 + " a arrété une partie des dégats ! Dégats subis : \(dammage1 * 1.8)")
            }
            else { // si aucune des conditions ne sont pas respéctés alors on attaque normalement
                SpecialArcher1  = dammage1 * 2
                hp2 = hp2 - SpecialArcher1
                print("Dégat subis par " + name2 + " : \(SpecialArcher1)")
            }
            print("Vie actuelle de " + name2 + " : \(hp2)")
        }
        else if (classe1 == "Mage") && (IsUsedMage1 >= 0) { // Attaque Spécial du Mage
            IsUsedMage1 = IsUsedMage1 - 1
            hp1 = hp1 + 40
            print(name1 + " a utilisé son attaque spécial : Potion Magique, il regagne 40 hp")
            print("Vie actuelle de " + name1 + ": \(hp1)")
        }
        else if (classe1 == "Ninja") && (IsUsedNinja1 > 0) { // Attaque Spécial du Ninja
            IsUsedNinja1 = IsUsedNinja1 - 1
            SpecialNinja1 = true
            print("Camouflage Activé !! " + name1 + " obtient 20 hp, 5 de dommage en plus et sera invisible et ne recevras pas de dommage tant que son camoulfage sera actif !")
            hp1 = hp1 + 20
            dammage1 = dammage1 + 5
            print("Vie actuelle de " + name1 + ": \(hp1)")
            print("Dégats actuels de " + name1 + " : \(dammage1)")
        }
        else if (classe1 == "Geant") && (IsUsedGeant1 > 0) { // Attaque Spécial du Géant
            print(name1 + " a utilisé son attaque spécial : Poing de la destruction")
            if SpecialNinja2 == true { // Verification camouflage
                hp2 = hp2 - 0
                print("Aucun Dégats subis pour " + name2)
                SpecialNinja2 = false
                print("Camouflage désactivée")
            }
            else if (classe2 == "Ninja") && (hp2 <= 45) && (EsquiveNinja2 <= 33.33) { // Verification passif Ninja
                print("Dégats du Poings de la destruction esquivée !")
                print("Aucun dégats ont été recu pour " + name2)
            }
            else if (SpecialGuerrier2 == true) { // Verification attaque spécial du guerrier
                hp2 = hp2 - SpecialGeant1 / 2
                print("Dégats diviser par deux !" + name1 + " subit : 13 dégats")
            }
            else if (classe2 == "Guerrier") { // Verification passif du Guerrier
                hp2 = hp2 - SpecialGeant1 * 0.9
                hp1 = hp1 - ReturnSpecialGeant1
                print("Dégats subis par grace à son passif " + name2 + " : \(SpecialGeant1 * 0.9)")
                print("Vie actuelle de " + name2 + " : \(hp2)")
            }
            else {
                hp2 = hp2 - SpecialGeant1
                hp1 = hp1 - ReturnSpecialGeant1
                print("Dégats subis par " + name2 + " : 25")
                print("Vie actuelle de " + name2 + " : \(hp2)")
            }
            print("Vos poings ont frappés forts ! Vous avez tellement tapé fort que vous subissez des dommages ! -\(ReturnSpecialGeant1) hp pour " + name1)
            ReturnSpecialGeant1 = ReturnSpecialGeant1 + 10
            IsUsedGeant1 = IsUsedGeant1 - 1
        }
        else if (classe1 == "Gobelin")&&(IsUsedGobelin1 > 0) {
            IsUsedGobelin1 = IsUsedGobelin1 - 1
            print(name1 + " a utilisé son attaque Spécial : Fléchette Endormissante ! ")
            if SpecialNinja2 == true {
                print("Fléchette esquivée par " + name2)
                SpecialNinja2 = false
                print("Camouflage desactivé")
            }
            else if (classe2 == "Ninja") && (hp2 <= 45) && (EsquiveNinja2 <= 33.33) { // Verification passif Ninja
                print("Fléchette esquivée par " + name2)
            }
            else {
                print("La fléchette a touché sa cible !")
                SpecialGobelin1 = true
                print(name2 + " restera endormi pendant deux tours")
            }
        }
        else {
            print("Vous avez utilisé trop de fois votre attaque spécial ! Veuillez choisir une action valide !")
            ControllRound().TourJoueur1()
        }
    }
    //
    //Attaque spéciale des différentes classes du User2
    //Aucune sortie
    func attaqueSpecial2() {
        if (classe2 == "Viking") && (IsUsedViking2 > 0) {
            print(name2 + " a utilisé son attaque spécial : Brise Heaume")
            print("Attaque inesquivable et inarétable ! Toutes les protections et effets sont enlevés et n'ont aucune repercution sur l'attaque !")
            if (hp2 >= 80) {
                hp1 = hp1 - 10
                print(name1 + " subit 10 dégats")
            }
            else if (hp2 < 80) && (hp2 > 40) {
                hp1 = hp1 - 25
                print(name1 + " subit 25 dégats")
            }
            else {
                hp1 = hp1 - 40
                print(name1 + " subit 50 dégats")
            }
            SpecialGuerrier1 = false
            SpecialNinja1 = false
            IsUsedViking2 = IsUsedViking2 - 1
            print("Vie actuelle de " + name1 + " : \(hp1)")
        }
        else if (classe2 == "Guerrier") && (IsUsedGuerrier1 > 0) {
            IsUsedGuerrier2 = IsUsedGuerrier2 - 1
            hp2 = hp2 + 15
            dammage2 = dammage2 + 6
            SpecialGuerrier2 = true
            print(name2 + "a utilisé son attaque spécial : Le Bouclier Incontrolable")
            print("Il gagne 15 hp, son attaque augmente de 6 et il recevra 50% de dommage en moins à la prochaine attaque")
            print("Vie actuelle de " + name2 + ": \(hp2)")
            print("Dégat actuel de " + name2 + ": \(dammage2)")
        }
        else if (classe2 == "Archer") && (IsUsedArcher1 > 0) {
            IsUsedArcher2 = IsUsedArcher2 - 1
            print(name2 + "a utilisé l'attaque spécial : Fleche Magique ! ")
            if SpecialNinja1 == true {
                hp1 = hp1 - 0
                print("Le camouflage a empéché la flèche magique !")
            }
            else if (classe1 == "Ninja") && (hp1 <= 45) && (EsquiveNinja1 <= 33.33) {
                print("Dégats de la flèche magique esquivée !")
                print("Aucun dégats ont été recu pour " + name1)
                EsquiveNinja1 = Float.random(in : 0...100)
            }
            else if (SpecialGuerrier1 == true) {
                hp1 = hp1 - dammage2
                print("Le bouclier incontrolable a arrété la flèche magique ! Dégat subis par " + name1 + " : \(dammage2)")
            }
            else if (classe1 == "Guerrier"){
                hp1 = hp1 - 1.8 * dammage2
                print("Le passif de " + name1 + " a arrété une partie des dégats ! Dégats subis : \(dammage2 * 1.8)")
            }
            else {
                SpecialArcher2  = dammage2 * 2
                hp1 = hp1 - SpecialArcher2
                print("Dégat subis par " + name1 + " : \(SpecialArcher2)")
            }
            print("Vie actuelle de " + name1 + " : \(hp1)")
        }
        else if (classe2 == "Mage") && (IsUsedMage2 > 0) {
            IsUsedMage2 = IsUsedMage2 - 1
            hp2 = hp2 + 40
            print(name2 + " a utilisé son attaque spécial : Potion Magique, il regagne 40 hp")
            print("Vie actuelle de " + name2 + ": \(hp2)")
        }
        else if (classe2 == "Ninja") && (IsUsedNinja1 > 0) {
            IsUsedNinja2 = IsUsedNinja2 - 1
            SpecialNinja2 = true
            print("Camouflage Activé !! " + name2 + " obtient 20 hp, 5 de dommage en plus et sera invisible et ne recevras pas de dommage tant que son camoulfage sera actif !")
            hp2 = hp2 + 20
            dammage2 = dammage2 + 5
            print("Vie actuelle de " + name2 + ": \(hp2)")
            print("Dégats actuels de " + name2 + " : \(dammage2)")
        }
        else if (classe2 == "Geant") && (IsUsedGeant2 > 0) {
            print(name2 + " a utilisé son attaque spécial : Poing de la destruction")
            if SpecialNinja1 == true {
                hp1 = hp1 - 0
                print("Aucun Dégats subis pour " + name1)
            }
            else if (classe1 == "Ninja") && (hp1 <= 45) && (EsquiveNinja1 <= 33.33) {
                print("Dégats du Poings de la destruction esquivée !")
                print("Aucun dégats ont été recu pour " + name1)
            }
            else if (SpecialGuerrier1 == true) { // Verification attaque spécial du guerrier
                hp1 = hp1 - SpecialGeant2 / 2
                print("Dégats diviser par deux ! " + name1 + " subit : \(SpecialGeant1/2)")
            }
            else if (classe1 == "Guerrier") { // Verification passif du Guerrier
                hp1 = hp1 - SpecialGeant2 * 0.9
                hp2 = hp2 - ReturnSpecialGeant2
                print("Dégats subis par grace à son passif " + name1 + " : \(SpecialGeant1 * 0.9)")
                print("Vie actuelle de " + name1 + " : \(hp1)")
            }
            else {
                hp1 = hp1 - SpecialGeant2
                hp2 = hp2 - ReturnSpecialGeant2
                print("Dégats subis par " + name1 + " : 25")
                print("Vie actuelle de " + name1 + " : \(hp1)")
            }
            print("Vos poings ont frappés forts ! Vous avez tellement tapé fort que vous subissez des dommages ! -\(ReturnSpecialGeant2) hp pour " + name2)
            ReturnSpecialGeant2 = ReturnSpecialGeant2 + 10
            IsUsedGeant2 = IsUsedGeant2 - 1
        }
        else if (classe2 == "Gobelin")&&(IsUsedGobelin2 > 0) {
            IsUsedGobelin2 = IsUsedGobelin2 - 1
            print(name2 + " a utilisé son attaque Spécial : Fléchette Endormissante ! ")
            if SpecialNinja1 == true {
                print("Fléchette esquivée par " + name1)
            }
            else if (classe1 == "Ninja") && (hp1 <= 45) && (EsquiveNinja1 <= 33.33) { // Verification passif Ninja
                print("Fléchette esquivée !")
            }
            else {
                print("La fléchette a touché sa cible !")
                print(name2 + " restera endormi pendant deux tours dans 1 tour")
                SpecialGobelin2 = true
            }
        }
        else {
            print("Vous avez utilisé trop de fois votre attaque spécial ! Veuillez choisir une action valide !")
            ControllRound().TourJoueur2()
        }
    }
}
