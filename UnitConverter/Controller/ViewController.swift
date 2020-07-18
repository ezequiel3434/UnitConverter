//
//  ViewController.swift
//  UnitConverter
//
//  Created by Ezequiel Parada Beltran on 18/07/2020.
//  Copyright © 2020 Ezequiel Parada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var meterBtnTapped = false
    var kgBtn = false

    @IBOutlet weak var txtField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var txtField3: UITextField!
    @IBOutlet weak var txt4Field: UITextField!
    @IBOutlet weak var btn1: CustomUIButton!
    @IBOutlet weak var btn2: CustomUIButton!
    @IBOutlet weak var btn3: CustomUIButton!
    @IBOutlet weak var btn4: CustomUIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtField1.textAlignment = .center
        textField2.textAlignment = .center
        txtField3.textAlignment = .center
        txt4Field.textAlignment = .center
      
        btn1.customize(tittle: "Mile")
        btn2.customize(tittle: "Kilometer")
        
   
        
        
        let calcBtn = customCalculate()
        
        calcBtn.addTarget(self, action: #selector(ViewController.txtField1Action), for: .touchUpInside)

        
        let calcBtn2 = customCalculate()
        
        calcBtn2.addTarget(self, action: #selector(ViewController.txtField2Action), for: .touchUpInside)
        
        txtField1.inputAccessoryView = calcBtn
        textField2.inputAccessoryView = calcBtn2
//        txtField3.inputAccessoryView = calcBtn2
//        txt4Field.inputAccessoryView = calcBtn2
//
        
        
    }

    @IBAction func btnAction1(_ sender: Any) {

        let aux = txtField1.text
        
        
        txtField1.text = textField2.text
        textField2.text = aux
        
        let auxBtn = btn1.titleLabel!.text!

        btn1.customize(tittle: btn2!.titleLabel!.text!)
        btn2.customize(tittle: auxBtn)
        
        
        
        
    }
    
    @IBAction func btnAction2(_ sender: Any) {
        
        let aux = textField2.text
        
        
        textField2.text = txtField1.text
        txtField1.text = aux
        
        let auxBtn = btn2.titleLabel!.text!

        btn2.customize(tittle: btn1!.titleLabel!.text!)
        btn1.customize(tittle: auxBtn)
        
        
    }
    @IBAction func btnAction3(_ sender: Any) {
    }
    @IBAction func btnAction4(_ sender: Any) {
    }
    
    @objc func txtField1Action() {
        if btn1.titleLabel?.text == "Mile" {
            print("Es mile")
            textField2.text = mileToKm(mile: txtField1.text)
        } else {
            
            print("Es km")
            textField2.text = kmToMile(km: txtField1.text)
        }
    }
    
    
    @objc func txtField2Action() {
           if btn2.titleLabel?.text == "Kilometer" {
             print("Es km")
            txtField1.text = kmToMile(km: textField2.text)
           } else {
            txtField1.text = mileToKm(mile: textField2.text)
           }
       }
    

    func mileToKm(mile: String?) -> String {
        print("estoy en el 1")
        
        if let txt = mile {
                   if let meters = Double(txt){
                       view.endEditing(true)
                    
                       
                       let distanceMiles = Measurement(value: meters, unit: UnitLength.miles)
                       
                       return String(format: "%.4f", (distanceMiles.converted(to: UnitLength.kilometers).value))
                   }
               }
        return ""
    }
    
   
    
    func kmToMile(km: String?) -> String{
        print("Estoy en el 2")
        
        if let txt = km {
            if let kilometers = Double(txt){
                view.endEditing(true)
                
                
                let distanceKilometers = Measurement(value: kilometers, unit: UnitLength.kilometers)
                
                return String(format: "%.4f", (distanceKilometers.converted(to: UnitLength.miles).value))
                
            }
        }
        return ""
    }
    

    
    func customCalculate() -> UIButton {
        let btn = UIButton( frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        btn.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        btn.setTitle("Calculate", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        return btn
    }
}

