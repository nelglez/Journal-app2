//
//  PostController.swift
//  Journal
//
//  Created by Nelson Gonzalez on 4/3/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation

class PostController {
    private(set) var entries: [Journal] = []
    
    func createEntry(with title: String, date: Date = Date()) {
        let newEntry = Journal(title: title, date: date, posts: [])
        entries.append(newEntry)
    }
    
    func createPost(with entry: Journal, description: String = "", postType: PostType = .text, temperature: String = "") {
        let newPost = Post(description: description, postType: postType, temperature: temperature)
        entry.posts.append(newPost)
    }
}
