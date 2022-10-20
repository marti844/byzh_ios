//
//  CreatePostCardView.swift
//  twt
//
//  Created by Kean Shi on 2022/3/23.
//

import SwiftUI

struct CreatePostCardView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 7) {
                    Text("nickname")
                        .foregroundColor(.blue)
                    Text("申请加入您的拼车队伍")
                }
            }
            .padding(.trailing, 70)
            HStack{
                Button(action: {}, label: {
                    Text("同意")
                        .frame(width: 55, height: 30)
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
                    .padding(.trailing, 10)
                Button(action: {}, label: {
                    Text("拒绝")
                        .frame(width: 55, height: 30)
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
            }
            .padding(.leading, 170)
        }
        .frame(width: 340, height: 150)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct CreatePostCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostCardView()
    }
}
