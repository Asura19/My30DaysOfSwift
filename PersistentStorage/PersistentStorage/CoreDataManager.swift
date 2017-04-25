//
//  CoreDataManager.swift
//  PersistentStorage
//
//  Created by Phoenix on 2017/4/24.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {

    static let shared = CoreDataManager()
    
    lazy var coreDataPath: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls.last!
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: "PersistentStorage", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.coreDataPath.appendingPathComponent("datas.sqlite")
        
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        }  catch let error {
            print("\(error)")
            abort()
        }
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        var context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = self.persistentStoreCoordinator
        return context
    }()
    
    
    func saveContext() {
        if self.managedObjectContext.hasChanges {
            do {
                try self.managedObjectContext.save()
            } catch let error {
                print("\(error)")
                abort()
            }
        }
    }
    
    func addRecord(_ content: String) {
        let entity = NSEntityDescription.entity(forEntityName: "ListEntity",
                                                in: self.managedObjectContext)
        let item = ListEntity(entity: entity!,
                              insertInto: self.managedObjectContext)
        item.content = content
        self.saveContext()
    }
    
    func deleteRecord(_ record: ListEntity) {
        self.managedObjectContext.delete(record)
        self.saveContext()
    }
}
