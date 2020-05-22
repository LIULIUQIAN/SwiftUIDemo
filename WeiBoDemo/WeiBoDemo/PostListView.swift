//
//  PostListView.swift
//  WeiBoDemo
//
//  Created by Lct on 2020/5/21.
//  Copyright © 2020 Lct. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    
    let category: PostListCategory
    @EnvironmentObject var userData: UserData
 
    var body: some View {
         List{
            ForEach(userData.postList(for:category).list){ post in
                ZStack {
                    PostCell(post: post)
                    NavigationLink(destination: PostDetailView(post: post)){
                        EmptyView()
                    }.hidden()
                }
                .listRowInsets(EdgeInsets())
            }
            
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView(category: .recommend)
                .environmentObject(UserData())
                .navigationBarTitle("Title")
                .navigationBarHidden(true)
        }
    }
}
