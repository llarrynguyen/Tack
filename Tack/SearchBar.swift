//
//  SearchBar.swift
//  Tack
//
//  Created by Larry Nguyen on 6/17/24.
//

import SwiftUI

struct SearchBar: View {
    @State private var searchTerm: String = ""

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 370, height: 50)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 1)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .inset(by: 1)
                        .stroke(Color(red: 0.8, green: 0.8, blue: 0.8), lineWidth: 2)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                    .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                                    .padding(.leading, 12)

                                TextField("Search term", text: $searchTerm)
                                    .font(Font.custom("SF Pro", size: 16))
                                    .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                                    .padding(.vertical, 10)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .background(Color.white)
                            }
                            .padding(.trailing, 12)
                            .padding(.vertical, 10)
                        )
                )
                .padding(.leading, 16)
                .frame(width: 397, alignment: .topLeading)
        }
    }
}


#Preview {
    SearchBar()
}
