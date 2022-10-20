//
//  ContentView.swift
//  twt
//
//  Created by Kean Shi on 2022/1/28.
//

import SwiftUI

let HomeMainColor = Color(red: 164/255, green: 155/255, blue: 181/255)
let LightMainColor = Color(red: 204/255, green: 202/255, blue: 220/255)


struct ShouyeView: View {
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [LightHomeMainColor, .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            VStack {
                VStack{
                    Text("首页")
                        .font(.title2)
                }
//                VStack{
//                    Text("Notification")
//                        .frame(width: 400, height: 110)
//
//                }
//                .background(.white)
//                .clipped()
//                .shadow(radius: 1)
//                .padding(.bottom, 20)
                NavigationLink(destination: CarRoomView()) {
                    // 替换
                    CardView(title: "拼车", imageName: "car", backgroundColor: .white, content: "点击查看热门拼车信息")
    //                VStack {
    //                    HStack {
    //                        Text("拼车")
    //                            .font(.title2)
    //                            .fontWeight(.bold)
    //                            .foregroundColor(Color.white)
    //                            .padding(.leading, 150)
    //                        Spacer()
    //                        Image(systemName: "car")
    //                            .resizable()
    //                            .foregroundColor(.white)
    //                            .frame(width: 80, height: 67)
    //                            .padding(.top, 35)
    //                            .padding(.bottom, 20)
    //                            .padding(.trailing, 15)
    //                            .opacity(0.3)
    //                    }
    //                    .frame(width: 350, height: 140)
    //                    .background(HomeMainColor)
    //                    .cornerRadius(15)
    //                    .shadow(radius: 10)
    //                    .padding(.bottom, 8)
    //                }
                }
                .padding(.top)
    //            .isDetailLink(true)
    //            NavigationLink(destination: StudyTabView()) {
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("学习")
                                    .font(.title2)
                                    .foregroundColor(.black)
//                                    .padding(.trailing, 110)
                                Text("图书馆约起来！")
//                                    .frame(width: 200, height: 30)
                                    .padding(.bottom,60)
                                    .padding(.top, 5)
                                    .foregroundColor(.gray)
//                                    .padding(.trailing, 40)

                            }
                            .padding(.leading, 30)
                            Spacer()
                            Image(systemName: "books.vertical")
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width: 60, height: 70)
                                .padding(.top, 70)
                                .padding(.trailing, 30)
                                .opacity(0.3)
                        }
                        .frame(width: 350, height: 170)
                        .background(LightMainColor)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .padding(.vertical, 20)
    //            }
                VStack {
                    ZStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("吃喝玩乐")
                                .font(.title2)
                                .foregroundColor(.black)
//                                .padding(.leading, 128)
                            Text("今天没有课，做些有意思的事情吧！")
//                                .frame(width: 300, height: 30)
                                .foregroundColor(.gray)
                                .opacity(0.5)
                        }
                        .padding(.trailing, 13)
                        .frame(width: 400, height: 80)
                        .padding(.bottom, 60)
                        Spacer()
                        Image(systemName: "building.2")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width: 60, height: 70)
                            .padding(.top, 70)
                            .padding(.leading, 230)
                            .opacity(0.3)

                    }
                    .frame(width: 350, height: 170)
                    .background(.white)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .padding(.top, 8)
                }
                Spacer()
            }
            .padding(.top)
    //        .padding(.bottom, 60)
            .navigationTitle("")
        .navigationBarHidden(true)
        }
    }
}

struct ShouyeView_Previews: PreviewProvider {
    static var previews: some View {
        ShouyeView()
    }
}




//可以这样抽象出一个CardView
fileprivate struct CardView: View {
    let title: String
    let imageName: String
    let backgroundColor: Color
    let content: String
    
    var body: some View {
        HStack {
            VStack(spacing: 2) {
                Text(title)
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(.trailing, 110)
                Text(content)
                    .frame(width: 200, height: 30)
                    .padding(.bottom,60)
                    .padding(.leading)
            }
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 60, height: 45)
                .padding(.top, 95)
                .padding(.trailing, 30)
                .opacity(0.3)
        }
        .frame(width: 350, height: 170)
        .background(backgroundColor)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.bottom, 8)
    }
}
