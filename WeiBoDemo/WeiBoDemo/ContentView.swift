//
//  ContentView.swift
//  WeiBoDemo
//
//  Created by Lct on 2020/5/21.
//  Copyright © 2020 Lct. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            PostListView()
                
                .navigationBarItems(leading: HomeNavigationBar(leftPercent: 0))
            .navigationBarTitle("首页",displayMode: .inline)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
