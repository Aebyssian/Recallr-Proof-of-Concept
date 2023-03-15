//
//  Collection.swift
//  Recallr Testing 2
//
//  Created by Jacob Wilson on 3/9/23.
//

import Foundation

struct Collection {
    var name: String
    var collection: [Memory]
    var id: Int
    
    
    init (name: String, id: Int) {
        self.name = name
        self.id = id
        collection = []
    }
    
    mutating func addMemory(_ memory: Memory) {
        collection.append(memory)
    }
    
}

struct Master {
    var collections: [Collection]
}

