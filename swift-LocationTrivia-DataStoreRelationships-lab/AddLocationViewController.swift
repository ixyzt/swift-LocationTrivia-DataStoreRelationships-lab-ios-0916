//
//  AddLocationViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Bejan Fozdar on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class AddLocationViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var latitudeTextField: UITextField!
    
    @IBOutlet weak var longitudeTextField: UITextField!
    
    var store: LocationDataStore = LocationDataStore.sharedInstance
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.accessibilityLabel = "nameField"
        nameTextField.accessibilityIdentifier = "nameField"

        latitudeTextField.accessibilityLabel = "latitudeField"
        latitudeTextField.accessibilityIdentifier = "latitudeField"

        longitudeTextField.accessibilityLabel = "longitudeField"
        longitudeTextField.accessibilityIdentifier = "longitudeField"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cancelButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        dump(store)
    }
    
    @IBAction func saveButton(_ sender: AnyObject) {
        guard let latitudeValue = Float(latitudeTextField.text!) else { return }
        guard let longitudeValue = Float(longitudeTextField.text!) else { return }
        
        store.locations.append(Location.init(name: nameTextField.text!, latitude: latitudeValue, longitude: longitudeValue))
        dump(store)
        self.dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
