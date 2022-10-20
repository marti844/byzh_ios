//
//  StudyCenterNavigationView.swift
//  twt
//
//  Created by Kean Shi on 2022/2/7.
//

import SwiftUI

struct StudyCenterNavigationView: UIViewControllerRepresentable {
    
    func makeCoordinator() -> StudyCenterCoordinator {
        return StudyCenterNavigationView.Coordinator(parent: self)
    }
    
    var view: StudyCenter
    
    var onSearch: (String)->()
    var onCancel: ()->()
    
    
    init(view: StudyCenter, onSearch: @escaping (String)->(),onCancel: @escaping ()->()) {
        self.view = view
        self.onSearch = onSearch
        self.onCancel = onCancel
    }
    
    func makeUIViewController(context: Context) -> UINavigationController {
        
        let studycenterView = UIHostingController(rootView: view)
        
        let controller = UINavigationController(rootViewController: studycenterView)
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Search For Knowledge"
        
        searchController.searchBar.delegate = context.coordinator
        
        searchController.obscuresBackgroundDuringPresentation = false
        
        controller.navigationBar.topItem?.searchController = searchController
        controller.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
    }
    
    class StudyCenterCoordinator: NSObject,UISearchBarDelegate {
        
        var parent: StudyCenterNavigationView
        
        init(parent: StudyCenterNavigationView) {
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
