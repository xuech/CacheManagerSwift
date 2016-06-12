//
//  ViewController.swift
//  SwiftCache
//
//  Created by xuech on 16/6/8.
//  Copyright © 2016年 obizsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cacheLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        cacheLabel.text = CacheManager.readCacheSize()+"MB"

    }

    @IBAction func delectCachEvent(sender: AnyObject) {
        CacheManager.cleanCache { 
            self.cacheLabel.text = CacheManager.readCacheSize()+"MB"
        }
        
    }


}

