//
//  QuizTableViewController.swift
//  Scale Quiz
//
//  Created by Bobby Bearcat on 11/4/15.
//  Copyright © 2015 Darion Higgins. All rights reserved.
//

import UIKit

class QuizTableViewController: UITableViewController {
    var Scales:ScaleSet?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults();
        let majorCount = defaults.integerForKey("MajorCount")
        let minorCount = defaults.integerForKey("MinorCount")
        let natural = defaults.boolForKey("Natural?")
        let harmonic = defaults.boolForKey("Harmonic?")
        let melodic = defaults.boolForKey("Melodic?")
        let maxSharps = defaults.integerForKey("MaxSharps")
        let maxFlats = defaults.integerForKey("MaxFlats")
        
        Scales = ScaleSet(numOfMajor: majorCount, numOfMinor: minorCount, naturalMinors: natural, harmonicMinors: harmonic, melodicMinors: melodic, numOfSharps: maxSharps, numOfFlats: maxFlats)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Scales!.AllScales.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {        
        let cell = TableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "reuseIdentifier")
        // Configure the cell...
        
        cell.scaleName.text = Scales!.AllScales[indexPath.row].toString()
        //cell.textLabel?.text = Scales!.AllScales[indexPath.row].toString()
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
