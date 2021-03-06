//
//  TrainCodeDetailViewController.swift
//  12306ForMac
//
//  Created by fancymax on 2016/06/12.
//  Copyright © 2016年 fancy. All rights reserved.
//

import Cocoa

class TrainCodeDetailViewController: NSViewController {
    var service = Service()
    
    var queryByTrainCodeParam: QueryByTrainCodeParam? {
        didSet{
//            print("\(queryByTrainCodeParam.ToGetParams())")
            if oldValue != nil {
                if oldValue!.ToGetParams() == queryByTrainCodeParam!.ToGetParams() {
                    return
                }
            }
            
            if self.trainCodeDetails != nil {
                self.trainCodeDetails!.trainNos!.removeAll()
                self.trainCodeDetailTable.reloadData()
            }
            
            let successHandler = { (trainDetails:TrainCodeDetails)->()  in
                self.trainCodeDetails = trainDetails
                self.trainCodeDetailTable.reloadData()
                self.trainCodeDetailTable.scrollRowToVisible(0)
            }
            
            let failureHandler = {(error:NSError)->() in
            }
            
            service.queryTrainNoFlowWith(queryByTrainCodeParam!, success: successHandler, failure: failureHandler)
        }
    }
    @IBOutlet weak var trainCodeDetailTable: NSTableView!
    
    var trainCodeDetails: TrainCodeDetails?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup Table Header
        for col in trainCodeDetailTable.tableColumns {
            col.headerCell = TrainCodeDetailHeaderCell(textCell: col.headerCell.stringValue)
            col.headerCell.alignment = .Center
        }
        
    }
    
}

// MARK: - NSTableViewDataSource 
extension TrainCodeDetailViewController: NSTableViewDataSource{
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        if trainCodeDetails == nil {
            return 0
        }
        return trainCodeDetails!.trainNos.count
    }
    
    func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
        if trainCodeDetails == nil {
            return nil
        }
        return trainCodeDetails!.trainNos[row]
    }
}