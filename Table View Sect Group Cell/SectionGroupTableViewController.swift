//
//  SectionGroupTableViewController.swift
//  Table View Sect Group Cell
//
//  Created by Mirko Cukich on 9/3/19.
//  Copyright © 2019 Digital Mirko. All rights reserved.
//
//  Swift TableView Section Grouping Demo - Demo 14 of 30

import UIKit

struct Headline {
    var id : Int
    var title : String
    var text : String
    var image : String
}

class SectionGroupTableViewController: UITableViewController {
    
    var headlines = [
        Headline(id: 1, title: "Broccoli", text: "Winter", image: "12Dec_Broc"),
        Headline(id: 2, title: "Grapefruit", text: "Winter", image: "12Dec_Grap"),
        Headline(id: 3, title: "Sweet Potatoe", text: "Winter", image: "12Dec_Swt"),
        Headline(id: 4, title: "Mushrooms", text: "Winter", image: "12Dec_Mush")
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return headlines.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Swift TableView Section Grouping Demo"
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)

        //cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
        let headline = headlines[indexPath.row]
        cell.textLabel?.text = headlines[indexPath.row].title
        cell.detailTextLabel?.text = headline.text
        cell.imageView?.image = UIImage(named: headline.image)

        return cell
    }

}
