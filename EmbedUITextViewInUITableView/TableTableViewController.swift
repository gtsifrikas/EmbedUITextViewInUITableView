//
//  TableTableViewController.swift
//  UI
//
//  Created by George Tsifrikas on 27/10/2018.
//  Copyright © 2018 George Tsifrikas. All rights reserved.
//

import UIKit

public class TableTableViewController: UITableViewController {

    var models: [String] = []
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        models = (0...100).map { _ in randomInt(min: 2, max: 10) }.map(Lorem.sentences)
    }

    // MARK: - Table view data source
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return models[indexPath.row]
            .heightWithConstrainedWidth(width: tableView.frame.width, font: UIFont.systemFont(ofSize: 14))
    }

    override public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TextTableViewCell
        
        cell.textView.text = models[indexPath.row]
        cell.label.text = models[indexPath.row]
        
        cell.textChanged {[weak tableView, weak self] newText in
            self?.models[indexPath.row] = newText
            cell.label.text = newText
            
            DispatchQueue.main.async {
                tableView?.beginUpdates()
                tableView?.endUpdates()
            }
        }
        return cell
    }
    
    private func randomInt(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
}
