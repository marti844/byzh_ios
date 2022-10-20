//
//  Home.swift
//  twt
//
//  Created by Kean Shi on 2022/2/6.
//

import SwiftUI

struct Home: View {
    @Binding var filteredItem: [MessageItem]
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15) {
                ForEach(filteredItem) {item in
                    NavigationLink(destination: CenterDetail(item: item)) {
                        MessageView(item: item)
                    }
                }
            }
            .padding()
        }
    }
}

