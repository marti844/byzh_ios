//
//  StudyCenterList.swift
//  twt
//
//  Created by Kean Shi on 2022/2/7.
//

import SwiftUI

struct StudyCenterList: View {
    @State var studycenterlist = studycentermessages
    var body: some View {
        //swiftUI也可以干相同的事
        StudyCenterNavigationView (view: StudyCenter(filteredItem: $studycenterlist), onSearch: { (txt) in
            
            if txt != "" {
                self.studycenterlist = studycentermessages.filter{$0.time.lowercased().contains(txt.lowercased())}
            }
            else {
                self.studycenterlist = studycentermessages
            }
            
        }, onCancel: {
            
            self.studycenterlist = studycentermessages
        })
            .ignoresSafeArea()
            .navigationTitle("学习")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct StudyCenterList_Previews: PreviewProvider {
    static var previews: some View {
        StudyCenterList()
    }
}
