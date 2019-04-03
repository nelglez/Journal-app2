//
//  TemperatureViewController.swift
//  Journal
//
//  Created by Nelson Gonzalez on 4/3/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class TemperatureViewController: UIViewController {
    @IBOutlet weak var temperatureTextField: UITextField!
    
    var postController: PostController?
    var entries: Journal?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
    @IBAction func saveBarButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let temp = temperatureTextField.text, !temp.isEmpty, let entry = entries else {return}
        
        postController?.createPost(with: entry, postType: .temperature, temperature: temp)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
