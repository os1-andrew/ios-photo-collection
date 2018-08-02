//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Andrew Dhan on 8/2/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotoCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }



    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotosCollectionViewCell
        cell.photo = photoController.photos[indexPath.item]
        return cell
    }
    
    func setTheme(){
        guard let preference = themeHelper.themePreference else {return}
        
        if preference == "Dark"{
            themeHelper.setThemePreferenceToDark()
            self.view.backgroundColor = UIColor.lightGray
        } else {
            themeHelper.setThemePreferenceToLight()
            self.view.backgroundColor = UIColor.init(red: 207, green: 232, blue: 201, alpha: 80.0)
        }
        
    }

    
    
    

     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if identifier == "SelectTheme"{
            guard let destinationVC = segue.destination as? ThemeSelectionViewController else {return}
            destinationVC.themeHelper = themeHelper
        }
        if identifier == "AddPhoto"{
            guard let destinationVC = segue.destination as? PhotoDetailViewController else  {return}
            destinationVC.photoController = photoController
            destinationVC.themeHelper = themeHelper
        }
        if identifier == "ShowPhoto"{
            guard let destinationVC = segue.destination as? PhotoDetailViewController,
            let indexPath = collectionView?.indexPathsForSelectedItems?.first else  {return}
            
            destinationVC.photoController = photoController
            destinationVC.photo = photoController.photos[indexPath.item]
            destinationVC.themeHelper = themeHelper
            
        }
     }

    
    
    //MARK - Properties
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
}
