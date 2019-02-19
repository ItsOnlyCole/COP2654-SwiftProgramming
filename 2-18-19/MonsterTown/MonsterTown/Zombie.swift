//
//  Zombie.swift
//  MonsterTown
//
//  Created by Cole Hemp on 2/18/19.
//  Copyright © 2019 Cole Hemp. All rights reserved.
//

import Foundation

//Class Zombie inherits from Monster Class
class Zombie: Monster {
    var walksInZigZag = true
    
    
    //Overides a method/var in SuperClass (Monster)
    override func terrorizeTown() {
        town?.changePopulation(by: -10)
        super.name = "Zombies"
        super.terrorizeTown()
    }
}
