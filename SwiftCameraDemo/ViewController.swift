//
//  ViewController.swift
//  SwiftCameraDemo
//
//  Created by 高鑫 on 2017/11/19.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.layer.borderWidth = 0.5
        imgView.layer.borderColor = UIColor.orange.cgColor
        imgView.clipsToBounds = true
        imgView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(tapGesture:)))
        imgView.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func tapAction(tapGesture: UITapGestureRecognizer) {
        let alertController = UIAlertController(title: "更改头像", message: nil,
                                                preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let photoAction = UIAlertAction(title: "相册选取", style: .default) { (_) in
            self.getPhoto()
        }
        let cameraAction = UIAlertAction(title: "拍照", style: .default) { (_) in
            self.takePic()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(photoAction)
        alertController.addAction(cameraAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func getPhoto() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            print("相册不可用")
            return
        }
        
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func takePic() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("相册不可用")
            return
        }
        
        let takePic = UIImagePickerController()
        takePic.allowsEditing = true
        takePic.sourceType = .camera
        takePic.delegate = self
        present(takePic, animated: true, completion: nil)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        imgView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        dismiss(animated: true, completion: nil)
    }
    
}

