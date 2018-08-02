//
//  File.swift
//  PhotoCollection
//
//  Created by Andrew Liao on 8/2/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import Foundation

class PhotoController {
    //MARK: - Methods
    func create(withImageData data: Data, imageTitle title: String) {
        let newPhoto = Photo(imageData: data, title: title)
        photos.append(newPhoto)
    }
    
    func update(photo: Photo, imageData:Data, imageTitle:String) {
        guard let index = photos.index(of:photo) else {return}
        photos[index].imageData = imageData
        photos[index].title = imageTitle
    }
    
    //MARK: - Properties
    var photos = [Photo]()
}
