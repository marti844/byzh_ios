//
//  StudyNewView.swift
//  twt
//
//  Created by Kean Shi on 2022/2/9.
//

import SwiftUI

struct StudyNewView: View {
    
    @State private var time = Date()
    @State var pos: String = ""
    @State var intro: String = ""
    
    var body: some View {
        VStack {
            DatePicker("学习时间：", selection: $time, in: Date()...)
                .padding()
            HStack {
                Text("地点：")
                Spacer()
                TextField("请输入一个地点", text: $pos)
                    .padding()
                    .frame(width: 265, height: 40)
                    .background(NewlightGreyColor)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            HStack {
                Text("描述：")
                Spacer()
                TextField("写一点简介吧（选填）", text: $intro)
                    .padding()
                    .frame(width: 265, height: 150)
                    .background(NewlightGreyColor)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding(.bottom, 270)
        .ignoresSafeArea()
        .navigationTitle("创建帖子")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct StudyNewView_Previews: PreviewProvider {
    static var previews: some View {
        StudyNewView()
    }
}
