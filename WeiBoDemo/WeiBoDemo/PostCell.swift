//
//  PostCell.swift
//  WeiBoDemo
//
//  Created by Lct on 2020/5/21.
//  Copyright © 2020 Lct. All rights reserved.
//

import SwiftUI

struct PostCell: View {
    let post: Post
    
    @EnvironmentObject var userData : UserData
    
    var bindingPost: Post {
        userData.post(forId: post.id)!
    }
    
    var body: some View {
        
        var post = bindingPost
        
        return VStack(alignment: .leading, spacing:10){
            HStack(spacing:10){
                
                post.avatarImage
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        PostVIPBadge(vip: post.vip)
                            .offset(x: 16, y: 16))
                
                VStack(alignment:.leading, spacing: 5){
                    Text(post.name)
                        .font(Font.system(size: 16))
                        .foregroundColor(.init(red: 242 / 255, green: 99 / 255, blue: 4 / 255))
                        .lineLimit(1)
                    Text(post.date)
                        .font(Font.system(size: 11))
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
                
                if !post.isFollowed {
                    Spacer()
                    Button(action: {
                        post.isFollowed = true
                        self.userData.update(post)
                    }) {
                        Text("关注")
                            .font(.system(size: 14))
                            .frame(width: 50, height: 26)
                            .foregroundColor(.orange)
                            .overlay(RoundedRectangle(cornerRadius: 13)
                                .stroke(Color.orange,lineWidth: 1))
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                
            }
            
            Text(post.text)
                .font(.system(size: 16))
            
            if post.images.count > 0 {
                PostImageCell(images: post.images, width: UIScreen.main.bounds.width - 30)
            }
            
            Divider()
            
            HStack{
                Spacer()
                PostCellToolbarButton(image: "message", text: post.commentCountText, color: .black){
                    print("==========1")
                }
                Spacer()
                PostCellToolbarButton(image: post.isLiked ? "heart.fill" : "heart", text: post.likeCountText, color: post.isLiked ? .red : .black){
                    print("==========2")
                }
                Spacer()
            }
            
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(.init(red: 238 / 255, green: 238 / 255, blue: 238 / 255))
            
        }
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

struct PostCell_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PostCell(post: loadPostListData("PostListData_recommend_1.json").list[0])
    }
}
