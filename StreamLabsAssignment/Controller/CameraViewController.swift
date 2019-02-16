//
//  CameraViewController.swift
//  StreamLabsAssignment
//
//  Created by Junior on 16/02/2019.
//  Copyright © 2019 streamlabs. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UINavigationControllerDelegate {

    let imagePicker = UIImagePickerController()
    
   override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        if UIImagePickerController.isCameraDeviceAvailable( UIImagePickerController.CameraDevice.rear) {
//            imagePicker.delegate = self
//            imagePicker.sourceType = UIImagePickerController.SourceType.camera
//            present(imagePicker, animated: true, completion: nil)
//        }
    }
    

  

}


extension CameraViewController: UIImagePickerControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        //do nothing actually
        dismiss(animated: true, completion: nil)
    }
}
