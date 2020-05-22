//
//  ContentView.swift
//  WeiBoDemo
//
//  Created by Lct on 2020/5/21.
//  Copyright © 2020 Lct. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var leftPercent: CGFloat = 0
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        NavigationView{
            
            GeometryReader{ geometry in
                HScrollViewController(pageWidth: geometry.size.width,
                                      contentSize: CGSize(width: geometry.size.width * 2,height: geometry.size.height), leftPercent: self.$leftPercent){
                                        
                                        HStack(spacing: 0){
                                            PostListView(category: .recommend)
                                                .frame(width: geometry.size.width)
                                            PostListView(category: .hot)
                                            .frame(width: geometry.size.width)
                                        }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: $leftPercent))
            .navigationBarTitle("首页",displayMode: .inline)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
