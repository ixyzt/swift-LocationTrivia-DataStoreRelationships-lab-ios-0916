//
//  LocationsTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Bejan Fozdar on 10/24/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class LocationsTableViewController: UITableViewController {

    var store: LocationDataStore = LocationDataStore.sharedInstance
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.accessibilityLabel = "Locations Table"
        self.tableView.accessibilityIdentifier = "Locations Table"
        store.generateStartingLocationsData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return store.locations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)

        cell.textLabel?.text = store.locations[indexPath.row].name
        cell.detailTextLabel?.text = String(store.locations[indexPath.row].trivia.count)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "triviaSegue" {
            if let dest = segue.destination as? TriviaTableViewController,
                let index = tableView.indexPathForSelectedRow {
                dest.location = store.locations[index.row]
            }
        }
        
        if segue.identifier == "addLocationSegue" {
            if let dest = segue.destination as? AddLocationViewController {
                dest.store = store
            }
        }
        
    }
}

