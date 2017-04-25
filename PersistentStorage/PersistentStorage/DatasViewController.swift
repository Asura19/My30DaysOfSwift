//
//  DatasViewController.swift
//  PersistentStorage
//
//  Created by Phoenix on 2017/4/24.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit
import CoreData

enum PersistentType {
    case coreData
    case realm // I wannna use realm, but the framework is too large
}

class DatasViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var persistentType: PersistentType?
    
    var fetchedResultsController: NSFetchedResultsController<ListEntity> = {
        let request = NSFetchRequest<ListEntity>(entityName: "ListEntity")
        let sortDescriptor = NSSortDescriptor(key: "content", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        let controller = NSFetchedResultsController(fetchRequest: request,
                                                                   managedObjectContext: CoreDataManager.shared.managedObjectContext,
                                                                   sectionNameKeyPath: nil,
                                                                   cacheName: nil)
        do {
            try controller.performFetch()
        } catch {
            
        }
        return controller
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(addItem))
        
        self.fetchedResultsController.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.tableFooterView = UIView()
        
    }
    
    func addItem() {
        let alertController = UIAlertController(title: "New Item",
                                                message: "",
                                                preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm",
                                          style: .default,
                                          handler: {_ in
            
            if let field = alertController.textFields!.first {
                self.saveItem(field.text!)
            }
        })
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        
        alertController.addTextField(configurationHandler: { textField in
            textField.placeholder = "Type smothing..."
        })
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func saveItem(_ content: String) {
        
        CoreDataManager.shared.addRecord(content)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.fetchedResultsController.fetchedObjects?.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let listItem = fetchedResultsController.fetchedObjects?[indexPath.row]
        cell.textLabel?.text = listItem?.content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            
            CoreDataManager.shared.deleteRecord((self.fetchedResultsController.fetchedObjects?[indexPath.row])!)
        }
        
        delete.backgroundColor = UIColor.red
        
        return [delete]
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

   
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.reloadData()
    }
    
    
}
