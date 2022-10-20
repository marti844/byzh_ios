//
//  StudyCenterItem.swift
//  twt
//
//  Created by Kean Shi on 2022/2/7.
//

import SwiftUI

struct StudyCenterItem: Identifiable {
    
    var id = UUID().uuidString
    var time: String
    var pos: String
    var number: String
    var intro: String
}
 
var studycentermessages = [
    StudyCenterItem(time: "2002", pos: "tianjin", number: "1人", intro: "jjj"),
]

