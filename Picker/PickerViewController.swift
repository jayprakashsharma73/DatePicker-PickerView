//
//  PickerViewController.swift
//  Picker
//
//  Created by Jay Prakash Sharma on 14/06/22.
//

import UIKit

class PickerViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    // Variables
    var countryData = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        //
        countryData.append(Country(country: "India", cities: ["Delhi", "Punjab", "Lucknow", "Goa"]))
        countryData.append(Country(country: "USA", cities: ["Florida", "California", "Seattle", "New York"]))
        countryData.append(Country(country: "Sri Lanka", cities: ["Colombo", "kandy", "Galle", "Dambulla"]))
        countryData.append(Country(country: "Nepal", cities: ["Kathmandu", "Pokhara", "LalitPur", "Dharan"]))
        
        // Do any additional setup after loading the view.
    }
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

extension PickerViewController:UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return countryData.count
        } else{
            let selectedCountry = pickerView.selectedRow(inComponent: 0)
            return countryData[selectedCountry].citiesName.count
        }
    }
}

extension PickerViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return countryData[row].countriesName
        } else{
            let selectedCountry = pickerView.selectedRow(inComponent: 0)
            return countryData[selectedCountry].citiesName[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadComponent(1)
        let selectedCountry = pickerView.selectedRow(inComponent: 0)
        let selectedCity = pickerView.selectedRow(inComponent: 1)
        let country = countryData[selectedCountry].countriesName
        let city = countryData[selectedCountry].citiesName[selectedCity]
        label.text = "Country : \(country) \nCity : \(city)"
    }
}

