//
//  RecallManager.swift
//  Recallr Testing 2
//
//  Created by Jacob Wilson on 3/9/23.
//

import Foundation

struct RecallManager {
    func fetchMemoryProperty(_ master: Master, id: Int, property: String) -> Any? {
        for i in master.collections {
            for j in i.collection {
                if j.id == id { //found memory
                    if property == "front_text" {
                        return j.front_text
                    }
                    else if property == "back_text" {
                        return j.back_text
                    }
                    else if property == "correct_answer" {
                        return j.correct_answer ?? "Error: This is not a text insertion memory"
                    }
                    else if property == "type" {
                        return j.type
                    }
                    
                    
                    
                    
                    
                    
                }
            }
        }
        return nil
    }
}
