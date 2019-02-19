//
//  main.swift
//  MonsterTown
//
//  Created by Cole Hemp on 2/18/19.
//  Copyright © 2019 Cole Hemp. All rights reserved.
//

import Foundation

//calls struct from MyTown.swift
var myTown = Town()
print(myTown)
print("population: \(myTown.population)\nnumber of stop lights: \(myTown.numberOfStopLights)")

myTown.changePopulation(by: 1000)
print("Some newcomers arrived! Population is now \(myTown.population)")

let genericMonster = Monster()

genericMonster.town = myTown

genericMonster.terrorizeTown()

let BillTheZombie = Zombie()

BillTheZombie.town = myTown
BillTheZombie.terrorizeTown()
