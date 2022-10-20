//
//  NavigationBar.swift
//  PeiYang Lite
//
//  Created by Zrzz on 2021/3/12.
//
import SwiftUI

struct NavigationBar<Leading, Center, Trailing>: View where Leading: View, Center: View, Trailing: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    let leading: Leading?
    let center: Center?
    let trailing: Trailing?
    
    @State private var safeAreaHeight: CGFloat = 0
    
    init (@ViewBuilder leading: () -> Leading? = { nil }, @ViewBuilder center: () -> Center? = { nil }, @ViewBuilder trailing: () -> Trailing? = { nil }) {
        self.leading = leading()
        self.center = center()
        self.trailing = trailing()
    }
    
    var body: some View {
        ZStack {
            HStack {
                if leading != nil {
                    leading!
                } else {
                    Button(action: {
                        self.mode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                        // 我也不知道为啥有了text，这个button就能用……
                        Text("idontknowwhy").opacity(0)
                        
                    }
                    .font(.title2)
//                    .foregroundColor(.init(0x636779))
                    .padding()
                }
                
                Spacer()
                
                if trailing != nil {
                    trailing!
                }
            }
            
            if center != nil {
                center!
            }
        }
        .padding(.top, safeAreaHeight)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .onAppear {
            if !UIApplication.shared.windows.isEmpty {
                let top = UIApplication.shared.windows[0].safeAreaInsets.top
                let bottom = UIApplication.shared.windows[0].safeAreaInsets.bottom
                safeAreaHeight = bottom > 0 ? 0 : top
            }
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            NavigationBar(center: {
                Text("拼车")
                    .foregroundColor(.black)
            }, trailing: {
                Button(action: {}, label: {
                    Image(systemName: "plus.square")
                })
                .font(.title2)
                .padding()
            })
            Spacer()
        }
    }
}

extension NavigationBar where Leading == EmptyView, Center == EmptyView, Trailing == EmptyView {
    init () {
        self.leading = nil
        self.center = nil
        self.trailing = nil
    }
}

extension NavigationBar where Leading == EmptyView, Center == EmptyView {
    init (@ViewBuilder trailing: () -> Trailing? = { nil }) {
        self.leading = nil
        self.center = nil
        self.trailing = trailing()
    }
}

extension NavigationBar where Leading == EmptyView, Trailing == EmptyView {
    init (@ViewBuilder center: () -> Center? = { nil }) {
        self.leading = nil
        self.center = center()
        self.trailing = nil
    }
}

extension NavigationBar where Center == EmptyView {
    init (@ViewBuilder leading: () -> Leading? = { nil }, @ViewBuilder trailing: () -> Trailing? = { nil }) {
        self.leading = leading()
        self.center = nil
        self.trailing = trailing()
    }
}

extension NavigationBar where Leading == EmptyView {
    init (@ViewBuilder center: () -> Center? = { nil }, @ViewBuilder trailing: () -> Trailing? = { nil }) {
        self.leading = nil
        self.center = center()
        self.trailing = trailing()
    }
}

extension NavigationBar where Trailing == EmptyView {
    init (@ViewBuilder leading: () -> Leading? = { nil }, @ViewBuilder center: () -> Center? = { nil }) {
        self.leading = leading()
        self.center = center()
        self.trailing = nil
    }
}


// More to Complete if needed
