//
//  TabView.swift
//  twt
//
//  Created by Kean Shi on 2022/2/1.
//

import SwiftUI

struct TabViewnew: View {
    
    @State var starttab : Int = 0
    
    var body: some View {
        TabView {
            ShouyeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("首页")
                }
                .tag(0)
            NotificationView()
                .tabItem {
                    Image(systemName: "bell")
                    Text("通知")
                }
                .tag(1)
            CenterView()
                .tabItem {
                    Image(systemName: "person")
                    Text("个人中心")
                }
                .tag(2)
            
        }
        .accentColor(HomeMainColor)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct TabViewnew_Previews: PreviewProvider {
    static var previews: some View {
        TabViewnew()
    }
}
