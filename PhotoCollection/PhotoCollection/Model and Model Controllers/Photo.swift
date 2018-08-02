//
//  Photo.swift
//  PhotoCollection
//
//  Created by Andrew Liao on 8/2/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import Foundation

struct Photo: Equatable, Codable {
    var imageData: Data
    var title: String
}
