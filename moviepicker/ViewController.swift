//
//  ViewController.swift
//  moviepicker
//
//  Created by Kaan Baysal on 20.11.2020.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var myToolbar: UIToolbar!
    

    @IBOutlet weak var myTableview: UITableView!
    var data = [PickClass]()
    var gender:[String] = ["Action","Adventure","Animation","Comedy","Crime","Documentary","Drama","Family","Fantasy","History","Horror","Music","Mystery","Romance","Science Fiction","TV Movie","Thriller","War","Western"]
    
    var certification:[String] = ["General Audiences","Parenral Guidance Suggested","Parents Strongly Cautioned","Restricted","Adults Only"]
    
    var genderHolder = "any"
    var certificationHolder = "any"
    var genderORcertification = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        myTableview.dataSource = self
        myTableview.delegate = self
        
        myPickerView.delegate = self
        myPickerView.dataSource = self
        
        myPickerView.isHidden = true
        myToolbar.isHidden = true
               
        myPickerView.backgroundColor = UIColor.gray
        myPickerView.setValue(UIColor.white, forKey: "textColor")
        self.view.addSubview(myPickerView)
        myToolbar.sizeToFit()
        myToolbar.isUserInteractionEnabled = true
               self.view.addSubview(myToolbar)
    
        data = [PickClass.init(startMovieYear: 2019, endMovieYear: 2020, movieTuru: "Action", izleyiciKitlesi: "cocuk")]
        
    
        
    
    }
}

    extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        switch indexPath.row {
        case 0:
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "tablePicture", for: indexPath) as! MyTableViewCell
                return cell
        case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "tableFiltre", for: indexPath) as! MyTableViewCell
                return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "progressChange", for: indexPath) as! MyTableViewCell
     
            return cell
       
        case 3:
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "movieTuru", for: indexPath) as! MyTableViewCell
            cell.movieTuruL.text = "Genre".localized()
                return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "movieIzleyici", for: indexPath) as! MyTableViewCell
            cell.izleyiciKitlesi.text = "Certificate".localized()
            return cell
        default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTuru", for: indexPath) as! MyTableViewCell
                cell.movieTuruL.text = "deneme"
                return cell
        }
        
    
        
    
    }
        
    }


extension ViewController:UIPickerViewDelegate,UIPickerViewDataSource{

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch genderORcertification {
        case 0:return gender.count
        case 1:return certification.count
        default:return gender.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch genderORcertification {
        case 0:return gender[row]
        case 1:return certification[row]
        default:return gender[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch genderORcertification {
        case 0:return genderHolder = gender[row]
        case 1:return  certificationHolder = gender[row]
        default:return genderHolder = gender[row]
        }
       
    }
}


extension String {
    
    func localized()->String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
    
    
}

