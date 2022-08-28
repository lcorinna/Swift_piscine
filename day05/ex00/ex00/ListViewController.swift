//
//  ListViewController.swift
//  ex00
//
//  Created by Lashaun Corinna on 8/16/22.
//

import UIKit
import Swift

class ListViewController: UIViewController {

    @IBOutlet weak var myTableVie: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableVie.delegate = self
        myTableVie.dataSource = self

    }

}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.textLabel?.text = places[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mapViewController = self.tabBarController!.viewControllers![0] as! MapViewController
        mapViewController.place = places[indexPath.row]
        self.tabBarController?.selectedIndex = 0
    }
    
}
