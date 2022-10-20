//
//  cardview.swift
//  twt
//
//  Created by Kean Shi on 2022/2/2.
//

import SwiftUI

let MainColor = Color(red: 164/255, green: 155/255, blue: 181/255)

struct UserCardView: View {
//    var user = User()
    let user: Post
    @State private var page: Int = 0
//    @StateObject var userData = UserData()
//    var item: Customer
//    @State var studentlist: [User] = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(user.id?.description ?? "")
                        .foregroundColor(.black)
//                    Text(user.postTime!)
//                        .foregroundColor(.black)
                }
            }
            .padding(.leading, 23)
            .padding(.bottom, -2)
            HStack {
                Text("出发地")
                    .frame(width: 60, height: 25)
                    .foregroundColor(.white)
                    .background(MainColor)
                    .cornerRadius(3)
                Text(user.startLocation ?? "")
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.bottom, -5)
            HStack {
                Text("目的地")
                    .foregroundColor(.white)
                    .frame(width: 60, height: 25)
                    .background(MainColor)
                    .cornerRadius(3)
                Text(user.destination ?? "")
                    .foregroundColor(.black)
            }
            .padding(.leading, 20)
            .padding(.bottom, -5)
            HStack {
                Text("拼车时间")
                    .foregroundColor(.white)
                    .frame(width: 75, height: 25)
                    .background(MainColor)
                    .cornerRadius(3)
                Text("\(user.year ?? 1)年\(user.month ?? 1)月\(user.day ?? 1)日 \(user.hour ?? 1):\(user.minute ?? 1)")
                    .foregroundColor(.black)
            }
            .padding(.leading, 20)
            .padding(.bottom, -5)
            HStack {
                Text("描述")
                    .foregroundColor(.white)
                    .frame(width: 45, height: 25)
                    .background(MainColor)
                    .cornerRadius(3)
                Text(user.content ?? "")
                    .foregroundColor(.black)
            }
            .padding(.leading, 20)
            .padding(.bottom, -5)
        }
        .frame(width: 340, height: 190)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
