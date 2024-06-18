//
//  TopBarView.swift
//  Tack
//
//  Created by Larry Nguyen on 6/17/24.
//


import SwiftUI

struct TopBarView: View {
    @State private var selectedCategory: String = "Discover"

    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .background(Color(UIColor.systemBackground)) // Use systemBackground for adaptive color
            .shadow(color: .clear, radius: 0, x: 0, y: 0)
            .frame(width: 392, height: 26)
            .background(Color(UIColor.systemBackground)) // Use systemBackground for adaptive color
            .overlay(
                HStack(spacing: 50) {
                    Text("Discover")
                        .font(
                            Font.custom("SF UI Display", size: 14.5)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(selectedCategory == "Discover" ? .black : .gray)
                        .padding(.bottom, 20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .fill(selectedCategory == "Discover" ? Color.black : Color.clear)
                                .frame(height: 3)
                                .opacity(selectedCategory == "Discover" ? 1.0 : 0.0)
                        )
                        .onTapGesture {
                            withAnimation {
                                selectedCategory = "Discover"
                            }
                        }

                    Text("For you")
                        .font(
                            Font.custom("SF UI Display", size: 14.5)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(selectedCategory == "For you" ? .black : .gray)
                        .padding(.bottom, 21)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .fill(selectedCategory == "For you" ? Color.black : Color.clear)
                                .frame(height: 3)
                                .opacity(selectedCategory == "For you" ? 1.0 : 0.0)
                        )
                        .onTapGesture {
                            withAnimation {
                                selectedCategory = "For you"
                            }
                        }
                }
                .animation(.easeInOut)
            )
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TopBarView()
                .environment(\.colorScheme, .light)
            TopBarView()
                .environment(\.colorScheme, .dark)
        }
    }
}

