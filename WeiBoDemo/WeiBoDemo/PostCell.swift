//
//  PostCell.swift
//  WeiBoDemo
//
//  Created by Lct on 2020/5/21.
//  Copyright © 2020 Lct. All rights reserved.
//

import SwiftUI

struct PostCell: View {
    var body: some View {
        HStack(spacing:5){
            
            Image(uiImage: UIImage(named: "d0c21786ly1gavj2c0kcej20c8096dh7.jpg")!)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(
                  PostVIPBadge()
                    .offset(x: 16, y: 16))
               
            VStack(alignment:.leading, spacing: 5){
                Text("昵称")
                    .font(Font.system(size: 16))
                    .foregroundColor(.init(red: 242 / 255, green: 99 / 255, blue: 4 / 255))
                    .lineLimit(1)
                Text("2020-05-21 10:25:58")
                    .font(Font.system(size: 11))
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            Spacer()
            Button(action: {
                print("button click")
            }) {
                Text("关注")
                    .font(.system(size: 14))
                    .frame(width: 50, height: 26)
                    .foregroundColor(.orange)
                    .overlay(RoundedRectangle(cornerRadius: 13)
                        .stroke(Color.orange,lineWidth: 1))
            }
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell()
    }
}
