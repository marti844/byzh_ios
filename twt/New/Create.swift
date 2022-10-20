//
//  Create.swift
//  twt
//
//  Created by Kean Shi on 2022/2/10.
//

import SwiftUI

struct Create: View {
    var body: some View {
        
//        TabView {
            NewView()
                .tabItem {
                    Image(systemName: "car")
                    Text("拼车")
                }
//            StudyNewView()
//                .tabItem {
//                    Image(systemName: "books.vertical")
//                    Text("学习")
//                }
        //}
    }
}

struct Create_Previews: PreviewProvider {
    static var previews: some View {
        Create()
    }
}
