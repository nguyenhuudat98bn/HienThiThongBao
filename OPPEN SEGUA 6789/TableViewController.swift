//
//  DetailViewController.swift
//  OPPEN SEGUA 6789
//
//  Created by nguyễn hữu đạt on 5/2/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var arr = Array(1...3)
    
    @IBOutlet weak var `switch`: UIBarButtonItem!
    @IBOutlet var nodata: UIView!
    @IBOutlet weak var footerView: UIView!
    
    var hasNoData: Bool = false {
        didSet {
            hasNoData ? (tableView.backgroundView = nodata) : (tableView.backgroundView = footerView)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //        hasNoData = arr.count == 0
    //    }
    //
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(arr[indexPath.row])
        // Configure the cell...
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edititem" {
            if let indexpath = tableView.indexPathForSelectedRow {
                let dtVC = segue.destination as? DetailViewController
                dtVC?.name = String(arr[indexpath.row] )
            }
            
        }
    }
    
    @IBAction func unwind(_ sender: UIStoryboardSegue) {
        let dtVC = sender.source as? DetailViewController
        if let indexpath = tableView.indexPathForSelectedRow{
            arr[indexpath.row] = Int(dtVC?.name ?? "") ?? 0
            
        }else{
            arr.append(Int(dtVC?.name ?? "") ?? 0 )
            
            hasNoData = arr.count == 0
            if arr.count == 0 {
                tableView.tableFooterView = nodata
            } else {
                tableView.tableFooterView = footerView
            }
            //
        }
        
        tableView.reloadData()
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            hasNoData = arr.count == 0
            if arr.count == 0 {
                tableView.tableFooterView = nodata
            } else {
                tableView.tableFooterView = footerView
                //            }
                //        } else if editingStyle == .insert {
                //
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            }
            
        }
        
    }
    
    
    // MARK: - Table view delegate
    
    
    
}

