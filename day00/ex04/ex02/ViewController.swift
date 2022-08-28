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

    var number_from_screen:Double = 0;
    var first_num:Double = 0;
    var math_sign:Bool = false;
    var operation:Int = 0;

    @IBOutlet weak var result: UILabel!
    @IBAction func numbers(_ sender: UIButton) {
        if math_sign == true {
            result.text = String(sender.tag)
            math_sign = false
        }
        else {
            result.text = result.text! + String(sender.tag)
        }
            number_from_screen = Double(result.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != ""  && sender.tag != 14 && sender.tag != 15 && sender.tag != 16 && math_sign == false {
            first_num = Double(result.text!)!
            if sender.tag == 10 {
                result.text = "+"
            }
            else if sender.tag == 11 {
                result.text = "-"
            }
            else if sender.tag == 12 {
                result.text = "*"
            }
            else if sender.tag == 13 {
                result.text = "/"
            }
            operation = sender.tag
            math_sign = true
        }
        else if sender.tag == 14 {
            if operation == 10 {
                first_num += number_from_screen
                result.text = String(first_num)
            }
            else if operation == 11 {
                first_num -= number_from_screen	
                result.text = String(first_num)
            }
            else if operation == 12 {
                first_num *= number_from_screen
                result.text = String(first_num)
            }
            else if operation == 13 {
                if number_from_screen != 0 {
                    first_num /= number_from_screen
                    result.text = String(first_num)
                }
                else {
                    result.text = ""
                }
            }
        }
        else if sender.tag == 15 {
            result.text = ""
            first_num = 0
            number_from_screen = 0
            operation = 0
        }
        else if sender.tag == 16 {
            number_from_screen = Double(result.text!)!
            if number_from_screen > 0 {
                result.text = "-" + String(number_from_screen)
                number_from_screen *= -1;
            }
            else if number_from_screen < 0 {
                number_from_screen *= -1
                result.text = String(number_from_screen)
            }
        }
    }
}
 
