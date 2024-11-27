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
        VStack {
            if viewController.posts.isEmpty {
                Text("Loading...")
            }
            else {
                ForEach(viewController.posts) { post in
                    Text(post.title)

                }
            }
        }
        .padding()
        .onAppear() {
            viewController.loadPost()
        }
    }
}

#Preview {
    ContentView()
}
