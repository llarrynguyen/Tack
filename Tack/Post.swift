//
//  Post.swift
//  Tack
//
//  Created by Larry Nguyen on 6/17/24.
//

import SwiftUI

struct Post: Identifiable, Hashable {
    var id = UUID().uuidString
    var imageURL: String
}
