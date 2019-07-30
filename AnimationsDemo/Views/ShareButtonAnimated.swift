//
//  ShareButtonAnimated.swift
//  AnimationsDemo
//
//  Created by Waseem Akram on 29/07/19.
//  Copyright © 2019 Waseem Akram. All rights reserved.
//

import UIKit
import SnapKit

enum ShareButtonState {
    case normal, activated
}

class ShareButtonAnimated : UIView {
    
    
    var currentState:ShareButtonState = .normal {
        didSet {
            setState(state: currentState)
        }
    }
    
    let label = UILabel()
    let facebookButton = UIImageView(image: #imageLiteral(resourceName: "fblogo"))
    let twitterButton = UIImageView(image: #imageLiteral(resourceName: "twitterlogo"))
    let whatsappButton = UIImageView(image: #imageLiteral(resourceName: "walogo"))
    let linkButton = UIImageView(image: #imageLiteral(resourceName: "linklogo"))
    
    var stack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    func setup(){
        stack = UIStackView(arrangedSubviews: [facebookButton,twitterButton,whatsappButton,linkButton])
        stack.distribution = .equalSpacing
        addSubview(label)
        addSubview(stack)

        [facebookButton,twitterButton,whatsappButton,linkButton].forEach { (image) in
            image.contentMode = .scaleAspectFit
        }
        
        setupConstraints()
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        label.text = "Share Something"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = UIColor(red: 132/255, green: 149/255, blue: 165/255, alpha: 1.0)
        label.textAlignment = .center
        currentState = .normal
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(buttonClicked)))
    }
    
    private func setupConstraints(){
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        stack.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalToSuperview().multipliedBy(0.75)
        }
        
    }
    
    private func setState(state:ShareButtonState){
        if state == .normal {
            
            
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseOut, animations: {
                self.facebookButton.transform = CGAffineTransform(translationX: 0, y: self.frame.height == 0 ? 30 : self.frame.height)
                self.facebookButton.alpha = 0
            }, completion: nil)
            
            UIView.animate(withDuration: 0.2, delay: 0.05, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseOut, animations: {
                self.twitterButton.transform = CGAffineTransform(translationX: 0, y: self.frame.height == 0 ? 30 : self.frame.height)
                self.twitterButton.alpha = 0
            }, completion: nil)
            
            UIView.animate(withDuration: 0.2, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseOut, animations: {
                self.whatsappButton.transform = CGAffineTransform(translationX: 0, y: self.frame.height == 0 ? 30 : self.frame.height)
                self.whatsappButton.alpha = 0
                
            }, completion: nil)
            
            UIView.animate(withDuration: 0.2, delay: 0.15, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseOut, animations: {
                self.linkButton.transform = CGAffineTransform(translationX: 0, y: self.frame.height == 0 ? 30 : self.frame.height)
                self.linkButton.alpha = 0
                self.layer.borderColor = UIColor(red: 132/255, green: 149/255, blue: 165/255, alpha: 1.0).cgColor
                self.layer.borderWidth = 4
            }, completion: nil)
            
            UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .curveEaseOut, animations: {
                self.backgroundColor = .white
                self.layer.shadowOpacity = 0
                self.label.alpha = 1
                
            }, completion: nil)
            
            
        }else if state == .activated {
            self.label.alpha = 0
            self.layer.borderColor = UIColor.clear.cgColor
            self.layer.borderWidth = 0
            
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.6, options: .curveEaseOut, animations: {
                self.facebookButton.transform = .identity
                self.facebookButton.alpha = 1
            }, completion: nil)
            
            UIView.animate(withDuration: 0.2, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.6, options: .curveEaseOut, animations: {
                self.twitterButton.transform = .identity
                self.twitterButton.alpha = 1
            }, completion: nil)
            
            UIView.animate(withDuration: 0.2, delay: 0.3, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.6, options: .curveEaseOut, animations: {
                self.whatsappButton.transform = .identity
                self.whatsappButton.alpha = 1
            }, completion: nil)
            
            UIView.animate(withDuration: 0.2, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.6, options: .curveEaseOut, animations: {
                self.linkButton.transform = .identity
                self.linkButton.alpha = 1
            }, completion: nil)
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.6, options: .curveEaseOut, animations: {
                self.backgroundColor = UIColor(red: 55/255, green: 152/255, blue: 241/255, alpha: 1.0)
                self.layer.shadowColor = UIColor(red: 55/255, green: 152/255, blue: 241/255, alpha: 1.0).cgColor
                self.layer.shadowOpacity = 0.6
                self.layer.shadowOffset = .init(width: 0, height: 5)
                self.layer.shadowRadius = 12
                self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
                
            }, completion: nil)
            
            
        }
    
    }
    
  
    
    @objc private func buttonClicked(){
        if currentState == .normal {
            currentState = .activated
        }else{
            currentState = .normal
        }
    }
    
    
    
    
    
}



