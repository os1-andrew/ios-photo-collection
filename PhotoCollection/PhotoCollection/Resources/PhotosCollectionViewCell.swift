//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Andrew Dhan on 8/2/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Methods
    func updateViews(){
        guard let imageData = photo?.imageData else {return}
        let image = UIImage(data: imageData )
        imageView.image = image
        imageTitle.text = photo?.title
    }
    
    
    //MARK: - Properties
    var photo: Photo?{
        didSet{
            updateViews()
        }
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
}
