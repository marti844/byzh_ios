//
//  StudyMaterial.swift
//  twt
//
//  Created by Kean Shi on 2022/2/7.
//

import SwiftUI

struct StudyMaterial: View {
    var body: some View {
        List(materials) {material in
            Text(material.name)
        }
    }
}

struct StudyMaterial_Previews: PreviewProvider {
    static var previews: some View {
        StudyMaterial()
    }
}
