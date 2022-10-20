//
//  Change.swift
//  twt
//
//  Created by Kean Shi on 2022/2/22.
//

import SwiftUI

struct Change: View {
    
    @EnvironmentObject var userData: UserModel
    
    
    var body: some View {
        
        ZStack {
           
            LinearGradient(gradient: .init(colors: [LightHomeMainColor, .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            VStack {
                navigationbar()
                    .padding(.top, 55)
                Spacer()
//                VStack {
//                    Image(systemName: "person.crop.circle.fill")
//                        .resizable()
//                        .clipShape(Circle())
//                        .frame(width: 130, height: 130)
//                    Text(userData.nickname)
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .padding()
//                }
//                .padding(.top, 25)
//                .environmentObject(userData)
                VStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 130, height: 130)
                    Text("userData.nickname")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                }
                .padding(.top)
//                .environmentObject(userData)
                changebody(id: "", nickname: "", pwd: "", gender: "", campus: "", qq: "", wechat: "", major: "", heading: "")
                
            }
            
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .ignoresSafeArea(.all)
    }
}

struct Change_Previews: PreviewProvider {
    static var previews: some View {
        Change()
    }
}

struct navigationbar: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }, label: {
                HStack {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .foregroundColor(.black)
                    .frame(width: 12, height: 18)
                    Text("返回")
                        .foregroundColor(.black)
                }
            })
            Spacer()
            Text("更改您的信息")
                .font(.title2)
            Spacer()
            Button(action: {  }, label: {
                Text("保存")
                    .foregroundColor(.white)
                    .frame(width: 50, height: 30)
                    .background(HomeMainColor)
                    .cornerRadius(5)
            })
        }
        .padding(.horizontal)
    }
}

struct changebody: View {
    
    @State var id: String
    @State var nickname: String
    @State var pwd: String
    @State var gender: String = "N"
    @State var campus: String = "N"
    @State var qq: String
    @State var wechat: String
    @State var major: String
    @State var heading: String
    
    
    private var isLong: Bool {
        if nickname.count > 10 { return true }
        else { return false }
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("昵称：")
                        .bold()
                    TextField("jjj", text: $nickname)
                        .multilineTextAlignment(.trailing)
                }
                .padding(.horizontal, 25)
                .padding(.vertical)
                HStack {
                    Text("性别：")
                        .bold()
                    Picker(
                        selection: $gender,
                        label: Text("Picker"),
                        content: {
                            Text("男").tag("M")
                            //                                Text("保密").tag("N")
                            Text("女").tag("F")
                        })
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.leading, 120)
                }
                .padding(.horizontal, 25)
                HStack {
                    Text("专业：")
                        .bold()
                    TextField("jjj", text: $major)
                        .multilineTextAlignment(.trailing)
                }
                .padding(.horizontal, 25)
                .padding(.vertical)
            }
            .frame(width: 350, height: 170)
            .background(.white)
            .clipped()
            .shadow(radius: 5)
            .cornerRadius(10)
            .padding()
            
            VStack {
                HStack {
                    Text("校区：")
                        .bold()
                    Picker(
                        selection: $campus,
                        label: Text("Picker"),
                        content: {
                            Text("北洋园").tag("X")
                            //                                Text("保密").tag("N")
                            Text("卫津路").tag("L")
                        })
                        .pickerStyle(SegmentedPickerStyle())
//                        .padding(.trailing, 80)
                        .padding(.leading, 120)
                }
                .padding(.horizontal, 25)
                .padding(.vertical)
                HStack {
                    Text("QQ：")
                        .bold()
                    TextField("jjj", text: $qq)
                        .multilineTextAlignment(.trailing)
                }
                .padding(.horizontal, 25)
                HStack {
                    Text("微信：")
                        .bold()
                    TextField("jjj", text: $wechat)
                        .multilineTextAlignment(.trailing)
                }
                .padding(.horizontal, 25)
                .padding(.vertical)
            }
            .frame(width: 350, height: 170)
            .background(.white)
            .clipped()
            .shadow(radius: 5)
            .cornerRadius(10)
            .padding()
            Spacer()
        }
    }
}



//struct heading: View {
//
//    @EnvironmentObject var userData: UserModel
//
//    var body: some View {
//        VStack {
//            Image(systemName: "person.crop.circle.fill")
//                .resizable()
//                .clipShape(Circle())
//                .frame(width: 130, height: 130)
//            Text(userData.nickname)
//                .font(.title2)
//                .fontWeight(.bold)
//                .padding()
//        }
//        .padding(.top, 25)
//        .environmentObject(userData)
//    }
//}

//struct submit: View {
//    var body: some View {
//        Button(action: {
//            CenterView.name = self.nickname
//        }) {
//            Text("确定提交/更改")
//                .font(.title2)
//                .foregroundColor(.white)
//                .frame(width: 180, height: 60)
//                .background(HomeMainColor)
//                .cornerRadius(10)
//        }
//    }
//}
