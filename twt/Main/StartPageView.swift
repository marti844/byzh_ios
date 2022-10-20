//
//  StartPageView.swift
//  twt
//
//  Created by Kean Shi on 2022/3/25.
//

import SwiftUI

struct StartPageView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("北洋杂烩")
                .font(.largeTitle)
                .bold()
                .foregroundColor(HomeMainColor)
            Spacer()
            Text("天外天工作室")
                .font(.title3)
                .foregroundColor(.gray)
                .padding()
            Text("成双成队")
                .foregroundColor(.gray)
                .padding(.bottom, 60)
        }
        .padding(.top, 50)
    }
}

struct StartPageView_Previews: PreviewProvider {
    static var previews: some View {
        StartPageView()
    }
}
