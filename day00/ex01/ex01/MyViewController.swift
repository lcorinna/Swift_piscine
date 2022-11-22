//
//  MyViewController.swift
//  ex01
//
//  Created by Lashaun Corinna on 11/19/22.
//

import UIKit

class MyViewController {

    var view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        button.setTitle("Click me", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        return button
    }()
    
    var check: Bool = true
    
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        label.text = "Hello"
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let labelAdele: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        label.font = .systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    public func clicking() {
        view.addSubview(button)
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.isUserInteractionEnabled = true
        button.invalidateIntrinsicContentSize()
        button.addTarget(self, action: #selector(actionButton(_:)), for: .touchUpInside)
        
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: button.topAnchor, constant: -50).isActive = true
        
        view.addSubview(labelAdele)
    }
    
    @objc func actionButton(_ sender: UIButton) {
        if check == true {
            label.text = "it's me"
        } else {
            label.text = "Hello"
        }
        if labelAdele.text?.isEmpty == nil {
            labelAdele.text = "Adele"
            labelAdele.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            labelAdele.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        }
        check = !check
    }
    

}
