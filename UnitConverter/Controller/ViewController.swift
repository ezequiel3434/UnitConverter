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
    @IBOutlet weak var txtField2: UITextField!
    @IBOutlet weak var txtField3: UITextField!
    @IBOutlet weak var txtField4: UITextField!
    @IBOutlet weak var btn1: CustomUIButton!
    @IBOutlet weak var btn2: CustomUIButton!
    @IBOutlet weak var btn3: CustomUIButton!
    @IBOutlet weak var btn4: CustomUIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtField1.textAlignment = .center
        txtField2.textAlignment = .center
        txtField3.textAlignment = .center
        txtField4.textAlignment = .center
      
        btn1.customize(tittle: "Mile")
        btn2.customize(tittle: "Kilometer")
        btn3.customize(tittle: "Pound")
        btn4.customize(tittle: "Kilogram")
        
   
        
        
        
        let calcBtn = customCalculate()
        calcBtn.addTarget(self, action: #selector(ViewController.txtField1Action), for: .touchUpInside)

        
        let calcBtn2 = customCalculate()
        calcBtn2.addTarget(self, action: #selector(ViewController.txtField2Action), for: .touchUpInside)
        
        let calcBtn3 = customCalculate()
        calcBtn3.addTarget(self, action: #selector(ViewController.txtField3Action), for: .touchUpInside)
        
        let calcBtn4 = customCalculate()
        calcBtn4.addTarget(self, action: #selector(ViewController.txtField4Action), for: .touchUpInside)
        
        
        txtField1.inputAccessoryView = calcBtn
        txtField2.inputAccessoryView = calcBtn2
        txtField3.inputAccessoryView = calcBtn3
        txtField4.inputAccessoryView = calcBtn4

        
        
    }

    @IBAction func btnAction1(_ sender: Any) {

        let aux = txtField1.text
        
        
        txtField1.text = txtField2.text
        txtField2.text = aux
        
        let auxBtn = btn1.titleLabel!.text!

        btn1.customize(tittle: btn2!.titleLabel!.text!)
        btn2.customize(tittle: auxBtn)
        
        
        
        
    }
    
    @IBAction func btnAction2(_ sender: Any) {
        
        let aux = txtField2.text
        
        
        txtField2.text = txtField1.text
        txtField1.text = aux
        
        let auxBtn = btn2.titleLabel!.text!

        btn2.customize(tittle: btn1!.titleLabel!.text!)
        btn1.customize(tittle: auxBtn)
        
        
    }
    @IBAction func btnAction3(_ sender: Any) {
        
        let aux = txtField3.text
        
        
        txtField3.text = txtField4.text
        txtField4.text = aux
        
        let auxBtn = btn3.titleLabel!.text!

        btn3.customize(tittle: btn4!.titleLabel!.text!)
        btn4.customize(tittle: auxBtn)
    }
    @IBAction func btnAction4(_ sender: Any) {
        
        let aux = txtField4.text
               
               
               txtField4.text = txtField3.text
               txtField3.text = aux
               
               let auxBtn = btn4.titleLabel!.text!

               btn4.customize(tittle: btn3!.titleLabel!.text!)
               btn3.customize(tittle: auxBtn)
               
    }
    
    @objc func txtField1Action() {
        if btn1.titleLabel?.text == "Mile" {
            print("Es mile")
            txtField2.text = mileToKm(mile: txtField1.text)
        } else {
            
            print("Es km")
            txtField2.text = kmToMile(km: txtField1.text)
        }
    }
    
    
    @objc func txtField2Action() {
           if btn2.titleLabel?.text == "Kilometer" {
             print("Es km")
            txtField1.text = kmToMile(km: txtField2.text)
           } else {
            txtField1.text = mileToKm(mile: txtField2.text)
           }
       }
    
    @objc func txtField3Action() {
              if btn3.titleLabel?.text == "Pound" {
                
                txtField4.text = poundToKilogram(pound: txtField3.text)
              } else {
                txtField4.text = kilogramToPounds(kilo: txtField3.text)
              }
          }
    
    
    @objc func txtField4Action() {
                 if btn4.titleLabel?.text == "Kilogram" {
                   
                    txtField3.text = kilogramToPounds(kilo: txtField4.text)
                 } else {
                    txtField3.text = poundToKilogram(pound: txtField4.text)
                 }
             }
    
    
    
    
    // MilesToKm

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
    
   // KmToMile
    
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
    
    // PoundToKilogram
    
    func poundToKilogram(pound: String?) -> String {
           
           
           if let txt = pound {
                      if let pounds = Double(txt){
                          view.endEditing(true)
                       
                          
                        let distanceMiles = Measurement(value: pounds, unit: UnitMass.pounds)
                          
                          return String(format: "%.4f", (distanceMiles.converted(to: UnitMass.kilograms).value))
                      }
                  }
           return ""
       }
    
    
    // KilogramToPounds
    
    func kilogramToPounds(kilo: String?) -> String {
           
           
           if let txt = kilo {
                      if let kilograms = Double(txt){
                          view.endEditing(true)
                       
                          
                        let distanceMiles = Measurement(value: kilograms, unit: UnitMass.kilograms)
                          
                          return String(format: "%.4f", (distanceMiles.converted(to: UnitMass.pounds).value))
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

