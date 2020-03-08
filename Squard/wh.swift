//
//  wh.swift
//  Squard
//
//  Created by Elvira Beisenova on 3/8/20.
//  Copyright © 2020 Elvira Beisenova. All rights reserved.
//

import Foundation
import UIKit

class NavigationC : UIViewController{
   
    var walls:UIView?
    var color :UIColor?
    var onSave: ((CGFloat,CGFloat,CGFloat,CGFloat,UIColor) -> Void)? = nil
    var onSelect:((_ width: Int,_ height:Int,_ x: Int,_ y: Int,_ color: UIColor)-> Void)? = nil
    
    @IBOutlet weak var widthText:UITextField!
    @IBOutlet weak var heightText:UITextField!
    @IBOutlet weak var xText:UITextField!
    @IBOutlet weak var yText:UITextField!
    @IBOutlet weak var colorButtons: UIButton!
    
    
   
    @IBAction func selectColor(_ sender:UIButton){
        guard let backColor = sender.backgroundColor else {return}
        color = backColor
    }
    override func viewDidLoad() {
              super.viewDidLoad()
        }
    
    @objc func  deleteview(){
        guard let walls = walls else {return}
        walls.removeFromSuperview()
        self.navigationController?.popViewController(animated: true)
}
    @objc func saveView(){
       guard let a = textFieldWidth.text, let b = textFieldHeight.text, let c = textFieldX.text, let d = textFieldY.text, let color = color else {
                let alert = UIAlertController(title: "Error", message: "ERROR", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "okey", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            guard let width = Double(a), let height = Double(b), let x = Double(c), let y = Double(d) else {
                let alert = UIAlertController(title: "ERROR", message: "Error", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "okey", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            if x + width > Double(UIScreen.main.bounds.width) || y + height > Double(UIScreen.main.bounds.height) || x < 0 || y < 0{
                let alert = UIAlertController(title: "ERROR", message: "ERROR", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "okey", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            guard let square = selected else {
                let walls = UIView(frame: CGRect(x:x, y:y, width: width, height: height))
                walls.backgroundColor = color
                self.walls?(walls)
                self.navigationController?.popViewController(animated: true)
                return
            }
            changeWalls(square, color, width, height, x, y)
            self.navigationController?.popViewController(animated: true)
        }
    @objc func  changeview(){
        walls.frame = CGRect(width:CGFloat(width),height:CGFloat(height)), x:CGFloat(x) ,y:CGFloat(y))
        walls.backgroundColor = color
    }
    
}
