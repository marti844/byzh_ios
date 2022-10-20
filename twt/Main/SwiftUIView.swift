//
//  SwiftUIView.swift
//  twt
//
//  Created by Kean Shi on 2022/1/29.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243/255, blue: 244/255)



struct DengluView: View {
    
    @State var id: String = ""
    @State var pwd: String = ""
    @State private var activeLink: Bool = false
    @StateObject var loginVM = LoginModel()
//    @State var isLogin: Bool = false
    
    private var isInputEmpty: Bool{
        if(id==""||pwd==""){
            return true
        }
        else{
            return false
        }
    }
    
    @State private var isTrue: Bool = false
    @State private var isWrong: Bool = false
    
    var body: some View {
        
        ZStack {
            if isTrue {
                TabViewnew()
            }
            else {
                VStack{
                    welcome()
                    TextField("请输入账号", text: $id)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                    SecureField("请输入密码", text: $pwd)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(10)
                        .padding(.bottom, 50)
                    if !isInputEmpty {
                        Button(action: {
                            loginVM.Login(id: self.id, pwd: self.pwd)
                            if loginVM.isExist ?? false { isWrong = false }
                            else { isWrong = true }
                        }, label: {
                            Text("登录")
                                .font(.title2)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .frame(width: 140, height: 60)
                                .background(.black)
                                .cornerRadius(30)
                        })
                    }
                    else {
                        Text("登录")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .frame(width: 140, height: 60)
                            .background(.gray)
                            .cornerRadius(30)
                    }
                    NavigationLink(destination: RegisterID()) {
                        Text("没有账号？点我注册！")
                            .foregroundColor(.blue)
                    }
                    .padding(.leading)
                    if isWrong {
                        Text("账号或密码错误")
                            .foregroundColor(.red)
                            .padding()
                    }
                    Spacer()
                }
                .padding(.top, 90)
                .frame(width: 350, height: 600)
                .navigationBarHidden(true)
            }
        }
        .onChange(of: loginVM.isExist, perform: { value in
            if(value == Optional(false)) {
                self.isTrue = false
            }
            else {
                print(value)
                self.isTrue = true
            }
        })
        .environmentObject(loginVM)
    }
}


struct DengluView_Previews: PreviewProvider {
    static var previews: some View {
        DengluView()
    }
}


//大写WelcomeView
struct welcome: View {
    var body: some View {
        ZStack(alignment: .center){
            Text("WELCOME")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 50)
            Image("下载")
                .resizable()
                .frame(width: 250, height: 60)
                .padding(.leading, 180)
                .padding(.bottom, 50)
                .opacity(0.3)
        }
    }
}
