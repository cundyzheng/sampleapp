//
//  ContentView.swift
//  simpleapp
//
//  Created by Cundy Sunardy on 27/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewController: ListViewController = ListViewController()
    @State private var navigateToDetail = false
    
    var body: some View {
        NavigationStack {
            ScrollView() {
                VStack(spacing: 16.0) {
                    if viewController.posts.isEmpty {
                        Text("Loading...")
                    }
                    else {
                        ForEach(viewController.posts) { post in
                            
                            NavigationLink(value: post) {
                                ListView(post)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .padding()
            }
            .onAppear() {
                viewController.loadPost()
            }
            .navigationDestination(for: PostModel.self) { post in
                EmptyView()
            }
        }
    }
}

#Preview {
    ContentView()
}
