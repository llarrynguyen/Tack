//
//  TackGrid.swift
//  Tack
//
//  Created by Larry Nguyen on 6/17/24.
//

import SwiftUI

struct TackGrid<Content: View, T: Identifiable>: View where T: Hashable {
    var content: (T) -> Content
    var list: [T]
    var columns: Int
    var showsIndicators: Bool
    var spacing: CGFloat
    
    init(columns: Int, showsIndicators: Bool = false, spacing: CGFloat = 10, list: [T], @ViewBuilder content: @escaping (T) ->Content){
        self.content = content
        self.list = list
        self.spacing = spacing
        self.showsIndicators = showsIndicators
        self.columns = columns
    }
    func setUpList()->[[T]] {
        
        var gridArray: [[T]] = Array(repeating: [], count: columns)
        var currentIndex: Int = 0
        
        for object in list {
            gridArray[currentIndex].append(object)
            if currentIndex == (columns - 1){
                currentIndex = 0
            } else{
                currentIndex += 1
            }
        }
        return gridArray
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: showsIndicators) {
            HStack(alignment: .top){
                ForEach(setUpList(), id: \.self) { columnsData in
                    LazyVStack(spacing: spacing){
                        ForEach(columnsData) {object in
                            content(object)
                        }
                    }
                    
                }
            }
        }
                    .padding(.vertical)
        
    }
}
