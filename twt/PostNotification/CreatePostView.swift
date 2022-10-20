//
//  CreatePostView.swift
//  twt
//
//  Created by Kean Shi on 2022/3/29.
//

import SwiftUI

struct CreatePostView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [LightHomeMainColor, .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
//            ScrollView(.vertical, showsIndicators: true) {
//                ForEach
//            }
        }
        .ignoresSafeArea(.all)
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
