//
//  PViewController.swift
//  modArithmetic
//
//  Created by Сергей on 10.11.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

import UIKit

class PViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var power: UITextField!
    @IBOutlet weak var module: UITextField!
    @IBOutlet weak var result: UILabel!
    
    
    
    @IBAction func getResult(_ sender: UIButton) {
        
        var res: Int = 1;
        var a: Int? = Int(number.text!)!;
        var n: Int8? = Int8(power.text!);
        let m: Int? = Int(module.text!);
        
        
        
        while (n != 0) {
            if ((n! & 1) == 1) {
                res = (res * a!)%m!;
                
            }
            
            n = n! >> 1;
            a = (a!*a!)%m!;
            
        }
        result.text = String(res)
        view.endEditing(true)
        
    }
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
