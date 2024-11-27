//
//  ContentView.swift
//  simpleapp
//
//  Created by Cundy Sunardy on 27/11/24.
//

import SwiftUI

struct ContentView: View {
    
    let viewController: ListViewController = ListViewController()
    
    var body: some View {
        VStack {
           Text("Loading...")
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
