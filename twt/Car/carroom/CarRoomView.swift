//
//  CarRoomView.swift
//  twt
//
//  Created by Kean Shi on 2022/2/1.
//

import SwiftUI

struct CarRoomView: View {
    
    
    @StateObject var userData = PostModel()
//    @Binding var studentlist: [User]
    
    //    var user = User()
    
    var body: some View {
        VStack {
            Carnavigationbar()
            Scroll()
        }
    }
}

struct CarroomView_Previews: PreviewProvider {
    
    @StateObject var userData = PostModel()
    
    static var previews: some View {
             CarRoomView()
    }
}


struct Carnavigationbar: View {
    
    @Environment(\.dismiss) var dismiss
    @State var showingSheet = false
    
    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }, label: {
                HStack {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .foregroundColor(.black)
                    .frame(width: 12, height: 18)
//                    Text("返回")
//                        .foregroundColor(.black)
                }
            })
            Spacer()
            Text("拼车")
                .font(.title2)
                .padding(.leading)
            Spacer()
            Button(action: {
                showingSheet.toggle()
            }, label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(HomeMainColor)
            })
                .sheet(isPresented: $showingSheet) {
                    NewView()
                }
        }
        .padding(.horizontal)
        .padding()
        .navigationBarHidden(true)
    }
}

//struct Scroll: View {
//
//    @StateObject var userData = UserViewModel()
//
//    var body: some View {
//        ScrollView(.vertical, showsIndicators: true) {
//            ForEach(userData.users.indices, id: \.self) {i in
//                NavigationLink(destination: carDetailView(user: userData.users[i]), label: {
//                    UserCardView(user: userData.users[i])
//                })
//            }
//        }
//    }
//}

struct Scroll: View {
    
    @StateObject var userData = PostModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(userData.posts.indices, id: \.self) {id in
                NavigationLink(destination: carDetailView(user: userData.posts[id]), label: {
                    UserCardView(user: userData.posts[id])
                })
            }
        }
    }
}
