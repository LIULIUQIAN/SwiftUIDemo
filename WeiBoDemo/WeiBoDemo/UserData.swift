//
//  UserData.swift
//  WeiBoDemo
//
//  Created by Lct on 2020/5/22.
//  Copyright © 2020 Lct. All rights reserved.
//

import SwiftUI
import Combine

class UserData: ObservableObject {
    @Published var recommedPostList = loadPostListData("PostListData_recommend_1.json")
    @Published var hotPostList = loadPostListData("PostListData_hot_1.json")
}

enum PostListCategory {
    case recommend, hot
}

extension UserData {
    func postList(for category: PostListCategory) -> PostList {
        switch category {
        case .recommend:
            return recommedPostList
        case .hot:
            return hotPostList
        }
    }
    
    func post(forId id: Int) -> Post? {
        
        var resultArray = recommedPostList.list.filter { (item) -> Bool in
            return item.id == id
        }
        
        if resultArray.count > 0 {
            return resultArray[0]
        }
        
        resultArray = hotPostList.list.filter { (item) -> Bool in
            return item.id == id
        }
        
        if resultArray.count > 0 {
            return resultArray[0]
        }
        
        return nil
    }
    
    func update(_ post: Post) {
        
      recommedPostList.list = recommedPostList.list.map { (item) -> Post in
            
            if item.id == post.id {
                return post
            }
            return item
        }
        
       hotPostList.list = hotPostList.list.map { (item) -> Post in
            
            if item.id == post.id {
                return post
            }
            return item
        }
    }
}


