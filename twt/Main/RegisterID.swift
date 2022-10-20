//
//  RegisterID.swift
//  twt
//
//  Created by Kean Shi on 2022/2/27.
//

import SwiftUI

struct RegisterID: View {
    
    @State var id: String = ""
    @State var pwd: String = ""
    @State var comfirm: String = ""
    
    private var isSame: Bool {
        if (pwd == comfirm) { return true }
        else { return false }
    }
    
    private var isInputID: Bool {
        if (id == "") { return false }
        else { return true }
    }
    
    private var isInputpwd: Bool {
        if (pwd == "") { return false }
        else { return true }
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
            HStack {
                Text("ID:")
                    .font(.title3)
                TextField("   请输入您的账号", text: $id)
                    .frame(width:300, height: 45)
                    .background(lightGreyColor)
                    .cornerRadius(10)
                    .padding(.leading, 20)
                Spacer()
            }
            .padding(.leading)
            .padding(.bottom)
            HStack {
                Text("密码:")
                    .font(.title3)
                SecureField("   请设置您的密码", text: $pwd)
                    .frame(width:300, height: 45)
                    .background(lightGreyColor)
                    .cornerRadius(10)
                Spacer()
            }
            .padding(.leading)
            .padding(.bottom)
            HStack {
                Text("重复密码:")
                    .font(.title3)
                SecureField("   请重复您的密码", text: $comfirm)
                    .frame(width: 260, height: 45)
                    .background(lightGreyColor)
                    .cornerRadius(10)
                Spacer()
            }
            .padding(.leading)
            Spacer()
            if !isInputID {
                Text("请输入账号")
                    .foregroundColor(.red)
                    .padding()
            }
            else if !isInputpwd {
                Text("请输入密码")
                    .foregroundColor(.red)
            }
            else {
                if !isSame {
                    Text("两次密码输入不一致")
                        .foregroundColor(.red)
                }
                else {
                    NavigationLink(destination: RegisterView(nickname: "", sex: "", pos: "", qq: "", wechat: "", subject: "", image: "")) {
                        Text("下一步")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(width: 180, height: 60)
                            .background(HomeMainColor)
                            .cornerRadius(10)
                    }
                }
            }
            Spacer()
        }
        .navigationTitle("注册")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RegisterID_Previews: PreviewProvider {
    static var previews: some View {
        RegisterID()
    }
}
