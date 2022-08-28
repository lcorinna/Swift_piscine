//
//  ViewController.swift
//  ex02
//
//  Created by Lashaun Corinna on 8/10/22.
//

import UIKit
import Swift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        

    @IBOutlet weak var result: UILabel!
    @IBAction func numbers(_ sender: UIButton) {
        result.text = String(sender.tag)
    }
}

