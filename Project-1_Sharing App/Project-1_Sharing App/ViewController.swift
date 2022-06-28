//
//  ViewController.swift
//  Project-1_Sharing App
//
//  Created by student on 28/06/22.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var url1 : UITextField!
    @IBOutlet var message1 : UITextField!
    
    @IBOutlet var add_image : UIButton!
    @IBOutlet var share1 : UIButton!
    
    @IBOutlet var image_View1 : UIImageView!
    var photoLibraryIamgePicker1 : UIImagePickerController!
    var cameraImagePicker1 : UIImagePickerController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func add_imageClick() {
        let imageOption = UIAlertController(title: "Add image", message: "Choose option", preferredStyle: .actionSheet)
        let gallery = UIAlertAction(title: "Gallery", style: .default, handler: {_ in
            self.photoLibraryIamgePicker1 = UIImagePickerController();
            self.photoLibraryIamgePicker1.delegate = self
            self.photoLibraryIamgePicker1.sourceType = .photoLibrary
            self.photoLibraryIamgePicker1.allowsEditing = false
            self.present(self.photoLibraryIamgePicker1, animated: true, completion: nil)
        })
        
        let camera = UIAlertAction(title: "Camera", style: .default, handler: {_ in
            
            if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
                  {
                self.cameraImagePicker1 = UIImagePickerController()
                self.cameraImagePicker1.delegate = self
                self.cameraImagePicker1.sourceType = .camera
                self.cameraImagePicker1.cameraDevice = .rear
                self.cameraImagePicker1.allowsEditing = false
                    
                self.present(self.cameraImagePicker1, animated: true, completion: nil)
                    
                    }
                    else {
                        
                        print("Camera not found in Simulator")

                        
                    }
                    
                

        
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: {_ in
            
        })
        imageOption.addAction(gallery)
        imageOption.addAction(camera)
        imageOption.addAction(cancel)
        self.present(imageOption, animated: true, completion: nil)
        
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if picker == photoLibraryIamgePicker1 {
            let img = info[.originalImage] as! UIImage
            image_View1.image = img
            self.dismiss(animated: true, completion: nil)
        } else {
            let img1 = info[.originalImage] as! UIImage
            image_View1.image = img1
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func shareButtonClick() {
        let share = [message1,url1,image_View1] as [Any]
        let activityViewController = UIActivityViewController(activityItems: share, applicationActivities: nil)
        
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(activityViewController, animated: true
                     , completion: nil)
    }


}

