//
//  StudyCenterView.swift
//  twt
//
//  Created by Kean Shi on 2022/2/7.
//

import SwiftUI

struct StudyCenterView: View {
    var item: StudyCenterItem
    
    var body: some View {
        VStack {
            HStack {
                Text("学习时间")
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
                Text("地点")
                    .frame(width: 45, height: 25)
                    .foregroundColor(.white)
                    .background(MessageMainColor)
                    .cornerRadius(3)
                Text(item.pos)
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
        }
        .frame(width: 340, height: 130)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

