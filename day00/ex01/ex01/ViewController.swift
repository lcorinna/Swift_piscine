//
//  ViewController.swift
//  ex01
//
//  Created by Lashaun Corinna on 11/17/22.
//

import UIKit

class ViewController: UIViewController {
    
    var tmp: MyViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tmp = MyViewController(view: view)
        tmp?.clicking()
    }

}
