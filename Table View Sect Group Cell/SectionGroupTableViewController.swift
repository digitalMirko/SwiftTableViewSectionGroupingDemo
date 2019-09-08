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
    var date : Date
    var title : String
    var text : String
    var image : String
}

///////
struct MonthSection {
    
    var month : Date
    var headlines : [Headline]
}

fileprivate func parseDate(_ str : String) -> Date {
    let dateFormat = DateFormatter()
    dateFormat.dateFormat = "yyyy-MM-dd"
    return dateFormat.date(from: str)!
}

fileprivate func firstDayOfMonth(date : Date) -> Date {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year, .month], from: date)
    return calendar.date(from: components)!
}


class SectionGroupTableViewController: UITableViewController {
    
    var headlines = [
        Headline(id: 1, date: parseDate("2018-12-15"), title: "Broccoli", text: "Winter", image: "12Dec_Broc"),
        Headline(id: 2, date: parseDate("2018-12-15"), title: "Grapefruit", text: "Winter", image: "12Dec_Grap"),
        Headline(id: 3, date: parseDate("2018-12-15"), title: "Sweet Potatoe", text: "Winter", image: "12Dec_Swt"),
        Headline(id: 4, date: parseDate("2018-12-15"), title: "Mushrooms", text: "Winter", image: "12Dec_Mush"),
        Headline(id: 5, date: parseDate("2019-01-15"), title: "Sweet Potatoe", text: "Winter", image: "12Dec_Swt"),
        Headline(id: 6, date: parseDate("2019-01-15"), title: "Mushrooms", text: "Winter", image: "12Dec_Mush")
    ]
    
    var sections = [MonthSection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let groups = Dictionary(grouping: self.headlines) { (headline) -> Date in
            return firstDayOfMonth(date: headline.date)
        }
        self.sections = groups.map(MonthSection.init(month:headlines:))
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.sections[section]
        let date = section.month
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: date)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.sections[section]
        return section.headlines.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)

        let section = self.sections[indexPath.section]
        let headline = section.headlines[indexPath.row]
        cell.textLabel?.text = headlines[indexPath.row].title
        cell.detailTextLabel?.text = headline.text
        cell.imageView?.image = UIImage(named: headline.image)

        return cell
    }

    
}
