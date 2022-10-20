//
//  carDetailView.swift
//  twt
//
//  Created by Kean Shi on 2022/2/11.
//

import SwiftUI

struct carDetailView: View {
    
    @State var user: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text("dddd")
                    Text(user.postTime ?? "")
                        .foregroundColor(LightHomeMainColor)
                }
            }
            .padding(.leading, 23)
            .padding(.bottom, 15)
            HStack {
                Text("出发地")
                    .frame(width: 60, height: 25)
                    .foregroundColor(.white)
                    .background(MainColor)
                    .cornerRadius(3)
                Text(user.startLocation ?? "")
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
            }
            .padding(.leading, 20)
            .padding(.bottom, -5)
            HStack {
                VStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 70, height: 70)
                        .padding(.horizontal, 10)
                    Text("jjjjjjj")
                }
                
                Divider()
                    .background(.black)
                    .scaleEffect(CGSize(width: 1, height: 1.5))
                VStack(alignment: .center) {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 70, height: 70)
                        .foregroundColor(.gray)
                        .padding(.trailing, 5)
                        .padding(.horizontal, 10)
                    Text("点击加入")
                }
                .frame(width: 80, height: 80)
                VStack {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 70, height: 70)
                        .foregroundColor(.gray)
                        .padding(.trailing, 5)
                        .padding(.horizontal, 10)
                    Text("点击加入")
                }
                .frame(width: 80, height: 80)
                VStack {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 70, height: 70)
                        .foregroundColor(.gray)
                        .padding(.trailing, 5)
                        .padding(.horizontal, 10)
                    Text("点击加入")
                }
                .frame(width: 80, height: 80)
            }
            .frame(width: 300, height: 70)
            .padding(.leading, 45)
            .padding(.top, 170)
            Spacer()
        }
        .padding(.top)
        .navigationTitle("帖子详情")
    }
}

//struct carDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        carDetailView()
//    }
//}
