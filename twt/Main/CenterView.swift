//
//  CenterView.swift
//  twt
//
//  Created by Kean Shi on 2022/1/30.
//

import SwiftUI

let LightHomeMainColor = Color(red: 202/255, green: 200/255, blue: 220/255)

struct CenterView: View {
    
    @StateObject var userData = UserModel()
    
    var body: some View {
        ZStack {
            
            
            LinearGradient(gradient: .init(colors: [LightHomeMainColor, .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            VStack {
                Head()
                Name()
                    .environmentObject(userData)
                Main()
                    .environmentObject(userData)
                Spacer()
            }
            .padding(.top, 60)
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .ignoresSafeArea(.all)
    }
    
}

struct CenterView_Previews: PreviewProvider {
    static var previews: some View {
        CenterView()
    }
}

struct Head: View {
    
    @EnvironmentObject var userData: UserModel
    
    var body: some View {
        HStack {
            Text("个人信息")
                .font(.title2)
                .padding(.leading, 150)
            Spacer()
            NavigationLink(destination: Change()
//                            .environmentObject(userData)
            ){
                HStack {
                    Text("更改")
                        .foregroundColor(.black)
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 10, height: 14)
                }
                .padding(.trailing, 10)
            }
        }
    }
}

struct Name: View {
    
    @EnvironmentObject var userData: UserModel
    
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .clipShape(Circle())
                .frame(width: 130, height: 130)
            Text(userData.nickname)
                .font(.title2)
                .fontWeight(.bold)
                .padding()
        }
        .padding(.top, 10)
        .environmentObject(userData)
    }
}


struct Main: View {
    
//    @State var showSheet: Bool = false
    @EnvironmentObject var userData: UserModel
    
    var body: some View {
//        List {
//            NavigationLink (destination: Change(nickname: "", sex: "", pos: "", qq: "", wechat: "", subject: "", image: "")
//                                .environmentObject(userData)
//            ) {
//                HStack {
//                    Image(systemName: "person.text.rectangle")
//                    Text("个人信息更改")
//                }
//            }
//            NavigationLink(destination: Feedback()) {
//                HStack {
//                    Image(systemName: "phone")
//                    Text("反馈")
//                }
//            }
//
//            Section("") {
//                HStack {
//                    Image(systemName: "power")
//                    Text("登出")
//                }
//            }
//        }
        VStack {
            VStack {
                HStack {
                    Text("昵称：")
                        .bold()
                    Spacer()
                    Text(userData.nickname)
                }
                .padding(.horizontal, 30)
                .padding(.vertical)
                HStack {
                    Text("性别：")
                        .bold()
                    Spacer()
                    Text(userData.gender)
                }
                .padding(.horizontal, 30)
                HStack {
                    Text("专业：")
                        .bold()
                    Spacer()
                    Text(userData.major)
                }
                .padding(.horizontal, 30)
                .padding(.vertical)
            }
            .frame(width: 350, height: 150)
            .background(.white)
            .clipped()
            .shadow(radius: 5)
            .cornerRadius(10)
            VStack {
                HStack {
                    Text("校区：")
                        .bold()
                    Spacer()
                    Text(userData.campus)
                }
                .padding(.horizontal, 30)
                .padding(.vertical)
                HStack {
                    Text("QQ：")
                        .bold()
                    Spacer()
                    Text(userData.qq)
                }
                .padding(.horizontal, 30)
                HStack {
                    Text("微信：")
                        .bold()
                    Spacer()
                    Text(userData.wechat)
                }
                .padding(.horizontal, 30)
                .padding(.vertical)
            }
            .frame(width: 350, height: 150)
            .background(.white)
            .clipped()
            .shadow(radius: 5)
            .cornerRadius(10)
            .padding()
            Button(action: {}, label: {
                Text("退出登录")
                    .bold()
                    .font(.title2)
                    .frame(width: 350, height: 50)
                    .foregroundColor(.red)
                    .background(.white)
                    .cornerRadius(10)
            })
            NavigationLink(destination: Feedback()){
                Text("遇到问题了?点我反馈!")
                    .font(.caption)
                    .foregroundColor(.blue)
                    .padding(.leading, 230)
            }
        }
    }
}
