//
//  URLTest.swift
//  twt
//
//  Created by Kean Shi on 2022/2/17.
//

//import SwiftUI
//
//struct URLTest: View {
//
//    @State private var text = ""
//
//    var body: some View {
//        VStack {
//            Text(text)
//                .font(.title)
//            Button(action: {
//                self.startLoad()
//            }) {
//                Text("START").font(.largeTitle)
//            }
//
//            Button(action: {
//                self.text = ""
//            }) {
//                Text("CLEAR").font(.largeTitle)
//            }
//        }
//    }
//
//    func startLoad() {
//        let url = URL(string: "https://github.com/xiaoyouxinqing/PostDemo/raw/master/PostDemo/Resources/PostListData_hot_1.json")!
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                self.updateText(error.localizedDescription)
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse,
//                  httpResponse.statusCode == 200 else {
//                      self.updateText("Invalid response")
//                      return
//                  }
//
//            guard let data = data else {
//                self.updateText("no data")
//                return
//            }
//
//            guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
//                self.updateText("hhhh")
//                return
//            }
//
//            self.updateText("Post count \(list.list.count)")
//        }
//        task.resume()
//    }
//    func updateText(_ text: String) {
//        DispatchQueue.main.async {
//            self.text = text
//        }
//    }
//}
//
//struct URLTest_Previews: PreviewProvider {
//    static var previews: some View {
//        URLTest()
//    }
//}
