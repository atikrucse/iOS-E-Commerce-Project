//
//  UserProfileViewController.swift
//  E-Commerce Leads Corp.
//
//  Created by Atik  on 27/9/23.
//

import UIKit
import MobileCoreServices

class UserProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()
    }
}

extension UserProfileViewController {
    
    func configuration() {
        
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        
        // Add a tap gesture to Image View
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        profileImageView.addGestureRecognizer(tapGesture)
        profileImageView.isUserInteractionEnabled = true
    }
}

extension UserProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func profileImageTapped(_ sender: UITapGestureRecognizer) {
        showImagePicker()
    }

    func showImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true

        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)

        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Take Photo", style: .default) { (_) in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }
            alertController.addAction(cameraAction)
        }

        let photoLibraryAction = UIAlertAction(title: "Choose from Library", style: .default) { (_) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        alertController.addAction(photoLibraryAction)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        alertController.popoverPresentationController?.sourceView = profileImageView
        present(alertController, animated: true, completion: nil)
    }

    // Delegate method to handle the selected or captured image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            profileImageView.image = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImageView.image = originalImage
        }

        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
