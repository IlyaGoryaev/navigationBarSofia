
import Firebase


func downloadFromFirebase( completion: @escaping ([String]) -> Void){
    
    let ref = Database.database().reference().child("Favorites")
    
    var favorites: [String] = []
    
    ref.getData { error, snapshot in
        guard error == nil else { print("Ошибка 1")
            return }
        
        guard let snapshotValue = snapshot?.value as? [String: AnyObject] else { print("Ошибка 2")
            return }
        
        for item in snapshotValue {
            
            favorites.append(item.key)
            
            
        }
        
        
        completion(favorites)
        
    }
}


func downloadNamesFromFirebase(completion: @escaping ([String]) -> Void){
    
    let ref = Database.database().reference().child("Kichens")
    
    var names: [String] = []
    
    ref.getData { error, snapshot in
        if error != nil{
            print(error!)
        }
        
        guard let snapshotValues = snapshot?.value as? [String: AnyObject] else {
            return
        }
        
        
        
        for name in snapshotValues{
            names.append(name.key)
        }
        
        
        
        completion(names)
    }
    
    

}
