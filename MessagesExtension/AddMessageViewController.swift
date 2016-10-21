//
//  AddMessageViewController.swift
//  Mess
//
//  Created by Admin on 10/12/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

import UIKit

protocol AddMessageViewControllerDelegate : class {
    func addMessageViewControllerDidSubmit(image: UIImage, caption: String)
}

class AddMessageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let screenBounds = UIScreen.main.bounds
    
    let imagePicker = UIImagePickerController()
    
    var addMessageButton = UIButton()
    var incrementButton = UIButton()
    var decrementButton = UIButton()
    var firstImageView = UIImageView()
    var secondImageView = UIImageView()
    var thirdImageView = UIImageView()
    var fourthImageView = UIImageView()
    var answerLabel = UILabel()
    
    var imageViewTag = 0
    var text = "____"
    
    weak var delegate: AddMessageViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor(red: 253/255, green: 253/255, blue: 253/255, alpha: 1.0)
        // Do any additional setup after loading the view.
        
        
        answerLabel = UILabel(frame: CGRect(x: screenBounds.width*0.032, y: screenBounds.width*0.31, width: screenBounds.width*0.484, height: 40))
        answerLabel.text = "____"
        let attributedString = answerLabel.attributedText as! NSMutableAttributedString
        attributedString.addAttribute(NSKernAttributeName, value: 7.0, range: NSMakeRange(0, attributedString.length))
        answerLabel.font = UIFont(name: "Helvetica-Light", size: screenBounds.width*0.065)
        answerLabel.textAlignment = .center
        answerLabel.attributedText = attributedString
        self.view.addSubview(answerLabel)
        
        decrementButton = UIButton(frame: CGRect(x: screenBounds.width*0.5, y: screenBounds.width*0.3, width: 40, height: 40))
        decrementButton.layer.borderWidth = 1
        decrementButton.layer.cornerRadius = 20
        decrementButton.layer.borderColor = UIColor(red: 244/255, green: 128/255, blue: 37/255, alpha: 1.0).cgColor
        decrementButton.setTitle("-", for: .normal)
        decrementButton.setTitleColor(UIColor(red: 102/255, green: 191/255, blue: 255/255, alpha: 1.0), for: .normal)
        decrementButton.addTarget(self, action: #selector(decrementButtonPressed), for: .touchUpInside)
        self.view.addSubview(decrementButton)
        
        incrementButton = UIButton(frame: CGRect(x: screenBounds.width*0.516+screenBounds.width*0.21-40, y: screenBounds.width*0.3, width: 40, height: 40))
        incrementButton.layer.borderWidth = 1
        incrementButton.layer.cornerRadius = 20
        incrementButton.layer.borderColor = UIColor(red: 244/255, green: 128/255, blue: 37/255, alpha: 1.0).cgColor
        incrementButton.setTitle("+", for: .normal)
        incrementButton.setTitleColor(UIColor(red: 102/255, green: 191/255, blue: 255/255, alpha: 1.0), for: .normal)
        incrementButton.addTarget(self, action: #selector(incrementButtonPressed), for: .touchUpInside)
        self.view.addSubview(incrementButton)
        
        addMessageButton = UIButton(frame: CGRect(x: screenBounds.width*0.758, y: screenBounds.width*0.3, width: screenBounds.width*0.21, height: 40))
        addMessageButton.layer.cornerRadius = 20
        addMessageButton.layer.borderWidth = 1
        addMessageButton.layer.borderColor = UIColor(red: 244/255, green: 128/255, blue: 37/255, alpha: 1.0).cgColor
        addMessageButton.setTitle("Send", for: .normal)
        addMessageButton.setTitleColor(UIColor(red: 102/255, green: 191/255, blue: 255/255, alpha: 1.0), for: .normal)
        addMessageButton.backgroundColor = UIColor.clear
        addMessageButton.addTarget(self, action: #selector(addMessage), for: .touchUpInside)
        self.view.addSubview(addMessageButton)
        
        firstImageView = UIImageView(frame: CGRect(x: screenBounds.width*0.032, y: screenBounds.width*0.032, width: screenBounds.width*0.21, height: screenBounds.width*0.21))
        firstImageView.image = UIImage(named: "picture")
        let tapFirstGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(assignImage(_:)))
        firstImageView.isUserInteractionEnabled = true
        firstImageView.tag = 1
        firstImageView.contentMode = .center
        firstImageView.addGestureRecognizer(tapFirstGestureRecognizer)
        self.view.addSubview(firstImageView)
        
        secondImageView = UIImageView(frame: CGRect(x: screenBounds.width*0.274, y: screenBounds.width*0.032, width: screenBounds.width*0.21, height: screenBounds.width*0.21))
        secondImageView.image = UIImage(named: "picture")
        let tapSecondGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(assignImage(_:)))
        secondImageView.isUserInteractionEnabled = true
        secondImageView.tag = 2
        secondImageView.contentMode = .center
        secondImageView.addGestureRecognizer(tapSecondGestureRecognizer)
        self.view.addSubview(secondImageView)
        
        thirdImageView = UIImageView(frame: CGRect(x: screenBounds.width*0.516, y: screenBounds.width*0.032, width: screenBounds.width*0.21, height: screenBounds.width*0.21))
        thirdImageView.image = UIImage(named: "picture")
        let tapThirdGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(assignImage(_:)))
        thirdImageView.isUserInteractionEnabled = true
        thirdImageView.tag = 3
        thirdImageView.contentMode = .center
        thirdImageView.addGestureRecognizer(tapThirdGestureRecognizer)
        self.view.addSubview(thirdImageView)
        
        fourthImageView = UIImageView(frame: CGRect(x: screenBounds.width*0.758, y: screenBounds.width*0.032, width: screenBounds.width*0.21, height: screenBounds.width*0.21))
        fourthImageView.image = UIImage(named: "picture")
        let tapFouthGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(assignImage(_:)))
        fourthImageView.isUserInteractionEnabled = true
        fourthImageView.tag = 4
        fourthImageView.contentMode = .center
        fourthImageView.addGestureRecognizer(tapFouthGestureRecognizer)
        self.view.addSubview(fourthImageView)
        
        imagePicker.delegate = self
    }
    
    func assignImage(_ sender: UITapGestureRecognizer){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        if let imageView = sender.view as? UIImageView {
            imageViewTag = imageView.tag
        }
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func incrementButtonPressed() {
        text.append("_")
        answerLabel.text = text
        let attributedString = answerLabel.attributedText as! NSMutableAttributedString
        attributedString.addAttribute(NSKernAttributeName, value: 7.0, range: NSMakeRange(0, attributedString.length))
        answerLabel.attributedText = attributedString
    }
    
    func decrementButtonPressed() {
        text.remove(at: text.index(before: text.endIndex))
        answerLabel.text = text
        let attributedString = answerLabel.attributedText as! NSMutableAttributedString
        attributedString.addAttribute(NSKernAttributeName, value: 7.0, range: NSMakeRange(0, attributedString.length))
        answerLabel.attributedText = attributedString
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            if imageViewTag == 1 {
                firstImageView.image = pickedImage
                firstImageView.contentMode = .scaleToFill
            } else if imageViewTag == 2 {
                secondImageView.image = pickedImage
                secondImageView.contentMode = .scaleToFill
            } else if imageViewTag == 3 {
                thirdImageView.image = pickedImage
                thirdImageView.contentMode = .scaleToFill
            } else {
                fourthImageView.image = pickedImage
                fourthImageView.contentMode = .scaleToFill
            }
            
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func compositeImage() -> UIImage {
        let areaOneImage = firstImageView.image
        let areaTwoImage = secondImageView.image
        let areaThreeImage = thirdImageView.image
        let areaFourImage = fourthImageView.image
        
        let size = CGSize(width: 300, height: 300)
        UIGraphicsBeginImageContext(size)
        
        let areaOneSize = CGRect(x: 0, y: 0, width: 150, height: 150)
        areaOneImage!.draw(in: areaOneSize)
        
        let areaTwoSize = CGRect(x: 150, y: 0, width: 150, height: 150)
        areaTwoImage!.draw(in: areaTwoSize)
        
        let areaThreeSize = CGRect(x: 0, y: 150, width: 150, height: 150)
        areaThreeImage!.draw(in: areaThreeSize)
        
        let areaFourSize = CGRect(x: 150, y: 150, width: 150, height: 150)
        areaFourImage!.draw(in: areaFourSize)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    func addMessage() {
        let image = compositeImage()
        let caption = answerLabel.text!
        
        self.delegate.addMessageViewControllerDidSubmit(image: image, caption: caption)
    }

}
