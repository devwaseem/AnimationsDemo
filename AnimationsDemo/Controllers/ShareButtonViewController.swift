//
//  ShareButtonViewController.swift
//  AnimationsDemo
//
//  Created by Waseem Akram on 29/07/19.
//  Copyright © 2019 Waseem Akram. All rights reserved.
//

import UIKit

class ShareButtonViewController: UIViewController {

    
    let shareButton = ShareButtonAnimated()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(shareButton)
        setupShareButton()
    }
    
    
    func setupShareButton(){
        shareButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(100)
        }
        view.layoutIfNeeded()
        shareButton.layer.cornerRadius = shareButton.frame.height / 2
        shareButton.layer.masksToBounds = false
    }
    

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        shareButton.currentState = .normal
    }

}
