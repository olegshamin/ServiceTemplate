//
//  ViewController.swift
//  ServiceTemplate
//
//  Created by Oleg Shamin on 20/01/2019.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    private let personService = ServiceFactory.shared.personService
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // we always has an error because we use google.com instead of our server url
        // but if we create person in database his name will print in console
        
        let person = Person(id: "abcde123", name: "Alice", age: 20, height: 170)
        create(person)

    }
    
    // MARK: Private helpers
    
    private func create(_ person: Person) {
        
        personService.create(person) { [weak self] result in
            
            self?.fetch(with: person.id)

            switch result {
            case .success:
                print("Created success")
            case .failure(let error):
                print("Create with error: \(error.localizedDescription)")
            }
        }
    }
    
    private func fetch(with id: String) {
        personService.person(with: id) { result in
            switch result {
            case .success(let person):
                print("person fetched with name = \(person.name)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

