//
//  StudentCenterNewView.swift
//  twt
//
//  Created by Kean Shi on 2022/2/9.
//

import SwiftUI

struct StudentCenterNewView: View {
    
    @State private var fromtime = Date.now
    @State private var totime = Date.now
    @State var timelen: Int = 5
    @State var frompos: String = ""
    @State var topos: String = ""
    @State var intro: String = ""
    @State var number: Int = 1
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("出发时间：",selection: $fromtime, in: Date()... )
                    .padding(.horizontal)
                DatePicker("截止时间：",selection: $totime, in: fromtime... )
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
                .padding(.bottom)
                Stepper(value: $timelen, in: 5...90, step: 5) {
                    Text("招募时常：\(timelen)  分钟")
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
                .padding(.bottom, 30)
                Button(action: {
                    
                }, label: {
                    Text("创建招募")
                        .foregroundColor(.white)
                        .frame(width: 130, height: 50)
                        .background(HomeMainColor)
                        .cornerRadius(8)
                })
            }
            .padding(.bottom, 100)
            .ignoresSafeArea()
            .navigationTitle("创建招募")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct StudentCenterNewView_Previews: PreviewProvider {
    static var previews: some View {
        StudentCenterNewView()
    }
}
