//
//  Post.swift
//  WeiBoDemo
//
//  Created by Lct on 2020/5/21.
//  Copyright © 2020 Lct. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct PostList: Codable {
    var list:[Post]
    
}

struct Post: Codable, Identifiable {
    let id: Int
    let avatar: String // image name
    let vip: Bool
    let name: String
    let date: String // yyyy-MM-dd HH:mm:ss
    
    var isFollowed: Bool
    
    let text: String
    let images: [String] // image names
    
    var commentCount: Int
    var likeCount: Int
    var isLiked: Bool
}

extension Post {
    var avatarImage: Image{
        return loadImage(avatar)
    }
    
    var commentCountText: String {
        if commentCount < 1 {
            return "评论"
        }else if commentCount < 1000 {
            return "\(commentCount)"
        }else {
            return String(format: "%.1fK", Double(commentCount)/1000)
        }
    }
    
    var likeCountText: String {
        if likeCount < 1 {
            return "点赞"
        }else if likeCount < 1000 {
            return "\(likeCount)"
        }else {
            return String(format: "%.1fK", Double(likeCount)/1000)
        }
    }
    
}

func loadImage(_ name: String) -> Image{
    return Image(uiImage: UIImage(named: name)!)
}

func loadPostListData(_ fileName: String) -> PostList{
    
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("解析失败")
    }
    
    guard let data = try? Data(contentsOf: url) else { fatalError("解析失败")
    }
    
    guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
        fatalError("解析失败")
    }
    
    return list
    
}
