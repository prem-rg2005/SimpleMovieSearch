//
//  Image+Extensions.swift
//  SimpleMovieSearch
//
//  Created by Prem Shankar Rajagopalan Nayar on 26/2/25.
//

import Foundation
import SwiftUI

extension Image {
    static let sysImage = SystemImageNames()
}

struct SystemImageNames {
    let searchImage = Image(systemName: "magnifyingglass")
    let clearSearch = Image(systemName: "xmark.circle.fill")
    let placeholderImg = Image(systemName: "photo")
}
