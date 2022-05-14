//
//  PostModel.swift
//  Navigation
//
//  Created by Дмитрий Галочкин on 11.05.2022.
//

import Foundation


struct PostModel {
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
}


let postA = PostModel(author: "Author1", description: "Description 1", image: "image_literal_a", likes: 1000, views: 4000)
let postB = PostModel(author: "Author2", description: "Description 2", image: "image_literal_b", likes: 2000, views: 3000)
let postC = PostModel(author: "Author3", description: "Description 3", image: "image_literal_c", likes: 3000, views: 2000)
let postD = PostModel(author: "Author4", description: "Description 4", image: "image_literal_d", likes: 4000, views: 1000)
var posts: [PostModel] = [postA, postB, postC, postD]
