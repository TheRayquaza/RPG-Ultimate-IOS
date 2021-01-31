//
//  ControllRound.swift
//  TP-RPG
//
//  Created by Mateo lelong on 17/04/2020.
//  Copyright © 2020 Mateo Lelong. All rights reserved.
//

import Foundation

//La classe suivante controlle les rounds des joueurs 1 ET 2
class ControllRound {
    func TourJoueur1() {
        if (PasseSonTour1 == true) {
            print(name1 + " passe son tour !")
        }
        else {
            choiceround = readLine()
            if (choiceround == "1") {
                Weapon().attaquerUser2()
            }
            else if (choiceround == "2") {
                Weapon().ameliorerWeapon1()
            }
            else if (choiceround == "3") {
                if classe1 == "Assassin" {
                    PoisonAssassin1()
                }
                else {
                    Weapon().attaqueSpecial1()
                }
            }
            else {
                print("Je n'ai pas compris")
             print("Veuillez saisir une action valide : ")
                TourJoueur1()
            }
        }
    }
    func TourJoueur2() {
        if (PasseSonTour2 == true) {
            print(name2 + "passe son tour !")
        }
        else {
            choiceround = readLine()
            if (choiceround == "1") {
                Weapon().attaquerUser1()
            }
            else if (choiceround == "2") {
                Weapon().ameliorerWeapon2()
            }
            else if (choiceround == "3") {
                if classe2 == "Assassin" {
                    PoisonAssassin2()
                }
                else {
                    Weapon().attaqueSpecial2()
                }
            }
            else {
                print("Je n'ai pas compris")
                print("Veuillez saisir une action valide : ")
                TourJoueur2()
                }
        }
    }
    func PoisonAssassin1() { //Fonction pour le poison de l'assassin du User 1
        if (IsUsedAssassin1 <= 0) {
            print("Vous avez utilisez trop de fois votre attaque spécial !")
            print("Veuillez séléctionnez une action valide !")
            TourJoueur1()
        }
        else {
            if (poison1 == false) {
                if (classe2 == "Guerrier") {
                    print("Le poison a fait son effet, perte de \(poisontime1 * 0.9) hp pour " + name2 + " grace à son passif et perte de dégats successifs pendant 6 tours !")
                    hp2 = hp2 - poisontime1 * 0.9
                }
                else {
                    print("Le poison fait son effet, perte de \(poisontime1) hp pour " + name2 + " et perte de dégats successifs pendant 6 tours !")
                    hp2 = hp2 - poisontime1
                }
                print("Vie Actuelle de " + name2 + ": \(hp2)")
                poison1 = true
                IsUsedAssassin1 = IsUsedAssassin1 - 1
            }
            else if (poisontime1 < 3) {
                poison1 = false
                print("Le poison a été désactivé")
            }
        }
    }
    func PoisonAssassin2() { //Fonction pour le poison de l'assassin du User 1
        if (IsUsedAssassin2 <= 0) {
            print("Vous avez utilisez trop de fois votre attaque spécial !")
            print("Veuillez séléctionnez une action valide !")
            TourJoueur2()
        }
        else {
            if (poison2 == false) {
                if (classe1 == "Guerrier") {
                    print("Le poison a fait son effet, perte de \(poisontime2 * 0.9) hp pour " + name1 + " grace à son passif et perte de dégats successifs pendant 6 tours !")
                    hp1 = hp1 - poisontime2 * 0.9
                }
                else {
                    print("Le poison fait son effet, perte de \(poisontime2) hp pour " + name1 + " et perte de dégats successifs pendant 6 tours !")
                    hp1 = hp1 - poisontime2
                }
                print("Vie Actuelle de " + name1 + ": \(hp1)")
                poison2 = true
                IsUsedAssassin2 = IsUsedAssassin2 - 1
            }
            else if (poisontime2 < 3) {
                poison2 = false
                print("Le poison a été désactivé")
            }
        }
    }
    func VerificationPoisonUser1 () {
        if (poison2 == true) && (poisontime2 >= 3) {// Vérification de l'état du poison du User 1
            poisontime2 = poisontime2 - 2
            if (classe1 == "Guerrier") {
                hp1 = hp1 - poisontime2 * 0.9
                print("Dégat de poison subit par " + name1 + " garce à son passif ! -\(poisontime2 * 0.9)")
            }
            else {
                hp1 = hp1 - poisontime2
                print("Dégat de poison subit par " + name1 + " ! -\(poisontime2)")
            }
        }
    }
    func VerificationPoisonUser2 () {
        if (poison1 == true) && (poisontime1 >= 3) {// Vérification de l'état du poison du User 1
            if (classe2 == "Guerrier") {
                poisontime1 = poisontime1 - 2
                hp2 = hp2 - poisontime1 * 0.9
                print("Dégat de poison subit par " + name2 + " garce à son passif ! -\(poisontime1 * 0.9)")
            }
            else {
                poisontime1 = poisontime1 - 2
                hp2 = hp2 - poisontime1
                print("Dégat de poison subit par " + name2 + " ! -\(poisontime1)")
            }
        }
    }
    //Fonction qui vérifie Si la flechette du Gobelin est activé ou non et le passif du gobelin
    //Sortie : Aucune
    func VerificationFlechetteGobelin1() {
       //Le spécial du User 1
       if SpecialGobelin1 == true {
        print(name2 + " vient de s'endormir et ce pour 2 tours !")
        print("")
        RoundActuel1 = round + 2
        SpecialGobelin1 = false
        EndormisUser1 = true
        PasseSonTour2 = true
        print("Vie actuelle de " + name2 + " : \(hp2)")
       }
       else if EndormisUser1 == true {
           if RoundActuel1 == round {
               PasseSonTour2 = false
               EndormisUser1 = false
               return
           }
           else {
            PasseSonTour2 = true
            print(name2 + " dort profondémment !")
            print("Vie actuelle de " + name2 + " : \(hp2)")
            print("")
           }
       }
       else {
           return
       }
    }
    func VerificationFlechetteGobelin2 () {
        //Le spécial du User 2
        if (SpecialGobelin2 == true) {
            print(name1 + " vient de s'endormir et ce pour 2 tours !")
            print("")
            RoundActuel2 = round + 2
            SpecialGobelin2 = false
            EndormisUser2 = true
            PasseSonTour1 = true
            print("Vie actuelle de " + name1 + " : \(hp1)")
        }
        else if (EndormisUser2 == true) {
            if (RoundActuel2 == round) {
                PasseSonTour1 = false
                EndormisUser2 = false
                return
            }
            else {
                PasseSonTour1 = true
                print(name1 + " dort profondémment !")
                print("Vie actuelle de " + name1 + " : \(hp1)")
                print("")
            }
        }
        else {
            return
        }
    }
    func VerificationPassifGobelin1 () {
        //Le passif du joueur 1
        if (classe1 == "Gobelin") && (hp1 <= 40) && (PassifGobelin1 == true) {
            print(name1 + " est enragé, il vole l'attaque de " + name2 + " et l'aditionne à la sienne !")
            dammage1 = dammage2 + dammage1
            print("Dégats actuels de " + name1 + " : \(dammage1)")
             print("")
            PassifGobelin1 = false
        }
        else {
            return
        }
    }
    func VerificationPassifGobelin2 () {
        //Le passif du joueur 2
        if (classe2 == "Gobelin") && (hp2 <= 40) && (PassifGobelin2 == true) {
            print(name2 + " est enragé, il vole l'attaque de " + name1 + " et l'aditionne à la sienne  !")
            dammage2 = dammage1 + dammage2
            print("Dégats actuels de " + name2 + " : \(dammage2)")
            print("")
            PassifGobelin2 = false
        }
        else {
            return
        }
    }
    //Verification du passif du User 1 si classe Viking
    func VerificationPassifViking1 () {
        if (classe1 == "Viking") && (dammage2 >= 35) && (PassifViking1 == false) {
            dammage1 = dammage1 * 1.5
            PassifViking1 = false
            print("Hache de Guerre activée pour " + name1 + " dommage multiplié par 1.5")
            print("")
        }
        else {
            return
        }
    }
    func VerificationPassifViking2 () {
        if (classe2 == "Viking") && (dammage1 >= 35) && (PassifViking2 == true) {
            dammage2 = dammage2 * 1.5
            PassifViking2 = false
            print("Hache de Guerre activée pour " + name2 + " dommage multiplié par 1.5")
            print("")
        }
        else {
            return
        }
    }
    //Fonction qui verifie qui gagne et affiche le vainqueur
    func WhoWin() {
        if (hp1 <= 0) {
            print("")
            print("Fin du match !")
            print(name2 + " a gagné !!!" )
        }
        else if (hp2 <= 0) {
            print("")
            print("Fin du match !")
            print(name1 + " a gagné !!!")
        }
        else if (hp1 <= 0) && (hp2 <= 0) {
            print("")
            print("Fin du match !")
            print("Egalité !!!")
        }
    }
}
