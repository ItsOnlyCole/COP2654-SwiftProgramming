//
//  Monster.swift
//  MonsterTown
//
//  Created by Cole Hemp on 2/18/19.
//  Copyright © 2019 Cole Hemp. All rights reserved.
//

import Foundation

class Monster {
    var town: Town?
    var name = "Monster"
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town")
        }
        else {
            print("\(name) hasn't found a town to terrorize yet.")
        }
    }
}
