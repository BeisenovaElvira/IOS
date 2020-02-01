//
//  ViewController.swift
//  calc 2
//
//  Created by Elvira Beisenova on 2/1/20.
//  Copyright © 2020 Elvira Beisenova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let model = Calculator()
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func numbers(_ sender: UIButton) {
        
        guard
           let numberText = sender.titleLabel?.text
            else
          {
            return
          }
      displayLabel.text?.append(numberText)
    }
    @IBAction func MathOperation(_ sender: UIButton) {
    guard
        let numberText = displayLabel.text,
        let _ = Double(numberText),
        let _ = sender.titleLabel?.text
    else {
        return
    }
       
        displayLabel.text = ""
               model.setOperand(number)
               model.executeOperation(symbol: String)
               
        if Operation == "=" {
                   displayLabel.text = "\(model.result)"
               }
           }
        }
