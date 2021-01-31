
//
//  main.swift
//  TP-RPG
//
//  Created by Mateo lelong on 05/04/2020.
//  Copyright © 2020 Mateo Lelong. All rights reserved.
//
//Import
import Foundation
//
//Initialisation des variables globales
//Les classes des personnages
var classe1 : String = ""
var classe2 : String = ""
//Les vies des deux joueurs
var hp1 : Float = 1
var hp2 : Float = 1
//Leurs dégats
var dammage1 : Float = 1
var dammage2 : Float = 1
//Leur nom par défaut qui seront ensuite modifiés si le nom entré est correcte
var name1 : String = ""
var name2 : String = ""
//Passer le tour
var PasseSonTour1 : Bool = false
var PasseSonTour2 : Bool = false
//Systeme de round
var RoundActuel1 : Int = 0
var RoundActuel2 : Int = 0
//Les passifs
//User 1
var TranquilissantArcher1 : Float = Float.random(in : 0...100)
var gainHpMage1 : Float = Float.random(in : 0...100)
var EsquiveNinja1 : Float = Float.random(in: 0...100)
var PassifGobelin1 : Bool = true
var PassifViking1 : Bool = true
//User 2
var TranquilissantArcher2 : Float = Float.random(in : 0...100)
var gainHpMage2 : Float = Float.random(in : 0...100)
var EsquiveNinja2 : Float = Float.random(in: 0...100)
var PassifGobelin2 : Bool = true
var PassifViking2 : Bool = true
//Les attaques spéciales
//User 1
var SpecialGuerrier1 : Bool = false
var SpecialArcher1 : Float = 1
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
var SpecialArcher2 : Float = 1
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
var choiceround : String?
//
//
//Display
print("-----------------------------------")
print("Bienvenue sur le jeu RPG-Ultimate")
print("-----------------------------------")
print("Tout droit son reservé à son unique créateur Matéo Lelong.")
print("Tout les droits lui sont accordés quant au devenir de ce jeu !")
print("Tout vol de code ou de bout de codes ne sont pas autorisés")
print("")
print("")
print("------------------------------------")
print("Mais qui sont nos braves guerriers ?")
print("------------------------------------")
print("")
print("Quel est le nom du Premier Joueur ?")
Character().choicename1()
print("Oh vous etes le fameux " + name1 + " qui va bientot s'inscrire dans la légende !")
print("")
print("Mais, qui est votre adverssaire ?")
Character().choicename2()
print("Le redoutable " + name2 + " va-t-il pouvoir riposter ?")
print("")
print("--------------------------------------------")
print("Voici les classes de personnages possibles :")
print("--------------------------------------------")
print("1. Guerrier")
print("2. Archer")
print("3. Mage")
print("4. Ninja")
print("5. Assassin")
print("6. Geant")
print("7. Gobelin")
print("8. Viking")
print("")
print(name1 + ", choisissez votre classe parmi l'une d'entre elles")
var choiceUser1 : String = readLine() ?? "defaut"
Character().choiceclass1() // Enregistre la classe en fonction du numéro entrée avec les hp
print(name1 + " a choisi la classe " + classe1 + ", ça risque d'etre compliqué pour " + name2)
print("")
print(name2 + ", choisissez votre classe")
var choiceUser2 : String = readLine() ?? "defaut"
Character().choiceclass2()
print("Oh, mais " + name2 + " a choisi la classe " + classe2 + ". Quel surprise !")
print("")
print("DEBUT DU COMBAT !!")
print("")
print("")
Weapon().choiceWeaponUser1() //Définition des dégats du joueur 1
Weapon().choiceWeaponUser2() //Définition des dégats du joueur 2
//Boucle tant que pour répéter les round :
while (hp1 > 0 && hp2 > 0) {//Tant que les hp sont supérieur strictement à 0, le match continue
    round = round + 1
    //Réanitialisation des variables randoms
    EsquiveNinja1 = Float.random(in: 0...100)
    EsquiveNinja2 = Float.random(in: 0...100)
    drainAssassin1 = Float.random(in : 0...100)
    drainAssassin2 = Float.random(in : 0...100)
    TranquilissantArcher1 = Float.random(in : 0...100)
    TranquilissantArcher2 = Float.random(in : 0...100)
    //
    print("---------------")
    print("Tour numéro : \(round)")
    print("---------------")
    print("")
    //Début User 1
    ControllRound().VerificationFlechetteGobelin2() //On vérifie si la fléchette est activé ou non et de meme pour le passif
    ControllRound().VerificationPassifGobelin1()//On vérifie le passif du joueur 1 si classe gobelin
    ControllRound().VerificationPoisonUser1() //On vérifie l'état du poison du User 1
    ControllRound().VerificationPassifViking1() // On vérifie le passif du Viking du User 1
    if hp1 <= 0 {break}// Verification de l'état de santé du joueur 1
    else if PasseSonTour1 == true {
        print(name1 + " passe son tour !")
    }
    else {
        print("C'est au tour de " + name1)
        print("Votre vie est de \(hp1)")
        print("Vos dégats actuelles sont de \(dammage1)")
        print("Que souhaitez vous faire :")
        print("1. Attaquer")
        print("2. Améliorer votre arme")
        if (IsUsedGuerrier1 >= 1)&&(IsUsedArcher1 >= 1)&&(IsUsedMage1 >= 1)&&(IsUsedNinja1 >= 1)&&(IsUsedAssassin1 >= 1)&&(IsUsedGeant1 >= 1)&&(IsUsedGobelin1 >= 1)&&(IsUsedViking1 >= 1)
        {
            if classe1 == "Guerrier" {
                print("3. Bouclier Incontrolable : encore \(IsUsedGuerrier1) utilisation")
            }
            else if classe1 == "Archer" {
                print("3. Fleche Magique : encore \(IsUsedArcher1) utilisation")
            }
            else if classe1 == "Mage" {
                print("3. Potion de soin : encore \(IsUsedMage1) utilisation")
            }
            else if classe1 == "Ninja" {
                print("3. Camouflage : encore \(IsUsedNinja1) utilisation")
            }
            else if classe1 == "Assassin" {
                print("3. Dague Empoissonée : encore \(IsUsedAssassin1) utilisation")
            }
            else if classe1 == "Geant" {
                print("3. Poing de la Destruction : encore \(IsUsedGeant1) utilisation")
            }
            else if classe1 == "Gobelin" {
                print("3. Fléchette Endormissante : encore \(IsUsedGobelin1) utilisation")
            }
            else if classe1 == "Viking" {
                print("3. Brise Heaume Inesquivable : encore \(IsUsedViking1) utilisation")
            }
        }
        ControllRound().TourJoueur1() //On execute notre fonction pour les actions du User1
    }
    PasseSonTour1 = false // On enlève passage de tour du joueur 1
    if hp1 <= 0 {break}
    //Fin User 1
    print("")
    //Début User 2
    ControllRound().VerificationFlechetteGobelin1()
    ControllRound().VerificationPassifGobelin2()
    ControllRound().VerificationPoisonUser2()
    ControllRound().VerificationPassifViking2()
    if hp2 <= 0 {break}
    else if PasseSonTour2 == true {
        print(name2 + " passe son tour !")
    }
    else {
        print("C'est au tour de " + name2)
        print("Votre vie est de : \(hp2)")
        print("Vos dégats actuelles sont de \(dammage2)")
        print("Que souhaitez vous faire ?")
        print("1. Attaquer")
        print("2. Améliorer votre arme")
        if (IsUsedGuerrier2 >= 1)&&(IsUsedArcher2 >= 1)&&(IsUsedMage2 >= 1)&&(IsUsedNinja2 >= 1)&&(IsUsedAssassin2 >= 1)&&(IsUsedGeant2 >= 1)&&(IsUsedGobelin2 >= 1)&&(IsUsedViking2 >= 1)
        {
               if classe2 == "Guerrier" {
                   print("3. Bouclier Incontrolable : encore \(IsUsedGuerrier2) utilisation")
               }
               else if classe2 == "Archer" {
                   print("3. Fleche Magique : encore \(IsUsedArcher2) utilisation")
               }
               else if classe2 == "Mage" {
                   print("3. Potion de soin : encore \(IsUsedMage2) utilisation")
               }
               else if classe2 == "Ninja" {
                   print("3. Camouflage : encore \(IsUsedNinja2) utilisation")
               }
               else if classe2 == "Assassin" {
                   print("3. Dague Empoissonée : encore \(IsUsedAssassin2) utilisation")
               }
               else if classe2 == "Geant" {
                    print("3. Poing de la Destruction : encore \(IsUsedGeant2) utilisation")
               }
               else if classe2 == "Gobelin" {
                    print("3. Fléchette Endormissante : encore \(IsUsedGobelin2) utilisation")
                }
               else if classe2 == "Viking" {
                    print("3. Brise Heaume Inesquivable : encore \(IsUsedViking2) utilisation")
                }
        }
        ControllRound().TourJoueur2()// On execute notre fonction pour les actions du User2
    }
    PasseSonTour2 = false // On enlève le passage de tour du joueur 2
    if hp2 <= 0 {break}
    //Fin User 2
}
ControllRound().WhoWin()
print("")
print("Thanks for playing !!")
