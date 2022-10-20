//
//  StudyNavigationView.swift
//  twt
//
//  Created by Kean Shi on 2022/2/7.
//
//
//import SwiftUI
//
//struct StudyNavigationView: UIViewControllerRepresentable {
//    
//    func makeCoordinator() -> StudyCoordinator {
//        return StudyNavigationView.Coordinator(parent: self)
//    }
//    
//    var view: StudyHome
//    
//    var onSearch: (String)->()
//    var onCancel: ()->()
//    
//    
//    init(view: StudyHome, onSearch: @escaping (String)->(),onCancel: @escaping ()->()) {
//        self.view = view
//        self.onSearch = onSearch
//        self.onCancel = onCancel
//    }
//    
//    func makeUIViewController(context: Context) -> UINavigationController {
//        
//        let studyView = UIHostingController(rootView: view)
//        
//        let controller = UINavigationController(rootViewController: studyView)
//        
//        let searchController = UISearchController()
//        searchController.searchBar.placeholder = "Search For Knowledge"
//        
//        searchController.searchBar.delegate = context.coordinator
//        
//        searchController.obscuresBackgroundDuringPresentation = false
//        
//        controller.navigationBar.topItem?.searchController = searchController
//        controller.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
//        
//        return controller
//    }
//    
//    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
//        
//    }
//    
//    
//    class StudyCoordinator: NSObject,UISearchBarDelegate {
//        
//        var parent: StudyNavigationView
//        
//        init(parent: StudyNavigationView) {
//            self.parent = parent
//        }
//        
//        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//            
//            self.parent.onSearch(searchText)
//        }
//        
//        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//            
//            
//            self.parent.onCancel()
//        }
//    }
//}
