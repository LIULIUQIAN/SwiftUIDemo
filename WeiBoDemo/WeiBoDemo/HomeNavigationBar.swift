//
//  HomeNavigationBar.swift
//  WeiBoDemo
//
//  Created by Lct on 2020/5/21.
//  Copyright © 2020 Lct. All rights reserved.
//

import SwiftUI

private let kLabelWidth: CGFloat = 60
private let kButtonHeight: CGFloat = 30

struct HomeNavigationBar: View {
  @State var leftPercent: CGFloat
    
    var body: some View {
        HStack(alignment: .top, spacing: 0){
            Button(action: {
                print("left")
            }){
                Image(systemName: "camera")
                .resizable()
                .scaledToFit()
                .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal,15)
                    .padding(.top,5)
                    .foregroundColor(.black)
            }
            Spacer()
            HStack(spacing: 0){
                Text("推荐")
                    .bold()
                    .frame(width: kLabelWidth, height: kButtonHeight)
                    .padding(.top,5)
                    .opacity(Double(1 - leftPercent * 0.5))
                    .onTapGesture {
                        self.leftPercent = 0
                }
                Spacer()
                Text("热门")
                    .bold()
                    .frame(width: kLabelWidth, height: kButtonHeight)
                    .padding(.top,5)
                    .opacity(Double(0.5 + leftPercent * 0.5))
                    .onTapGesture {
                        self.leftPercent = 1
                }
            }
            Spacer()
            Button(action: {
                print("right")
            }){
                Image(systemName: "plus.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal,15)
                    .padding(.top,5)
                    .foregroundColor(.orange)
            }
        }
    }
}

struct HomeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationBar(leftPercent: 0)
    }
}
