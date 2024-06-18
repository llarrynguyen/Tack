//
//  RefreshScroll.swift
//  Tack
//
//  Created by Larry Nguyen on 6/17/24.
//

import SwiftUI

struct RefreshScroll<Content: View>: View {
    
    var content: Content
    var onRefresh: () async ->()
    
    init(title: String, tintColor: Color, @ViewBuilder content: @escaping()->Content, onRefresh: @escaping () async ->()) {
        self.content = content()
        self.onRefresh = onRefresh
        
        UIRefreshControl.appearance().attributedTitle = NSAttributedString(string: title)
        UIRefreshControl.appearance().tintColor = UIColor(tintColor)
    }
    
    var body: some View {
        List {
            content
                .listRowSeparatorTint(.clear)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
        .listStyle(.plain)
        .refreshable{
            await onRefresh()
        }
}
}


struct RefreshScroll_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
