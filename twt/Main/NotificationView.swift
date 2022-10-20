//
//  NotificationView.swift
//  twt
//
//  Created by Kean Shi on 2022/1/29.
//

import SwiftUI
import Alamofire
import SystemConfiguration

let NotificationHomeMainColor = Color(red: 164/255, green: 155/255, blue: 181/255)

struct NotificationView: View {
    
    @State var selection: String = "我创建的"
    let postOption: [String] = ["我创建的", "我申请的"]
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [LightHomeMainColor, .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            VStack{
                HStack {
                    Picker(selection: $selection,
                        label:
                        HStack{
                            Text(selection)
                        Text("jjj")
                        }
                            ,content: {
                        ForEach(postOption, id: \.self) {option in
                            Text(option)
                                .tag(option)
                        }
                    })
                        .padding(.trailing, 80)
                        .pickerStyle(MenuPickerStyle())
                    Text("消息")
                        .font(.title2)
                }
                .foregroundColor(.black)
                .padding(.trailing, 150)
                if (selection == "我创建的") {
                    createpostBody()
                }
                else {
                    applypostBody()
                }
                Spacer()
            }
            .padding(.top)
            .navigationTitle("")
        .navigationBarHidden(true)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}


struct createpostBody: View {
    @StateObject var userData = PostModel()
    
    var body: some View {
        ZStack {
            
            ScrollView(.vertical, showsIndicators: true) {
                ForEach(userData.posts.indices, id: \.self) {i in
                    NavigationLink(destination: carDetailView(user: userData.posts[i]), label: {
                        UserCardView(user: userData.posts[i])
                    })
                }
            }
        }
    }
}

struct applypostBody: View {
    
    @StateObject var userData = PostModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(userData.posts.indices, id: \.self) {i in
                NavigationLink(destination: carDetailView(user: userData.posts[i]), label: {
                    UserCardView(user: userData.posts[i])
                })
            }
        }
        
    }
}
