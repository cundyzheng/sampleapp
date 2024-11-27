//
//  PostModel.swift
//  simpleapp
//
//  Created by Cundy Sunardy on 27/11/24.
//

struct PostModel: Codable, Identifiable {
    let id: Int
    let slug: String
    let url: String
    let title: String
    let content: String
    let image: String
    let thumbnail: String
    let status: String
    let category: String
    let publishedAt: String
    let updatedAt: String
    let userId: Int
}
