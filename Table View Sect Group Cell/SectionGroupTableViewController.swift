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

struct MonthSection : Comparable {
    
    var month : Date
    var headlines : [Headline]
    
    static func < (lhs: MonthSection, rhs: MonthSection) -> Bool {
        return lhs.month < rhs.month
    }
    
    static func == (lhs: MonthSection, rhs: MonthSection) -> Bool {
        return lhs.month == rhs.month
    }
    
    static func group(headlines : [Headline]) -> [MonthSection] {
        let groups = Dictionary(grouping: headlines) { (headline) -> Date in
            return firstDayOfMonth(date: headline.date)
        }
        return groups.map(MonthSection.init(month:headlines:)).sorted()
    }
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
        // 12 - December - Winter, id 1 - 4
        Headline(id: 1, date: parseDate("2018-12-15"), title: "Broccoli", text: "Winter", image: "12Dec_Broc"),
        Headline(id: 2, date: parseDate("2018-12-15"), title: "Grapefruit", text: "Winter", image: "12Dec_Grap"),
        Headline(id: 3, date: parseDate("2018-12-15"), title: "Sweet Potato", text: "Winter", image: "12Dec_Swt"),
        Headline(id: 4, date: parseDate("2018-12-15"), title: "Mushroom", text: "Winter", image: "12Dec_Mush"),
        
        // 01 - January - Winter, id 5 - 8
        Headline(id: 5, date: parseDate("2019-01-15"), title: "Lemon", text: "Winter", image: "01Jan_Lem"),
        Headline(id: 6, date: parseDate("2019-01-15"), title: "Turnip", text: "Winter", image: "01Jan_Tur"),
        Headline(id: 7, date: parseDate("2019-01-15"), title: "Tangerine", text: "Winter", image: "01Jan_Tan"),
        Headline(id: 8, date: parseDate("2019-01-15"), title: "Leeks", text: "Winter", image: "01Jan_Lee"),
        
        // 02 - February - Winter, id 9 - 12
        Headline(id: 9, date: parseDate("2019-02-15"), title: "Orange", text: "Winter", image: "02Feb_Orn"),
        Headline(id: 10, date: parseDate("2019-02-15"), title: "Brussel Sprouts", text: "Winter", image: "02Feb_Brs"),
        Headline(id: 11, date: parseDate("2019-02-15"), title: "Kale", text: "Winter", image: "02Feb_Kale"),
        Headline(id: 12, date: parseDate("2019-02-15"), title: "Tangelo", text: "Winter", image: "02Feb_Tan"),
        
        // 03 - March - Spring, id 13 - 16
        Headline(id: 13, date: parseDate("2019-03-15"), title: "Artichoke", text: "Spring", image: "03Mar_Art"),
        Headline(id: 14, date: parseDate("2019-03-15"), title: "Mushroom", text: "Spring", image: "03Mar_Mush"),
        Headline(id: 15, date: parseDate("2019-03-15"), title: "Pineapple", text: "Spring", image: "03Mar_Pin"),
        Headline(id: 16, date: parseDate("2019-03-15"), title: "Cauliflower", text: "Spring", image: "03Mar_Cali"),
        
        // 04 - April - Spring, id 17 - 20
        Headline(id: 17, date: parseDate("2019-04-15"), title: "Asparagus", text: "Spring", image: "04Apr_Asp"),
        Headline(id: 18, date: parseDate("2019-04-15"), title: "Spring Peas", text: "Spring", image: "04Apr_Spr"),
        Headline(id: 19, date: parseDate("2019-04-15"), title: "Rhubarb", text: "Spring", image: "04Apr_Rhu"),
        Headline(id: 20, date: parseDate("2019-04-15"), title: "Cauliflower", text: "Spring", image: "04Apr_Cali"),
        
        // 05 - May - Spring, id 21 - 24
        Headline(id: 21, date: parseDate("2019-05-15"), title: "Zucchini", text: "Spring", image: "05May_Zuc"),
        Headline(id: 22, date: parseDate("2019-05-15"), title: "Strawberry", text: "Spring", image: "05May_Str"),
        Headline(id: 23, date: parseDate("2019-05-15"), title: "Cherries", text: "Spring", image: "05May_Chr"),
        Headline(id: 24, date: parseDate("2019-05-15"), title: "Mangoes", text: "Spring", image: "05May_Man"),
        
