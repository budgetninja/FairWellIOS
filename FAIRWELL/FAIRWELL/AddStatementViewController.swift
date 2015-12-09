//
//  AddStatementViewController.swift
//  FAIRWELL
//
//  Created by Winnie Liang on 12/8/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

import UIKit

class AddStatementViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var picker1: UIPickerView!
    @IBOutlet weak var picker2: UIPickerView!
    
    var array1 = ["Jarret Hutchison", "Issac Chua", "XYZ"]
    var array2 = ["Split equally", "Split unequally", "Split by ratio"];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        picker1.delegate = self;
        picker1.dataSource = self;
        picker2.delegate = self;
        picker2.dataSource = self;

        //Setting navigation bar color
        let navBarColor = UIColor(red: 0.376, green:0.686, blue:0.675, alpha:1); //hex #: 60afac
        self.navigationController!.navigationBar.barTintColor = navBarColor;
        self.navigationController!.navigationBar.translucent = false;
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        self.edgesForExtendedLayout = UIRectEdge()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
    func pickerView(pickerView: UIPickerView, titleforRow row: Int, forComponent component: Int) -> String!{
        if (pickerView.tag == 1){
            return array1[row];
        }
        else{
            return array2[row];
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1){
            return array1.count;
        }
        else{
            return array2.count;
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        
        return 1;
    }

    

}
