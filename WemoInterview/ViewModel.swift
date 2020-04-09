//
//  ViewModel.swift
//  WemoInterview
//
//  Created by Lena Lai on 4/7/20.
//  Copyright © 2020 Lena Lai. All rights reserved.
//

import Foundation

protocol ViewModelDelegate:class {
    func refreshTable()
}

class ViewModel:NSObject{

    var viewText = ""
    var isDanger:Bool = false
    
    var delegate:ViewModelDelegate?
    
    var cellArrangements:[WemoCellType]?
    
    //新增---
    override init() {
        self.cellArrangements = [.Success, .Warning, .Danger, .Info]
    }
    //-------
    
    func onRandomArray(input:[WemoCellType]?) -> [WemoCellType]?{
        if input != nil{
            return input!.shuffled()
        }
        
        return nil
    }
    
    func onSelectCell(type:WemoCellType){
        switch type {
        case .Success:
            self.onSuccess()
        case .Warning:
            self.onWarning()
        case .Danger:
            self.onDanger()
        case .Info:
            self.onInfo()
        }
        
        self.delegate?.refreshTable()
    }
    func onSuccess(){
        self.viewText = "成功樣式"
    }

    func onWarning(){
        self.viewText = "警告樣式"
    }

    func onDanger(){
        self.isDanger = !self.isDanger
        self.viewText = "危險樣式"
    }

    func onInfo(){
         self.cellArrangements = self.onRandomArray(input: cellArrangements)
        self.viewText = "資訊樣式"
    }
}
