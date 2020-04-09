//
//  ViewController.swift
//  WemoInterview
//
//  Created by Lena Lai on 4/7/20.
//  Copyright © 2020 Lena Lai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewModelDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    var viewmodel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewmodel.delegate = self
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        self.viewmodel.cellArrangements = [.Success, .Warning, .Danger, .Info]
        
        let wemoCell = UINib(nibName: "WemoCell", bundle: nil)
        self.tableview.register(wemoCell, forCellReuseIdentifier: "wemoCell")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return self.viewmodel.cellArrangements?.count ?? 0
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            if let cell = self.tableview.dequeueReusableCell(withIdentifier: "wemoCell") as? WemoCell{
                cell.type = self.viewmodel.cellArrangements![indexPath.row]
                

                if self.viewmodel.isDanger{
                    if self.viewmodel.cellArrangements![indexPath.row] == .Danger{
                        cell.isUserInteractionEnabled = true
                    }else{
                        cell.isUserInteractionEnabled = false
                    }
                }else{
                    cell.isUserInteractionEnabled = true
                }
                
                return cell
            }
        }else{
            let cell = UITableViewCell()
            cell.textLabel?.text = "用戶點擊了：\(self.viewmodel.viewText)"
            return cell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            guard let cellArr = self.viewmodel.cellArrangements else{
                return
            }
        
            if let cell = self.tableview.cellForRow(at: indexPath) as? WemoCell{
                cell.isSelectCell = !cell.isSelectCell
                
                if cellArr[indexPath.row] == .Danger{
                    self.viewmodel.isDanger = !self.viewmodel.isDanger
                }
            }
            
            if indexPath.row < cellArr.count{
                self.viewmodel.onSelectCell(type: cellArr[indexPath.row])
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 70
        }else{
            return 44
        }
    }
    
    func refreshTable() {
        self.tableview.reloadData()
    }
}

