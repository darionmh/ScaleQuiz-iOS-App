//
//  TableViewController.swift
//  Scale Quiz
//
//  Created by Bobby Bearcat on 11/4/15.
//  Copyright © 2015 Darion Higgins. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet weak var majorCountLabel: UILabel!
    @IBOutlet weak var minorCountLabel: UILabel!
    @IBOutlet weak var naturalSwitch: UISwitch!
    @IBOutlet weak var harmonicSwitch: UISwitch!
    @IBOutlet weak var melodicSwitch: UISwitch!
    @IBOutlet weak var sharpCountLabel: UILabel!
    @IBOutlet weak var flatCountLabel: UILabel!
    
    var majorCount = 0
    var minorCount = 0
    
    var maxSharps = 6
    var maxFlats = 6
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func majorPlusTouch(sender: AnyObject) {
        majorCount += 1
        updateLabels()
    }
    @IBAction func majorMinusTouch(sender: AnyObject) {
        if(majorCount > 0){
            majorCount -= 1
            updateLabels()
        }
    }
    
    @IBAction func minorPlusTouch(sender: AnyObject) {
        minorCount += 1
        updateLabels()
    }
    @IBAction func minorMinusTouch(sender: AnyObject) {
        if(minorCount > 0){
            minorCount -= 1
            updateLabels()
        }
    }
    
    
    
    @IBAction func sharpPlusTouch(sender: AnyObject) {
        if(maxSharps < 6){
            maxSharps += 1
            updateLabels()
        }
    }
    @IBAction func sharpMinusTouch(sender: AnyObject) {
        if(maxSharps > 0){
            maxSharps -= 1
            updateLabels()
        }
    }
    
    @IBAction func flatPlusTouch(sender: AnyObject) {
        if(maxFlats < 6){
            maxFlats += 1
            updateLabels()
        }
    }
    @IBAction func flatMinusTouch(sender: AnyObject) {
        if(maxFlats > 0){
            maxFlats -= 1
            updateLabels()
        }
    }
    
    
    var switchesNeedUpdate = true
    func updateLabels(){
        majorCountLabel.text! = "\(majorCount)"
        minorCountLabel.text! = "\(minorCount)"
        sharpCountLabel.text! = "\(maxSharps)"
        flatCountLabel.text! = "\(maxFlats)"
        
        if(minorCount > 0){
            if(switchesNeedUpdate){
                naturalSwitch.on = true
                harmonicSwitch.on = true
                melodicSwitch.on = true
                switchesNeedUpdate = false
            }
            
            naturalSwitch.userInteractionEnabled = true
            harmonicSwitch.userInteractionEnabled = true
            melodicSwitch.userInteractionEnabled = true
            
        }else{
            naturalSwitch.on = false
            harmonicSwitch.on = false
            melodicSwitch.on = false
            
            naturalSwitch.userInteractionEnabled = false
            harmonicSwitch.userInteractionEnabled = false
            melodicSwitch.userInteractionEnabled = false
            
            switchesNeedUpdate = true
        }
    }
    
    @IBAction func beginTouch(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(majorCount, forKey: "MajorCount")
        defaults.setInteger(minorCount, forKey: "MinorCount")
        defaults.setBool(naturalSwitch.on, forKey: "Natural?")
        defaults.setBool(harmonicSwitch.on, forKey: "Harmonic?")
        defaults.setBool(melodicSwitch.on, forKey: "Melodic?")
        defaults.setInteger(maxSharps, forKey: "MaxSharps")
        defaults.setInteger(maxFlats, forKey: "MaxFlats")
        
        let vc = QuizTableViewController()
        //self.presentViewController(vc, animated: true, completion: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return 8
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