        // 06 - June - Summer, id 25 - 28
        Headline(id: 25, date: parseDate("2019-06-15"), title: "Apricots", text: "Summer", image: "06June_Apr"),
        Headline(id: 26, date: parseDate("2019-06-15"), title: "Blueberry", text: "Summer", image: "06June_Blu"),
        Headline(id: 27, date: parseDate("2019-06-15"), title: "Mangoes", text: "Summer", image: "06June_Man"),
        Headline(id: 28, date: parseDate("2019-06-15"), title: "Peach", text: "Summer", image: "06June_Pea"),
        
        // 07 - July - Summer, id 29 - 32
        Headline(id: 29, date: parseDate("2019-07-15"), title: "Pepper", text: "Summer", image: "07July_Pep"),
        Headline(id: 30, date: parseDate("2019-07-15"), title: "Raspberry", text: "Summer", image: "07July_Rasp"),
        Headline(id: 31, date: parseDate("2019-07-15"), title: "Plums", text: "Summer", image: "07July_Plum"),
        Headline(id: 32, date: parseDate("2019-07-15"), title: "Watermelon", text: "Summer", image: "07July_Wat"),
        
        // 08 - August - Summer, id 33 - 36
        Headline(id: 33, date: parseDate("2019-08-15"), title: "Tomato", text: "Summer", image: "08Aug_Tom"),
        Headline(id: 34, date: parseDate("2019-08-15"), title: "Cucumbers", text: "Summer", image: "08Aug_Cuc"),
        Headline(id: 35, date: parseDate("2019-08-15"), title: "Green Peas", text: "Summer", image: "08Aug_Grn"),
        Headline(id: 36, date: parseDate("2019-08-15"), title: "Corn", text: "Summer", image: "08Aug_Crn"),
        
        // 09 - September - Fall, id 37 - 40
        Headline(id: 37, date: parseDate("2019-09-15"), title: "Squash", text: "Fall", image: "09Sept_Squ"),
        Headline(id: 38, date: parseDate("2019-09-15"), title: "Apple", text: "Fall", image: "09Sept_App"),
        Headline(id: 39, date: parseDate("2019-09-15"), title: "Egg Plant", text: "Fall", image: "09Sept_Egg"),
        Headline(id: 40, date: parseDate("2019-09-15"), title: "Grapes", text: "Fall", image: "09Sept_Gps"),
        
        // 10 - October - Fall, id 41 - 44
        Headline(id: 41, date: parseDate("2019-10-15"), title: "Pumpkin", text: "Fall", image: "10Oct_Pump"),
        Headline(id: 42, date: parseDate("2019-10-15"), title: "Spinach", text: "Fall", image: "10Oct_Spn"),
        Headline(id: 43, date: parseDate("2019-10-15"), title: "Winter Squash", text: "Fall", image: "10Oct_Ws"),
        Headline(id: 44, date: parseDate("2019-10-15"), title: "Persimmon", text: "Fall", image: "10Oct_Per"),
        
        // 11 - November - Fall, id 45 - 48
        Headline(id: 45, date: parseDate("2019-11-15"), title: "Beets", text: "Fall", image: "11Nov_Bts"),
        Headline(id: 46, date: parseDate("2019-11-15"), title: "Pears", text: "Fall", image: "11Nov_Pear"),
        Headline(id: 47, date: parseDate("2019-11-15"), title: "Cabbage", text: "Fall", image: "11Nov_Cab"),
        Headline(id: 48, date: parseDate("2019-11-15"), title: "Parsnips", text: "Fall", image: "11Nov_Pars")
    ]
    
    var sections = [MonthSection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sections = MonthSection.group(headlines: self.headlines)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.sections[section]
        let date = section.month
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
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
        cell.textLabel?.text = headline.title
        cell.detailTextLabel?.text = headline.text
        cell.imageView?.image = UIImage(named: headline.image)

        return cell
    }
}
