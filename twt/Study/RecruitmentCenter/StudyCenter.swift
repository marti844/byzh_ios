//
//  StudyCenter.swift
//  twt
//
//  Created by Kean Shi on 2022/2/7.
//

import SwiftUI

struct StudyCenter: View {
    @Binding var filteredItem : [StudyCenterItem]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                
                ForEach(filteredItem) {item in
                    StudyCenterView(item: item)
                }
            }
            .padding()
        }
    }
}
