//
//  MaterialModel.swift
//  twt
//
//  Created by Kean Shi on 2022/2/7.
//

import SwiftUI

struct Material: Identifiable {
    var id = UUID().uuidString
    var name: String
}
let materials = [
    Material(name: "高等数学月考"),
    Material(name: "高等数学期中"),
    Material(name: "高等数学期末"),
    Material(name: "高等数学期末"),
    Material(name: "高等数学期末"),
    Material(name: "高等数学月考"),
    Material(name: "高等数学月考"),
    Material(name: "高等数学月考"),
    Material(name: "高等数学月考"),
]
