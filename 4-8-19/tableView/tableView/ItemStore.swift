//
//  ItemStore.swift
//  tableView
//
//  Created by student on 4/8/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    init() {
        for _ in  0..<5 {
            createItem()
        }
    }
    
    
    func removeItem(_ item: Item){
        if let index = allItems.index(of: item)
        {
            allItems.remove(at: index)
        }
    }
}
