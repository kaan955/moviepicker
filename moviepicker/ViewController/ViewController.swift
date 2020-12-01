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
    @IBOutlet weak var toolbarFirstButton: UIBarButtonItem!
    @IBOutlet weak var tabItem: UITabBarItem!
    
    @IBAction func sliderChanged(_ sender: RangeSeekSlider) {
        
       
        
        MinYearHolder =  Int(sender.selectedMinValue)
        MaxYearHolder =   Int(sender.selectedMaxValue)
        
        
        
        myTableview.reloadData()
        
    }
    @IBAction func movieRateChange(_ sender: UISlider) {
        let floatFinder = Int(sender.value)
        let floatFinder2 = sender.value
        let floatFinder3 = Double(floatFinder2) - Double(floatFinder)
   
       if(floatFinder3 >= 0.5)
        {
            valueRate = Double(floatFinder) + 0.5
        }else if(floatFinder3 <= 0.49)
        {
            valueRate = Double(floatFinder)
        }
        
        if(valueRate == 5)
        {
            valueRate = 4.5
        }else if(valueRate == 0)
        {
            valueRate = 0.0
            scorenot = true
        }
        myTableview.reloadData()
    }
    @IBAction func FindYourMovie(_ sender: UIButton) {
        //data = [PickClass.init(startMovieYear: MinYearHolder, endMovieYear: MaxYearHolder, movieTuru: genreHolder, izleyiciKitlesi: certifHolder,scoreMovie: scoreHolder)]
        
        data = PickClass(startMovieYear: MinYearHolder, endMovieYear: MaxYearHolder, movieTuru: genreHolder, izleyiciKitlesi: certifHolder,scoreMovie: scoreHolder)
        
        print("MinYear: \(MinYearHolder)")
        print("MaxYear: \(MaxYearHolder)")
        print("Score:  \(scoreHolder)")
        
        
    }
    
    @IBAction func myCancelItem(_ sender: UIBarButtonItem) {
        self.tabBarController?.tabBar.isHidden = false
        myPickerView.isHidden = true
        myToolbar.isHidden = true
    }
    @IBAction func myDoneItem(_ sender: Any) {
        switch genderORcertification {
        case 0:genderHolder = pendingGenderHolder
        case 1:certificationHolder = pendingCertificationHolder
        default: genderHolder = pendingGenderHolder
        }
  
        self.tabBarController?.tabBar.isHidden = false
        myPickerView.isHidden = true
        myToolbar.isHidden = true
        myTableview.reloadData()
    }
    

    @IBOutlet weak var myTableview: UITableView!
    var data = PickClass()
    var gender:[String] = ["Any","Action","Adventure","Animation","Comedy","Crime","Documentary","Drama","Family","Fantasy","History","Horror","Music","Mystery","Romance","Science Fiction","TV Movie","Thriller","War","Western"]
    
    var certification:[String] = ["Any","General Audiences","Parenral Guidance Suggested","Parents Strongly Cautioned","Restricted","Adults Only"]
    
    var decade:[String] = ["2020's","2010's","2000's","1990's","1980's","1970's","1960's","1950's"]
    
    var genderHolder = "Any"
    var pendingGenderHolder = "Any"
    var certificationHolder = "Any"
    var pendingCertificationHolder = "Any"
    var scorenot = true
    
    
    //Class Holders
    var MinYearHolder = 1948,MaxYearHolder = 2020
    var genreHolder = "Any",certifHolder = "Any",scoreHolder = "None"
    

    var genderORcertification = 3
    var valueRate = 0.5
    var counter = 1
    
    
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
    
    
        
    
        
    
    }
    
  

}

    extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 6
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
       
            cell.myRangeSlider.maxValue = CGFloat(Calendar.current.component(.year, from: Date()))
           // cell.myRangeSlider.selectedMaxValue = CGFloat(Calendar.current.component(.year, from: Date()))
            
         
     
            return cell
       
        case 3:
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "movieTuru", for: indexPath) as! MyTableViewCell
        
            cell.movieTuruL.text = "Genre".localized()
            cell.movieTuruResult.text = genderHolder.localized()
            
            genreHolder = cell.movieTuruResult.text ?? "Any"
            
                return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "movieIzleyici", for: indexPath) as! MyTableViewCell
            cell.izleyiciKitlesi.text = "Certificate".localized()
            cell.izleyiciKitlesiResult.text = certificationHolder.localized()
            
            certifHolder = cell.izleyiciKitlesiResult.text ?? "Any"
            
            return cell
            
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "movieRate", for: indexPath) as! MyTableViewCell
           
            if(scorenot)
            {
                cell.filmRate.text = "Score: None"
                scorenot = false
            }else{
                cell.filmRate.text = "Score: \(valueRate)+".localized()
            }
            
            
            scoreHolder = String(valueRate)
            
            
            return cell
    
        default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTuru", for: indexPath) as! MyTableViewCell
                cell.movieTuruL.text = "deneme"
                return cell
        }
    }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if(indexPath.row ==  3) //Check this later
            {
                genderORcertification = 0
                myPickerView.reloadAllComponents()
                
                self.tabBarController?.tabBar.isHidden = true
                myPickerView.isHidden = false
                myToolbar.isHidden = false
            }else if(indexPath.row == 4)
            {
                genderORcertification = 1
                myPickerView.reloadAllComponents()
                self.tabBarController?.tabBar.isHidden = true
                myPickerView.isHidden = false
                myToolbar.isHidden = false
            }else{
                genderORcertification = 3
            }
            myPickerView.selectRow(0, inComponent: 0, animated: false)
         
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
        case 0:return pendingGenderHolder = gender[row]
        case 1:return  pendingCertificationHolder = certification[row]
        default:return genderHolder = gender[row]
        }
        
       
    }
    
}

extension String {
    
    func localized()->String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
    
    
}

