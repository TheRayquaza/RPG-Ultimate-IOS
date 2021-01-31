//
//  Character.swift
//  TP-RPG
//
//  Created by Mateo lelong on 17/04/2020.
//  Copyright © 2020 Mateo Lelong. All rights reserved.
//

import Foundation

//
//Initialisation des classes
//Creation d'une classe Character pour le personnage
class Character {
    func choicename1() { //Choix du nom du User 1
        name1 = readLine()!
    }
    func choicename2() {//Same pour le User 2
        name2 = readLine()!
    }
    func choiceclass1() {//Choix de la classe du User 1
        if choiceUser1 == "1" {
            classe1 = "Guerrier"
            hp1 = 130
        }
        else if choiceUser1 == "2"{
            classe1 = "Archer"
            hp1 = 100
        }
        else if choiceUser1 == "3" {
            classe1 = "Mage"
            hp1 = 85
        }
        else if choiceUser1 == "4" {
            classe1 = "Ninja"
            hp1 = 70
        }
        else if choiceUser1 == "5" {
            classe1 = "Assassin"
            hp1 = 110
        }
        else if choiceUser1 == "6" {
            classe1 = "Geant"
            hp1 = 150
        }
        else if choiceUser1 == "7" {
            classe1 = "Gobelin"
            hp1 = 140
        }
        else if choiceUser1 == "8" {
            classe1 = "Viking"
            hp1 = 120
        }
        else {
            print(name1 + " veuillez séléctionner une classe valide !")
            choiceUser1  = readLine() ?? "defaut"
            choiceclass1()
        }
    }
    func choiceclass2() {//Choix de la classe du User 2
        if choiceUser2 == "1" {
            classe2 = "Guerrier"
            hp2 = 130
        }
        else if choiceUser2 == "2"{
            classe2 = "Archer"
            hp2 = 100
        }
        else if choiceUser2 == "3" {
            classe2 = "Mage"
            hp2 = 85
        }
        else if choiceUser2 == "4" {
            classe2 = "Ninja"
            hp2 = 70
        }
        else if choiceUser2 == "5" {
            classe2 = "Assassin"
            hp2 = 110
        }
        else if choiceUser2 == "6" {
            classe2 = "Geant"
            hp2 = 150
        }
        else if choiceUser2 == "7" {
            classe2 = "Gobelin"
            hp2 = 140
        }
        else if choiceUser2 == "8" {
            classe2 = "Viking"
            hp2 = 120
        }
        else {
            print(name2 + " veuillez séléctionner une classe valide !")
            choiceUser2  = readLine() ?? "defaut"
            choiceclass2()
        }
    }
}
