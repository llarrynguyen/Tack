//
//  SavedPostView.swift
//  Tack
//
//  Created by Larry Nguyen on 6/17/24.
//


import SwiftUI

struct SavedPostsView: View {
    @State private var savedPosts: [Post] = []

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(savedPosts, id: \.id) { post in
                        
                        Text("")
                    }
                }
                .padding()
            }
            .navigationTitle("")
        }
    }
}

#Preview {
    SavedPostsView()
}
