//
//  ViewController.swift
//  Journal
//
//  Created by Nelson Gonzalez on 4/3/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var postController: PostController?
    var entries: Journal? {
        didSet {
            updateViews()
        }
    }
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateViews()
        
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    private func updateViews() {
        guard isViewLoaded else {return}
        
        //Here i would like to display the post.description on the textView but how can i get it?
        
     //   descriptionTextView.text = entries?.posts.first?.description
        
    }

    @IBAction func saveBarButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let description = descriptionTextView.text, !description.isEmpty, let entries = entries else {return}
        
        postController?.createPost(with: entries, description: description)
        
    //    self.navigationController?.popViewController(animated: true)
        
        tableView.reloadData()
        
        descriptionTextView.text = nil
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTemp" {
        let destinationVC = segue.destination as? TemperatureViewController
        destinationVC?.postController = postController
        destinationVC?.entries = entries
        }
    }
    @IBAction func addTemperatureBarButtonPressed(_ sender: UIBarButtonItem) {
        
        self.performSegue(withIdentifier: "toTemp", sender: self)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return entries?.posts.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let posts = entries?.posts[indexPath.row]
        
        switch posts?.postType {
        case .text?:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "postsCell", for: indexPath)
            cell.textLabel?.text = posts?.description
            
            return cell
            
       case .temperature?:
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tempCell", for: indexPath)
        
        cell.textLabel?.text = posts?.temperature
        
        return cell
            
        case .none:
            return UITableViewCell()
        }
        
        
        
    }
    
    
    
}
