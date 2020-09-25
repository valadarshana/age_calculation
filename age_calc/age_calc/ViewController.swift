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
    func age_cal(date:Int,month:Int,year:Int){
        let arr:[Int] = [31,28,31,30,31,30,31,31,30,31,30,31]
        
        let formater = DateFormatter()
              formater.dateFormat = "dd-MM-yyyy"
              let mystringfd=formater.string(from: Date())
        let arr_date=mystringfd.components(separatedBy: "-")
        
        var pdate=Int(arr_date[0])!
        var pm=Int(arr_date[1])!
        var py=Int(arr_date[2])!
        
        if pdate > date{
            pdate+=arr[month-1]
            pm-=1
        }
        if pm>month {
            py-=1
            pm+=12
        }
        lbl_cal.text = "you are \(py-year) year, \(pm-month) month and \(pdate-date) days old"
    }
    @objc func cancel_click(){
        self.view.endEditing(true)
    }
    @objc func done_click(){
        
        
        let diffInDays = Calendar.current.dateComponents([.day], from: datepicker.date, to: Date()).day
        var days=9125

        let year = days/366
         days = days%366
        let m = days/30
        let d=days%30
        
        
        print("Total Days :",diffInDays)
        print("days ",days)
        lbl_cal.text = "\(year) \(m) \(d)"
        
        
//        print(datepicker.date)
//        let formater = DateFormatter()
//        formater.dateFormat = "dd-MM-yyyy"
//        let mystringfd=formater.string(from: datepicker.date)
//        txt_date.text=mystringfd
//
//
//        let arr_date=mystringfd.components(separatedBy: "-")
//        let date = Int(arr_date[0])
//        let month = Int(arr_date[1])
//        let year = Int(arr_date[2])
//        age_cal(date:date!,month:month!,year:year!)
        self.view.endEditing(true) // Ending all editing
        
    }

}

