//
//  ViewController.swift
//  Picker
//
//  Created by Jay Prakash Sharma on 13/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.addTarget(self, action: #selector(datePicked), for: .valueChanged)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dateSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 :
            datePicker.preferredDatePickerStyle = .wheels
        case 1 :
            datePicker.preferredDatePickerStyle = .compact
        case 2 :
            datePicker.preferredDatePickerStyle = .inline
        default:
            break
        }
    }
    
    @objc func datePicked(){
        let dateFormatter  = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        let date = dateFormatter.string(from: datePicker.date)
        datelabel.text = String(date)
    }
}

