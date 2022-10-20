//
//  NewView.swift
//  twt
//
//  Created by Kean Shi on 2022/2/8.
//

import SwiftUI

let NewlightGreyColor = Color(red: 239.0/255.0, green: 243/255, blue: 244/255)

struct NewView: View {
    
    @State private var time = Date.now
    @State var frompos: String = ""
    @State var topos: String = ""
    @State var intro: String = ""
    @State var number: Int = 1
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("拼车时间：",selection: $time, in: Date()... )
                    .padding()
                HStack {
                    Text("出发地：")
                    Spacer()
                    TextField("请输入你的出发地", text: $frompos)
                        .padding()
                        .frame(width: 265, height: 40)
                        .background(NewlightGreyColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                HStack {
                    Text("目的地：")
                    Spacer()
                    TextField("请输入你的目的地", text: $topos)
                        .padding()
                        .frame(width: 265, height: 40)
                        .background(NewlightGreyColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                Stepper("招募人数：\(number)", value: $number, in:1...3)
                    .padding()
                HStack {
                    Text("描述：")
                    Spacer()
                    TextField("写一点简介吧（选填）", text: $intro)
                        .padding()
                        .frame(width: 265, height: 150)
                        .background(NewlightGreyColor)
                        .cornerRadius(10)
                }
                
                .padding(.horizontal)
                .padding(.top)
                Button(action: {
                    
                }, label: {
                    Text("创建招募")
                        .foregroundColor(.white)
                        .frame(width: 130, height: 50)
                        .background(HomeMainColor)
                        .cornerRadius(8)
                })
            }
            .padding(.bottom, 170)
            .ignoresSafeArea()
            .navigationTitle("创建帖子")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewView()
    }
}
