//
//  HomeView.swift
//  Tack
//
//  Created by Larry Nguyen on 6/17/24.
//

import SwiftUI
struct HomeView: View {
    @State var posts: [Post] = []
    @State var columns: Int = 2
    
    @Namespace var animation
    
    private var topBar: some View {
        TopBarView()
            .frame(width: 20)
    }
    
    private var tabBar: some View {
        CustomTabBar()
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Spacer()
                
                RefreshScroll(title: "Pull Down", tintColor: .red, content: {
                    VStack {
                        Spacer()
                        
                        TackGrid(columns: columns, list: posts, content: { post in
                            PostCardView(post: post)
                                .matchedGeometryEffect(id: post.id, in: animation)
                        })
                        .padding(.horizontal)
                    }
                }) {
                    await Task.sleep(2_000_000_000)
                }
                
                topBar.padding(.horizontal)
            }
            .onAppear {
                for index in 1...10 {
                    posts.append(Post(imageURL: "post\(index)"))
                }
            }
            .overlay(tabBar, alignment: .bottom)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
struct PostCardView: View {
    var post: Post
    @State private var isSaved: Bool = false

    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(post.imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)

                Button(action: {
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        isSaved.toggle()
                        if isSaved {
                            print("Saved!")
                        } else {
                            
                        }
                    }
                }) {
                    Image(systemName: isSaved ? "circle.fill.checkmark" : "pin")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .padding(8)
                        .background(isSaved ? Color.black : Color.gray)
                        .foregroundColor(isSaved ? Color.white : Color.black)
                        .shadow(radius: 3)
                        .clipShape(Circle())
                        .rotationEffect(.degrees(45))
                }

                
                .padding([.bottom, .trailing], 8)
                .overlay(
                    isSaved ?
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .bold))
                            .padding(2)
                            .background(Color.black)
                            .clipShape(Circle())
                            .offset(x: -5, y: -5)
                        : nil
                )
                .accessibility(label: Text("Image Pinned"))

            }
        }
    }
}
