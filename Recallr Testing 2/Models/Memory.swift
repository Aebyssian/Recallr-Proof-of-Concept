//
//  Memory.swift
//  Recallr Testing 2
//
//  Created by Jacob Wilson on 3/9/23.
//

import Foundation

struct Memory {
    var id: Int
    var col_id: Int //collection id
    var type: String
    
    //var ef: Double
    
    var front_text: String?
    var back_text: String?
    
    var correct_answer: String?
    
    init(id: Int, col_id: Int, type: String) {
        self.id = id
        self.col_id = col_id
        self.type = type
    }
}
