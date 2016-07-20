//
//  ViewController.swift
//  CodeFooiOS
//
//  Created by Drake Wempe on 7/19/16.
//  Copyright © 2016 Drake Wempe. All rights reserved.
//

import UIKit

class ViewController: UITableViewController{
    
    var dataSource = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Article.getArticles { (articles) in
            print(articles)
            self.dataSource.appendContentsOf(articles)
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let article = dataSource[indexPath.row]
        
        let cell = UITableViewCell()
        cell.textLabel?.text = article.headline
        
        return cell;
    }
}