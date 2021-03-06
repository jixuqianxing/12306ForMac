//
//  GeneralPreferenceViewController.swift
//  12306ForMac
//
//  Created by fancymax on 16/8/9.
//  Copyright © 2016年 fancy. All rights reserved.
//

import Cocoa

class GeneralPreferenceViewController: NSViewController, MASPreferencesViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override var identifier: String!{
        get {
            return "GeneralPreferences"
        }
        set {
            super.identifier = newValue
        }
    }
    
    var toolbarItemImage: NSImage! {
        return NSImage(named: NSImageNamePreferencesGeneral)
    }

    var toolbarItemLabel: String! {
        return NSLocalizedString("通用", comment: "General")
    }
    
    var autoQuerySeconds: Int {
        get{
            return GeneralPreferenceManager.sharedInstance.autoQuerySeconds
        }
        set{
            GeneralPreferenceManager.sharedInstance.autoQuerySeconds = newValue
        }
    }
    
    var ifShowInvalidTicket: Bool {
        get{
            return GeneralPreferenceManager.sharedInstance.ifShowInvalidTicket
        }
        set{
            GeneralPreferenceManager.sharedInstance.ifShowInvalidTicket = newValue
        }
    }
    
    var ifShowNoTrainTicket: Bool {
        get{
            return GeneralPreferenceManager.sharedInstance.ifShowNoTrainTicket
        }
        set{
            GeneralPreferenceManager.sharedInstance.ifShowNoTrainTicket = newValue
        }
    }
    
}
