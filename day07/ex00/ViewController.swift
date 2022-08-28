//
//  ViewController.swift
//  ex00
//
//  Created by Lashaun Corinna on 8/21/22.
//

import UIKit
    
class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickButton(_ sender: UIButton) {
        guard let text = textField.text?.trimmingCharacters(in: .whitespaces),
              let queston = textField.text
        else {
            return
        }
        
        if text.isEmpty {
            return
        }
        
        networkManager.getLocation(queston, completion: { [weak self] (answer) in
            DispatchQueue.main.async {
                self?.label.text = answer
            }
        })
    }
}

