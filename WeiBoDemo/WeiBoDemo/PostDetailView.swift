//
//  PostDetailView.swift
//  WeiBoDemo
//
//  Created by Lct on 2020/5/21.
//  Copyright © 2020 Lct. All rights reserved.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post
    
    var body: some View {
        List {
            PostCell(post: post)
            .listRowInsets(EdgeInsets())
            ForEach(1...20,id: \.self){ i in
                Text("评论\(i)")
                .listRowInsets(EdgeInsets())
            }
        }
        .navigationBarTitle("详情", displayMode: .inline)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return PostDetailView(post: userData.recommedPostList.list[0]).environmentObject(userData)
    }
}
