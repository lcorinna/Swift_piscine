//
//  ViewController.swift
//  ex01
//
//  Created by Lashaun Corinna on 8/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var flag:Int = 0;

    @IBOutlet weak var label: UILabel!
    @IBAction func click(_ sender: UIButton) {
        if flag == 0 {
            label.text = "How are you?"
            flag = 1
        }
        else if flag == 1 {
            label.text = "Hello"
            flag = 0
        }
    }
}
