//
//  ListView.swift
//  simpleapp
//
//  Created by Cundy Sunardy on 27/11/24.
//

import SwiftUI

struct ListView: View {
    
    let post: PostModel
    
    init(_ post: PostModel) {
        self.post = post
    }
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: post.thumbnail)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                        case .failure:
                            EmptyView()
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(width: 100, height: 100)
            
            VStack(alignment:.leading, spacing: 8.0) {
                Text(post.title)
                    .lineLimit(1)
                Text(post.content)
                    .lineLimit(2)
                Text(post.publishedAt)
                    .lineLimit(1)
            }
        }
    }
}
