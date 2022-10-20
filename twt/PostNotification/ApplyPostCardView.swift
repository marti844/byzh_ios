//
//  ApplyPostCardView.swift
//  twt
//
//  Created by Kean Shi on 2022/3/23.
//

import SwiftUI

struct ApplyPostCardView: View {

    
    var body: some View {
        VStack {
            HStack(spacing: 5) {
                Text("申请加入")
                Text("nickname")
                    .foregroundColor(.blue)
                Text("的")
                Text("拼车队伍")
            }
//            .padding(.bottom)
            .padding(.trailing, 60)
            HStack {
                Text("正在申请")
                    .frame(width: 90, height: 20)
                    .padding(.trailing, 110)
                Button(action: {}, label: {
                    Text("取消申请")
                        .frame(width: 90, height: 30)
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
//                    .padding(.trailing, 10)
            }
            .padding(.top)
        }
        .frame(width: 340, height: 120)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct ApplyPostCardView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyPostCardView()
    }
}
