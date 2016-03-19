//
//  ViewController.swift
//  CRUD
//
//  Created by Brian Douglas on 2/21/16.
//  Copyright © 2016 MutualFun. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let moc = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        moc.persistentStoreCoordinator = CDHelper.sharedInstance.coordinator
//        createPeople(moc)
        fetchPeople(moc)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createPeople(moc: NSManagedObjectContext){
        let names = ["Jane","John","Mary","Michael"]
        for n in names{
            guard let person = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: moc) as? Person else{continue}
            person.name = n
            
        }
        do{
            try moc.save()
        }catch{
            print("Error saving!!")
        }
    }
    
    func fetchPeople(moc: NSManagedObjectContext)->[Person]?{
        let request = NSFetchRequest(entityName: "Person")
        do{
            guard let people = try moc.executeFetchRequest(request) as? [Person] else {return nil}
            for p in people{
                print(p.name)
                print(p.age)
            }
            return people
        }catch{
            print("We couldn't fetch!")
        }
        return nil
    }
    
    func updatePeople(moc: NSManagedObjectContext){
        guard let people = fetchPeople(moc) else {return}
        for p in people{
            p.age = 27
        }
        do{
            try moc.save()
        }catch{
            print("Error saving!!")
        }
    }
    
    func deletePeople(moc: NSManagedObjectContext){
        guard let people = fetchPeople(moc) else {return}
        for p in people{
            moc.deleteObject(p)
        }
        do{
            try moc.save()
        }catch{
            print("Error saving!!")
        }
    }

}

