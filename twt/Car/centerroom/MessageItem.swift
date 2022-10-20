//
//  MessageItem.swift
//  twt
//
//  Created by Kean Shi on 2022/2/6.
//

import SwiftUI

struct MessageItem: Identifiable {
    
    var id = UUID()
    var name: String
    var image: String
    var time: String
    var frompos: String
    var topos: String
    var cartime: String
    var number: String
    var intro: String
}

var messages = [
    MessageItem(name: "张三", image: "person.fill", time: "2002", frompos: "tianjin", topos: "Hhanghai", cartime: "4:00", number: "3人", intro: "jjj"),
    MessageItem(name: "jack", image: "person.fill", time: "2006", frompos: "xiamen", topos: "Shanghai", cartime: "8:00", number: "5人", intro: "xxx"),
    MessageItem(name: "alice", image: "person.fill", time: "2009", frompos: "taiwan", topos: "hhanghai", cartime: "9:00", number: "4人", intro: "ttt"),
]
