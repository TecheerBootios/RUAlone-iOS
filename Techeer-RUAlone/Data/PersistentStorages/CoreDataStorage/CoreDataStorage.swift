//
//  CoreDataStorage.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/25.
//

import CoreData

import os

private let logger = Logger.init(subsystem: "com.techeer.KKodiac.Techeer-RUAlone", category: "CoreData")

enum CoreDataStorageError: Error {
    case readError(Error)
    case saveError(Error)
    case deleteError(Error)
}

final class CoreDataStorage {
    static let shared = CoreDataStorage()
    private init() {}

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var userEntity: NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: "User", in: context)
    }
    
    var postEntity: NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: "Post", in: context)
    }
    
    var paramEntity: NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: "Param", in: context)
    }
    
    // MARK: - Core Data stack
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataStorage")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                assertionFailure("CoreDataStorage Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                assertionFailure("CoreDataStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
    }

    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        persistentContainer.performBackgroundTask(block)
    }
    
    // MARK: TOKEN Operations
    func insertQueryParameter(_ entity: String) {
        if let paramEntity = paramEntity {
            let managedObject = NSManagedObject(entity: paramEntity, insertInto: context)
            managedObject.setValue(entity, forKey: "param")
            saveContext()
        }
    }
    
    func fetchParameters() -> [Param] {
        do {
            let request = Param.fetchRequest()
            let result = try context.fetch(request)
            return result
        } catch {
            logger.error("\(error.localizedDescription)")
        }
        
        return []
    }
    
    func fetchParameter() -> String? {
        guard let result = fetchParameters().first else {
            logger.error("Param fetch returned nil")
            return nil
        }
        return result.param
    }
    
    // MARK: USER Operations
    func insertUser(_ entity: UserEntity) {
        if let userEntity = userEntity {
            let managedObject = NSManagedObject(entity: userEntity, insertInto: context)
            managedObject.setValue(entity.name, forKey: "name")
            managedObject.setValue(entity.email, forKey: "email")
            managedObject.setValue(entity.nickname, forKey: "nickname")
            saveContext()
        }
    }
    
    private func fetchUsers() -> [User] {
        do {
            let request = User.fetchRequest()
            let result = try context.fetch(request)
            return result
        } catch {
            logger.error("\(error.localizedDescription)")
        }
        
        return []
    }
    
    func fetchUser() -> UserEntity? {
        guard let result = fetchUsers().first else {
            logger.error("User fetch returned nil")
            return nil
        }
        return UserEntity(name: result.name ?? "", email: result.email ?? "", nickname: result.nickname ?? "")
    }
    
    // MARK: POST Operations
    func insertPost(_ entity: FormModel) {
        if let postEntity = postEntity,
           let location = entity.location {
            let managedObject = NSManagedObject(entity: postEntity, insertInto: context)
            managedObject.setValue(entity.title, forKey: "title")
            managedObject.setValue(entity.address, forKey: "address")
            managedObject.setValue(entity.startAt, forKey: "startAt")
            managedObject.setValue(entity.chatURL, forKey: "chatURL")
            managedObject.setValue(entity.limitMember, forKey: "limitMember")
            managedObject.setValue(entity.foodCategory.rawValue, forKey: "foodCategory")
            managedObject.setValue(entity.postType.rawValue, forKey: "postType")
            managedObject.setValue(location.latitude, forKey: "latitude")
            managedObject.setValue(location.longitude, forKey: "longitude")
            saveContext()
        }
    }
    
    private func fetchPosts() -> [Post] {
        do {
            let request = Post.fetchRequest()
            let result = try context.fetch(request)
            return result
        } catch {
            logger.error("\(error.localizedDescription)")
        }
        return []
    }
    
    func fetchPost() -> [FormModel]? {
        let result = fetchPosts()
        return result.map { FormModel(persistence: $0) }
    }
}
