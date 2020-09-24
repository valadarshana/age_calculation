//
//  ViewController.swift
//  age_calc
//
//  Created by Vijay Parmar on 22/09/20.
//  Copyright © 2020 WD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txt_date: UITextField!
    
    
    @IBOutlet weak var lbl_cal: UILabel!
    let toolbar = UIToolbar()
    
    @IBOutlet weak var dateview: UIView!
    let datepicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //dateview.layer.cornerRadius=(dateview.frame.size.height/2)
        
        txt_date.inputView=datepicker // Show Date Picker on text field click
        
        datepicker.datePickerMode = .date // Date Formate
        
        toolbar.sizeToFit() //Full Size Toolbar
        txt_date.inputAccessoryView=toolbar //Add Toolbar in textfiled
        
        let btndone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(done_click)) // declare done button with click event
        
        let btncancel = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancel_click)) // declare done button with click event
        
        toolbar.setItems([btndone,btncancel], animated: true) //add done button in Toolbar
    }
    @objc func cancel_click(){
        self.view.endEditing(true)
    }
    @objc func done_click(){
        print(datepicker.date)
        self.view.endEditing(true) // Ending all editing
        txt_date.text="\(datepicker.date)"
    }

}

