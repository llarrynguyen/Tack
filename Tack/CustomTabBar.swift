//
//  CustomTabBar.swift
//  Tack
//
//  Created by Larry Nguyen on 6/17/24.
//

import SwiftUI

struct CustomTabBar: View {
    @State private var selectedTab: Int = 0
    @State private var isSavedPostsViewActive = false

    var body: some View {
        HStack {
            Spacer()

            Button(action: {
                selectedTab = 0
            }) {
                Image(systemName: "house.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 27, height: 27)
                    .foregroundColor(selectedTab == 0 ? Color.black : Color.gray)
            }
            .padding(.bottom, -15)
            .accessibility(label: Text("Home"))

            Spacer()

            Button(action: {
                selectedTab = 1
            }) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 27, height: 27)
                    .foregroundColor(selectedTab == 1 ? Color.black : Color.gray)
            }
            .padding(.bottom, -15)
            .accessibility(label: Text("Search"))

            Spacer()

            Button(action: {
                selectedTab = 2
            }) {
                Image(systemName: "plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 27, height: 27)
                    .foregroundColor(selectedTab == 2 ? Color.black : Color.gray)
            }
            .padding(.bottom, -15)
            .accessibility(label: Text("Add"))

            Spacer()

            Button(action: {
                selectedTab = 3
            }) {
                Image(systemName: "ellipsis.bubble.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 27, height: 27)
                    .foregroundColor(selectedTab == 3 ? Color.black : Color.gray)
            }
            .padding(.bottom, -15)
            .accessibility(label: Text("More"))

            Spacer()

            Button(action: {
                          selectedTab = 4
                          isSavedPostsViewActive = true
                      }) {
                          Image(systemName: "person.circle.fill")
                              .resizable()
                              .aspectRatio(contentMode: .fit)
                              .frame(width: 27, height: 27)
                              .foregroundColor(selectedTab == 4 ? Color.accentColor : Color.gray)
                              // Use accentColor for selected state
                      }
                      .padding(.bottom, -15)
                      .accessibility(label: Text("Profile"))
                      .sheet(isPresented: $isSavedPostsViewActive) {
                          SavedPostsView()
                      }

                      Spacer()
                  }
                  .frame(height: 40)
                  .background(Color(UIColor.systemBackground))
              }
          }

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomTabBar()
                .environment(\.colorScheme, .light)
            CustomTabBar()
                .environment(\.colorScheme, .dark)
        }
    }
}
