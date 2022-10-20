//
//  messageiew.swift
//  twt
//
//  Created by Kean Shi on 2022/2/7.
//

import SwiftUI

let MessageMainColor = Color(red: 164/255, green: 155/255, blue: 181/255)

struct MessageView: View {
    
    var item: MessageItem
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(item.image)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(item.name)
                        .foregroundColor(.black)
                    Text(item.time)
                        .foregroundColor(.black)
                }
            }
            .padding(.leading, 23)
            .padding(.bottom, -2)
            HStack {
                Text("出发时间")
                    .frame(width: 75, height: 25)
                    .foregroundColor(.white)
                    .background(MessageMainColor)
                    .cornerRadius(3)
                Text(item.time)
                    .foregroundColor(.black)
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
                    .foregroundColor(.black)
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
                    .foregroundColor(.black)
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
                    .foregroundColor(.black)
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
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.leading, 20)
        }
        .frame(width: 340, height: 210)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(item: messages[0])
    }
}
