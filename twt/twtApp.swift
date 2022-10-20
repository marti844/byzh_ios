//
//  twtApp.swift
//  twt
//
//  Created by Kean Shi on 2022/1/28.
//

import SwiftUI


struct twtApp1: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ShouyeView()
            }
        }
    }
}

@main
struct twtApp2: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                DengluView()
            }
        }
    }
}

struct twtApp3: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                NotificationView()
            }
        }
    }
}

struct twtApp4: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CenterView()
            }
        }
    }
}

struct twtApp5: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabViewnew()
            }
        }
    }
}



