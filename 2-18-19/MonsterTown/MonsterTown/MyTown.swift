//
//  MyTown.swift
//  MonsterTown
//
//  Created by Cole Hemp on 2/18/19.
//  Copyright © 2019 Cole Hemp. All rights reserved.
//

import Foundation


//Covering Stucts (Like a class but can't use inheritance)
struct Town {
    var population = 5422
    var numberOfStopLights = 4

    mutating func changePopulation(by amount:Int){
        population += amount
    }

}



