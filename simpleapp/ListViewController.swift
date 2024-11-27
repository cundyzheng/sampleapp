//
//  ListViewController.swift
//  simpleapp
//
//  Created by Cundy Sunardy on 27/11/24.
//

import Foundation
import SwiftUI
import UIKit

class ListViewController: UIViewController, ObservableObject {
    
    let networkFetcher: NetworkFetcherProtocol
    
    @Published var posts: [PostModel] = []
    
    init(networkFetcher: NetworkFetcherProtocol = NetworkFetcher()) {
        self.networkFetcher = networkFetcher
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadPost() {
        networkFetcher.fetchPost { result in
            switch result {
            case .success(let posts):
                self.posts = posts
            case .failure(let error):
                print("Failed to fetch posts: \(error.localizedDescription)")
            }
        }
    }
}
