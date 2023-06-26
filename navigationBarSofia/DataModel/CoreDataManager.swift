
import CoreData
import Foundation

class CoreDataManager{
    
    lazy var persistanceContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError?{
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
                
            }
        }
        return container
    }()


    func saveContent(){
        
        let context = persistanceContainer.viewContext
        if context.hasChanges{
            
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                
            }
            
            
        }
        
        
        
    }

    
    
}
