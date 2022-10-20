//
//  Feedback.swift
//  twt
//
//  Created by Kean Shi on 2022/2/27.
//

import SwiftUI

struct Feedback: View {
    
    @State var commend: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("意见和建议：")
                    .font(.title2)
                    .padding(.bottom)
                TextField("    这里是意见和建议的内容", text: $commend)
                    .frame(width: 350, height: 200)
                    .background(lightGreyColor)
                    .shadow(radius: 1)
            }
            .padding(.top, 50)
            Button(action: {
                
            }, label: {
                Text("提  交")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 180, height: 60)
                    .background(HomeMainColor)
                    .cornerRadius(10)
                    .padding(.top, 100)
            })
            
            Spacer()
        }
        .navigationTitle("反馈")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Feedback_Previews: PreviewProvider {
    static var previews: some View {
        Feedback()
    }
}
