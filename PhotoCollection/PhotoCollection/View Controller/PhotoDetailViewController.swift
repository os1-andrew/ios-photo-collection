//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Andrew Dhan on 8/2/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }

    @IBAction func save(_ sender: Any) {
        
        //checks to make sure tehre is image and title
        //no need to save or add photo if they are not there
        guard let image = imageView.image,
            let title = imageTitleField.text,
            let imageData = UIImagePNGRepresentation(image) else {return}
        
        if let photo = photo {
            photoController?.update(photo: photo, imageData: imageData, imageTitle: title)
        } else {
            photoController?.create(withImageData: imageData, imageTitle: title)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        let authStatus = PHPhotoLibrary.authorizationStatus()
        if authStatus == .authorized{
            presentImagePickerController()
        } else if authStatus == .notDetermined {
            PHPhotoLibrary.requestAuthorization { (status) in
                if status == .authorized{
                    self.presentImagePickerController()
                }
            }
        }
        
    }
    
    func presentImagePickerController(){
        if !UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {return}
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)

        
    }
    //Don't understand
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.image = image
    }
    
    
    func setTheme(){
        guard let themeHelper = themeHelper,
            let preference = themeHelper.themePreference else {return}
        
        if preference == "Dark"{
            themeHelper.setThemePreferenceToDark()
            self.view.backgroundColor = UIColor.lightGray
        } else {
            themeHelper.setThemePreferenceToLight()
            self.view.backgroundColor = UIColor.init(red: 207, green: 232, blue: 201, alpha: 80.0)
        }
        
    }
    
    func updateViews(){
        if let photo = photo {
            self.title = "View Photo"
            
            let title = photo.title
            let image = UIImage(data: photo.imageData)
            
            imageView.image=image
            imageTitleField.text = title
            
        } else {
            self.title = "Add Photo"
        }
    }
    
    
    //MARK: - Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageTitleField: UITextField!
}
