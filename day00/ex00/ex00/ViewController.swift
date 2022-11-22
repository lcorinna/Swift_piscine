//
//  ViewController.swift
//  ex00
//
//  Created by Lashaun Corinna on 11/4/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        myButton()
        
        // Do any additional setup after loading the view.
    }

    func myButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        view.addSubview(button)
        button.setTitle("Click me", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.center = view.center
        button.setTitleColor(.black, for: .normal)

        button.addTarget(self, action: #selector(clickMe), for: .touchUpInside)
        
    }
    @objc func clickMe() {
        print("Hello World!")
    }

}

