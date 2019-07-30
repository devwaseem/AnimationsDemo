//
//  HomeViewController.swift
//  AnimationsDemo
//
//  Created by Waseem Akram on 29/07/19.
//  Copyright © 2019 Waseem Akram. All rights reserved.
//

import UIKit
import SnapKit


class HomeViewController: UITableViewController {
  
    let sharedSegue = "shareVCSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: sharedSegue, sender: self)
        default:
            return
        }
        
    }
    
    

}

