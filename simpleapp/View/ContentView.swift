//
//  ContentView.swift
//  simpleapp
//
//  Created by Cundy Sunardy on 27/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewController: ListViewController = ListViewController()
    
    var body: some View {
        ScrollView() {
            VStack(spacing: 16.0) {
                if viewController.posts.isEmpty {
                    Text("Loading...")
                }
                else {
                    ForEach(viewController.posts) { post in
                        ListView(post)
                    }
                }
            }
            .padding()
        }
        .onAppear() {
            viewController.loadPost()
        }
    }
}

#Preview {
    ContentView()
}
