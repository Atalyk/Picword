//
//  DetailViewController.swift
//  Mess
//
//  Created by Admin on 10/12/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let screenBounds = UIScreen.main.bounds
    
    var imageView = UIImageView()
    var wordLabel = UILabel()
    var questionTextView = UITextView()
    var animateLabel = UILabel()
    var animateLabelTwo = UILabel()
    
    var word = ""
    var image = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    func setup() {
        
        self.view.backgroundColor = UIColor(red: 253/255, green: 253/255, blue: 253/255, alpha: 1.0)
        
        questionTextView = UITextView(frame: CGRect(x: screenBounds.width*0.1, y: screenBounds.height*0.2, width: screenBounds.width*0.8, height: screenBounds.height*0.3))
        questionTextView.text = "Can you guess this word?"
        questionTextView.backgroundColor = UIColor.clear
        questionTextView.textAlignment = .center
        questionTextView.font = UIFont(name: "Helvetica-Light", size: screenBounds.width*0.1)
        self.view.addSubview(questionTextView)
        
        //R: 112 G: 169 B: 214
        animateLabel = UILabel(frame: CGRect(x: screenBounds.width*0.13, y: screenBounds.height*0.3, width: 40, height: 40))
        animateLabel.text = "+"
        animateLabel.textColor = UIColor(red: 244/255, green: 128/255, blue: 37/255, alpha: 1.0)
        self.view.addSubview(animateLabel)
        
        animateLabelTwo = UILabel(frame: CGRect(x: screenBounds.width*0.9, y: screenBounds.height*0.2, width: 40, height: 40))
        animateLabelTwo.text = "+"
        animateLabelTwo.textColor = UIColor(red: 102/255, green: 191/255, blue: 255/255, alpha: 1.0)
        self.view.addSubview(animateLabelTwo)
        
        wordLabel = UILabel(frame: CGRect(x: screenBounds.width*0.1, y: screenBounds.height*0.4, width: screenBounds.width*0.8, height: screenBounds.height*0.1))
        wordLabel.text = word
        wordLabel.textColor = UIColor(red: 244/255, green: 128/255, blue: 37/255, alpha: 1.0)
        let attributedString = wordLabel.attributedText as! NSMutableAttributedString
        attributedString.addAttribute(NSKernAttributeName, value: 7.0, range: NSMakeRange(0, attributedString.length))
        wordLabel.font = UIFont(name: "Helvetica-Light", size: screenBounds.width*0.2)
        wordLabel.textAlignment = .center
        wordLabel.attributedText = attributedString
        self.view.addSubview(wordLabel)
        
       
    }


}
