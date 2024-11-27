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

struct DetailView: View {
    
    let post: PostModel
    
    init(_ post: PostModel) {
        self.post = post
    }
    
    var body: some View {
            ScrollView() {
                VStack(alignment: .leading, spacing: 16.0) {
                    AsyncImage(url: URL(string: post.image)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: .infinity)
                                        .cornerRadius(10)
                                case .failure:
                                    EmptyView()
                                @unknown default:
                                    EmptyView()
                                }
                            }
                    .frame(maxWidth: .infinity)
                    
                    Text(post.slug)
                        .font(.title)
                        .lineLimit(1)
                    
                    Text("Updated \(post.updatedAt)")
                        .font(.caption)
                        .lineLimit(1)

                    Text("Created \(post.publishedAt)")
                        .font(.caption2)
                        .lineLimit(1)
                    
                    Text(post.content)
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                }
                .padding([.leading, .trailing], 16.0)
            }
            .navigationTitle(post.title)
        }
}
