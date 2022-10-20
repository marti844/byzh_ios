//
//  CenterDetail.swift
//  twt
//
//  Created by Kean Shi on 2022/2/11.
//

import SwiftUI

struct CenterDetail: View {
    
    var item: MessageItem
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(item.image)
                        .resizable()
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .foregroundColor(.black)
                        Text(item.time)
                            .foregroundColor(.black)
                    }
                }
                .padding(.leading, 23)
                .padding(.bottom, 15)
                HStack {
                    Text("出发时间")
                        .frame(width: 75, height: 25)
                        .foregroundColor(.white)
                        .background(MessageMainColor)
                        .cornerRadius(3)
                    Text(item.time)
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.bottom, -5)
                HStack {
                    Text("出发地")
                        .frame(width: 60, height: 25)
                        .foregroundColor(.white)
                        .background(MessageMainColor)
                        .cornerRadius(3)
                    Text(item.frompos)
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.bottom, -5)
                HStack {
                    Text("目的地")
                        .frame(width: 60, height: 25)
                        .foregroundColor(.white)
                        .background(MessageMainColor)
                        .cornerRadius(3)
                    Text(item.topos)
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.bottom, -5)
                HStack {
                    Text("需要人数")
                        .frame(width: 75, height: 25)
                        .foregroundColor(.white)
                        .background(MessageMainColor)
                        .cornerRadius(3)
                    Text(item.number)
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.bottom, -5)
                HStack {
                    Text("描述")
                        .frame(width: 45, height: 25)
                        .foregroundColor(.white)
                        .background(MessageMainColor)
                        .cornerRadius(3)
                    Text(item.intro)
                    Spacer()
                }
                .padding(.leading, 20)
                Spacer()
            }
            .padding(.top)
            .navigationTitle("帖子详情")
        }
    }
}

struct CenterDetail_Previews: PreviewProvider {
    static var previews: some View {
        CenterDetail(item: messages[0])
    }
}
