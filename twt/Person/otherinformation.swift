//
//  otherinformation.swift
//  twt
//
//  Created by Kean Shi on 2022/3/15.
//

import SwiftUI

struct otherinformation: View {
    
    var nickname:String = "用户名"
    
    var body: some View {
        VStack {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 75, height: 75)
                .clipShape(Circle())
            Text(nickname)
                .font(.title3)
                .padding(.top)
                .padding(.bottom, 70)
            VStack {
                HStack {
                    Text("性别：")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("女")
                }
                Divider()
                //                .scaleEffect(.CGSize)
                           
            }
            .padding(.horizontal, 30)
            .padding(.bottom)
            VStack {
                HStack {
                    Text("校区：")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("北洋园")
                    
                }
                Divider()
            }
            .padding(.horizontal, 30)
            .padding(.bottom)
            VStack {
                HStack {
                    Text("QQ：")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("1111111")
                }
                Divider()
            }
            .padding(.horizontal, 30)
            .padding(.bottom)
            VStack {
                HStack {
                    Text("微信：")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("未完善")
                }
                Divider()
            }
            .padding(.horizontal, 30)
            .padding(.bottom)
            VStack {
                HStack {
                    Text("专业：")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("智能与计算")
                }
                Divider()
            }
            .padding(.horizontal, 30)
            Spacer()
        }
        .padding(.top, 30)
        .navigationTitle("发起人信息")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct otherinformation_Previews: PreviewProvider {
    static var previews: some View {
        otherinformation()
    }
}
