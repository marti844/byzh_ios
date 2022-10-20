//
//  StudyItem.swift
//  twt
//
//  Created by Kean Shi on 2022/2/7.
//

import SwiftUI

struct StudyItem: Identifiable {
    
    var id = UUID().uuidString
    var name: String
    var time: String
    var pos: String
    var intro: String
}

var studymessages = [
    StudyItem(name: "zhang", time: "2002", pos: "tianjin", intro: "jjj"),
]
