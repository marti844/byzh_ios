//
//  RegisterView.swift
//  twt
//
//  Created by Kean Shi on 2022/2/27.
//

import SwiftUI

struct RegisterView: View {
    
    @State var nickname: String
    @State var sex: String
    @State var pos: String
    @State var qq: String
    @State var wechat: String
    @State var subject: String
    @State var image: String
    @State var sexselection: String = "N"
    @State var compusselection: String = "N"
    
    private var isLong: Bool {
        if nickname.count > 10 { return true }
        else { return false }
    }
    
    var body: some View {
        VStack {
            Text("注册账号")
                .font(.title2)
                .frame(width: 350, height: 55)
                .background(HomeMainColor)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
            VStack {
                HStack {
                    Text("昵称:")
                        .font(.title3)
                    TextField("（必填）", text: $nickname)
                        .frame(width:300, height: 45)
                        .background(lightGreyColor)
                        .cornerRadius(10)
                    Spacer()
                }
                .padding(.leading)
                .padding(.bottom)
                HStack {
                    Text("性别:")
                        .font(.title3)
                    Picker(
                        selection: $sexselection,
                        label: Text("Picker"),
                        content: {
                            Text("男").tag("M")
                            //                                Text("保密").tag("N")
                            Text("女").tag("F")
                        })
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.trailing, 80)
                        .padding(.leading, 60)
                }
                .padding(.leading)
                .padding(.bottom)
                HStack {
                    Text("校区:")
                        .font(.title3)
                    Picker(
                        selection: $compusselection,
                        label: Text("Picker"),
                        content: {
                            Text("北洋园校区").tag("B")
                            //                                Text("未选择").tag("N")
                            Text("卫津路校区").tag("W")
                        })
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.trailing, 20)
                }
                .padding(.leading)
                .padding(.bottom)
            }
            HStack {
                Text("QQ:  ")
                    .font(.title3)
                TextField("（选填）", text: $qq)
                    .frame(width: 300, height: 45)
                    .background(lightGreyColor)
                    .cornerRadius(10)
                Spacer()
            }
            .padding(.leading)
            .padding(.bottom)
            HStack {
                Text("微信:")
                    .font(.title3)
                TextField("（选填）", text: $wechat)
                    .frame(width: 300, height: 45)
                    .background(lightGreyColor)
                    .cornerRadius(10)
                Spacer()
            }
            .padding(.leading)
            .padding(.bottom)
            HStack {
                Text("专业:")
                    .font(.title3)
                TextField("（选填）", text: $subject)
                    .frame(width: 300, height: 45)
                    .background(lightGreyColor)
                    .cornerRadius(10)
                    Spacer()
            }
            .padding(.leading)
            .padding(.bottom, 60)
            if !isLong {
                NavigationLink(destination: TabViewnew()) {
                    Text("确定提交/更改")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 180, height: 60)
                        .background(HomeMainColor)
                        .cornerRadius(10)
                }
            }
            else {
                Text("昵称长度必须小于10个字符")
                    .foregroundColor(.red)
            }
            Spacer()
        }
        .navigationTitle("注册")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(nickname: "", sex: "", pos: "", qq: "", wechat: "", subject: "", image: "")
    }
}
