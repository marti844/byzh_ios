//
//  MessageNavigationView.swift
//  twt
//
//  Created by Kean Shi on 2022/2/7.
//

import SwiftUI

struct MessageNavigationView: UIViewControllerRepresentable {
    
    func makeCoordinator() -> MessageCoordinator {
        return MessageNavigationView.Coordinator(parent: self)
    }
    
    var view: Home
    
    var onSearch: (String)->()
    var onCancel: ()->()
    
    
    init(view: Home, onSearch: @escaping (String)->(),onCancel: @escaping ()->()) {
        self.view = view
        self.onSearch = onSearch
        self.onCancel = onCancel
    }
    
    func makeUIViewController(context: Context) -> UINavigationController {
        
        let messageView = UIHostingController(rootView: view)
        
        let controller = UINavigationController(rootViewController: messageView)
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Search For Fun"
        
        searchController.searchBar.delegate = context.coordinator
        
        searchController.obscuresBackgroundDuringPresentation = false
        
        
        
        controller.navigationBar.topItem?.searchController = searchController
        controller.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
    }
    
    
    class MessageCoordinator: NSObject,UISearchBarDelegate {
        
        var parent: MessageNavigationView
        
        init(parent: MessageNavigationView) {
            self.parent = parent
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            self.parent.onSearch(searchText)
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            
            
            self.parent.onCancel()
        }
    }
}
