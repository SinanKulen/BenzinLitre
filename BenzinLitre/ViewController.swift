//
//  ViewController.swift
//  BenzinLitre
//
//  Created by Sinan Kulen on 26.11.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var benzinType = [String]()
    var benzinName = [String]()
    var benzinSector = [String]()
    var benzinLogo = [String]()
    var benzinImage = [String]()
    var benzinOccupation = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        parseJSON()
       
    
    }
    
    func parseJSON() {
        AF.request("https://run.mocky.io/v3/b4d8445c-a205-4998-97be-7fb2c724e064").responseJSON { response in
            switch response.result {
            case .success(let value): let json = JSON(value)
                
                let typeResult = json["data"].arrayValue.map {$0["type"]}
                for result in typeResult {
                    self.benzinType.append(result.rawValue as! String)
                }
                print(self.benzinType)
                
                let nameResult = json["data"].arrayValue.map { ($0["data"])["name"]}
                for result in nameResult {
                    self.benzinName.append(result.rawValue as! String)
                }
                
                let sectorResult = json["data"].arrayValue.map { ($0["data"])["sector"]}
                for result in sectorResult {
                    self.benzinSector.append(result.rawValue as? String ?? "")
                }
                
                
                let logoResult = json["data"].arrayValue.map { ($0["data"])["logo"]}
                for result in logoResult {
                    self.benzinLogo.append(result.rawValue as? String ?? "")
                }
                
                
                let occupationResult = json["data"].arrayValue.map {($0["data"])["occupation"]}
                for result in occupationResult {
                    self.benzinSector.append(result.rawValue as? String ?? "")
                }

             
                
                let pictureResult = json["data"].arrayValue.map {($0["data"])["picture"]}
                for result in pictureResult {
                    self.benzinLogo.append(result.rawValue as? String ?? "")
                }
                
                
                let singerResult = json["data"].arrayValue.map {($0["data"])["singer"]}
                for result in singerResult {
                    self.benzinSector.append(result.rawValue as? String ?? "")
                }
                
                
                let thumbnailResult = json["data"].arrayValue.map {($0["data"])["thumbnail"]}
                for result in thumbnailResult {
                    self.benzinLogo.append(result.rawValue as? String ?? "")
                }
                
                
                let brandResult = json["data"].arrayValue.map {($0["data"])["brand"]}
                for result in brandResult {
                    self.benzinSector.append(result.rawValue as? String ?? "")
                }
                
                let photoResult = json["data"].arrayValue.map {($0["data"])["photo"]}
                for result in photoResult {
                    self.benzinLogo.append(result.rawValue as? String ?? "")
                }
                print(self.benzinLogo)
                
                for logo in self.benzinLogo {
                    if logo == "" {
                        print("-")
                    } else {
                        self.benzinImage.append(logo)
                    }
                }
                
                for sector in self.benzinSector {
                    if sector == "" {
                        print("-")
                    } else {
                        self.benzinOccupation.append(sector)
                    }
                }
                
            case .failure(let error) : print(error)
            }
        
            self.myTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.sectorLabel.text = benzinOccupation[indexPath.row]
        cell.nameLabel.text = benzinName[indexPath.row]
        cell.typeLabel.text = benzinType[indexPath.row]
        let url = URL(string: benzinImage[indexPath.row])!
        if let data = try? Data(contentsOf: url) {
            cell.imageViewCell.image = UIImage(data: data)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return benzinType.count
    }

}
