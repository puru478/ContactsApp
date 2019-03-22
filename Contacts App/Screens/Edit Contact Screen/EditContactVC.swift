//
//  EditContactVC.swift
//  Contacts App
//
//  Created by Purushottam Chandra on 19/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit
import MobileCoreServices

class EditContactVC: UIViewController {

    var viewModel = EditContactVM()
    
    var postSaveCompletion: completionHandler = nil
    
    var circularImage: CircleImageLabelView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        Helper.setNavigationBar(controller: self, rightButtonTitles: ["Save"], rightButtonAction: [#selector(barButtonTitle)])
        createTopView()
    }
    
    func createTopView() {
        let navigationHeight = navigationController?.navigationBar.frame.maxY ?? 44
        let topViewHeight = UIScreen.main.bounds.height * 0.4
        
        let topView = UIView(frame: CGRect(x: 0, y: navigationHeight, width: UIScreen.main.bounds.width, height: topViewHeight))
        view.addSubview(topView)
        
        let topImageView = UIImageView(frame: topView.bounds)
        topImageView.image = Helper.getImage(fromLayer: Helper.getGradient(frame: topView.bounds))
        topImageView.alpha = 0.4
        topView.addSubview(topImageView)

        let halfWidth = topImageView.bounds.height * 0.9
        let halfOfScreen = UIScreen.main.bounds.width * 0.5

        circularImage = CircleImageLabelView.init(frame: CGRect(x: halfOfScreen - (halfWidth / 2),
                                                                    y: topImageView.bounds.height * 0.1,
                                                                    width: halfWidth,
                                                                    height: halfWidth))
        circularImage.titleString = NSMutableAttributedString.stringAttributes(string: "")
        circularImage.isCameraOptionHidden = false
        circularImage.onClickOfCameraIconCompletion = {
            self.optionsForImage()
        }
        topView.addSubview(circularImage)
        
        let tableView = UITableView(frame: CGRect(x: 0,
                                                  y: topView.frame.maxY,
                                                  width: UIScreen.main.bounds.width,
                                                  height: UIScreen.main.bounds.height * 0.6))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.whiteGrey
        tableView.bounces = false
        viewModel.tableItemTypes.forEach { (cellTypes) in
            cellTypes.registerCell(tableview: tableView)
        }
        viewModel.reloadTable = {
            tableView.reloadData()
        }
        viewModel.setup()
        view.addSubview(tableView)
    }
    
    func optionsForImage() {
        let alertForImage = UIAlertController(title: "Select image from", message: "", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera
//                imagePicker.mediaTypes = [kCIAttributeTypeImage]
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        let cameraRollAction = UIAlertAction(title: "Camera Roll", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
//                imagePicker.mediaTypes = [kCIAttributeTypeImage]
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        alertForImage.addAction(cameraAction)
        alertForImage.addAction(cameraRollAction)
        self.present(alertForImage, animated: true, completion: nil)
    }
    
    @objc func barButtonTitle() {
        print("Bar button tapped!")
        postSaveCompletion?()
    }
}

extension EditContactVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewModel.tableItems[indexPath.row].cellInstanatiate(tableview: tableView, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension EditContactVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[.mediaType] as! NSString
        if mediaType.isEqual(to: kUTTypeImage as String) {
            if let image = info[.originalImage] as? UIImage {
                circularImage.circleImage = image
                UIImageWriteToSavedPhotosAlbum(image, self, #selector(imageError), nil)
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func imageError(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo: UnsafeRawPointer) {
        if error != nil {
            let alert = UIAlertController(title: "Save Failed!", message: "Failed to save image", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
    }
}
