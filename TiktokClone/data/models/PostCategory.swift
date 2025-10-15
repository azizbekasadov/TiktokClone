//
//  PostCategory.swift
//  TiktokClone
//
//  Created by Azizbek Asadov on 15.10.2025.
//

import Foundation
//categories": [
//  {
//    "name": "Movies",
//    "videos": [

struct PostCategory: Codable {
    let name: String
    let videos: [PostMovie]
}

struct MediaData: Codable {
    let categories: [PostCategory]
}
