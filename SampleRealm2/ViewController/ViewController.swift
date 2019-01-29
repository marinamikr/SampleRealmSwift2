//
//  ViewController.swift
//  SampleRealm2
//
//  Created by 原田摩利奈 on 2019/01/23.
//  Copyright © 2019 原田摩利奈. All rights reserved.
//


import UIKit
import RealmSwift


class ViewController: UIViewController ,UIImagePickerControllerDelegate ,UINavigationControllerDelegate {
    
    
    @IBOutlet weak var showImageView: UIImageView!
    
    @IBOutlet weak var saveTextView: UITextView!
    
    @IBAction func showAllButton(_ sender: Any) {
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        let dateText :String = formatter.string(from: Date()) 
        let picData: NSData? = showImageView.image!.jpegData(compressionQuality: 0.8) as! NSData
        
        
        let realm = try! Realm()
        
        let saveData = RealmModel()
        saveData.date = dateText
        saveData.text = saveTextView.text
        saveData.image = picData
        try! realm.write() {
            realm.add(saveData)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showImageView.isUserInteractionEnabled = true
        showImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.showImage(_:))))
        
    }
    
    @objc func showImage(_ sender: UITapGestureRecognizer) {
        print("タップ")
        let ipc = UIImagePickerController()
        ipc.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        ipc.sourceType = UIImagePickerController.SourceType.photoLibrary
        //編集を可能にする
        ipc.allowsEditing = true
        self.present(ipc,animated: true, completion: nil)
    }
    
    //　撮影が完了時した時に呼ばれる
    func imagePickerController(_ imagePicker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        if let pickedImage = info[.originalImage]
            as? UIImage {
            showImageView.image = pickedImage
        }
        //閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    
}


