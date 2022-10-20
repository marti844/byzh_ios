//
//  MessageList.swift
//  twt
//
//  Created by Kean Shi on 2022/2/7.
//

import SwiftUI

struct MessageList: View {
    @State var messagelist = messages
    var body: some View {
        MessageNavigationView (view: Home(filteredItem: $messagelist), onSearch: { (txt) in
            
            if txt != "" {
                self.messagelist = messages.filter{$0.topos.lowercased().contains(txt.lowercased())}
            }
            else  {
                self.messagelist = messages
            }
            
        }, onCancel: {
            
            self.messagelist = messages
        })
            .ignoresSafeArea()
            .navigationTitle("拼车")
            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing, content: <#T##() -> _#>)
//            }
    }
}

struct MessageList_Previews: PreviewProvider {
    static var previews: some View {
        MessageList()
    }
}
