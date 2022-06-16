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
    var likes: Int
    var views: Int
    var liked: Bool
}


let postA = PostModel(author: "Author1",
                      description: "Description 1 Description 1 Description 1 Description 1 Description 1 Description 1 Description 1 Description 1 a",
                      image: "image_literal_a",
                      likes: 1000,
                      views: 4000,
                      liked: false)
let postB = PostModel(author: "Author2",
                      description: "Description 2 Description 2 Description 2 Description 2 Description 2 Description 2 Description 2 Description 2 b",
                      image: "image_literal_b",
                      likes: 2000,
                      views: 3000,
                      liked: false)
let postC = PostModel(author: "Author3",
                      description: "Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 Description 3 c",
                      image: "image_literal_c",
                      likes: 3000,
                      views: 2000,
                      liked: false)
let postD = PostModel(author: "Author4",
                      description: "Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 Description 4 d",
                      image: "image_literal_d",
                      likes: 4000,
                      views: 1000,
                      liked: false)

var posts: [PostModel] = [postA, postB, postC, postD]

