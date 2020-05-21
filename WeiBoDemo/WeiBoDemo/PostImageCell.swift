//
//  PostImageCell.swift
//  WeiBoDemo
//
//  Created by Lct on 2020/5/21.
//  Copyright © 2020 Lct. All rights reserved.
//

import SwiftUI

private let kImageSpace: CGFloat = 10


struct PostImageCell: View {
    let images:[String]
    let width:CGFloat
    
    var body: some View {
        var w = width
        if images.count == 1 {
            w = width / 2.0
        }else if images.count == 2 {
            w = width / 3.0 * 2
        }
       return Group{
            if images.count <= 3 {
                PostImageCellRow(images: images, width: w)
            }else if images.count == 4 {
                VStack(alignment: .center, spacing: kImageSpace){
                    PostImageCellRow(images: Array(images[0...1]), width: width / 3.0 * 2)
                    PostImageCellRow(images: Array(images[2...3]), width: width / 3.0 * 2)
                }
            }else if images.count == 5 {
                VStack(alignment: .center, spacing: kImageSpace){
                    PostImageCellRow(images: Array(images[0...1]), width: width)
                    PostImageCellRow(images: Array(images[2...4]), width: width)
                }
            }else if images.count == 6 {
                VStack(alignment: .center, spacing: kImageSpace){
                    PostImageCellRow(images: Array(images[0...2]), width: width)
                    PostImageCellRow(images: Array(images[3...5]), width: width)
                }
            }
        }
        
    }
}

struct PostImageCellRow: View {
    let images:[String]
    let width:CGFloat
    
    var body: some View{
        let w = (self.width - kImageSpace * CGFloat(self.images.count - 1)) / CGFloat(self.images.count)
        
        return HStack(alignment: .center, spacing: kImageSpace){
            
            ForEach(images, id: \.self){image in
                loadImage(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: w, height: w)
                    .clipped()
            }
        }
    }
    
}

struct PostImageCell_Previews: PreviewProvider {
    static var previews: some View {
        let model = loadPostListData("PostListData_recommend_1.json").list[0]
        let width = UIScreen.main.bounds.width
        
        return Group {
            PostImageCell(images: Array(model.images[0...0]), width: width)
            PostImageCell(images: Array(model.images[0...1]), width: width)
            PostImageCell(images: Array(model.images[0...2]), width: width)
            PostImageCell(images: Array(model.images[0...3]), width: width)
            PostImageCell(images: Array(model.images[0...4]), width: width)
            PostImageCell(images: Array(model.images[0...5]), width: width)
        }
        .previewLayout(.fixed(width: width, height: 400))
    }
}
