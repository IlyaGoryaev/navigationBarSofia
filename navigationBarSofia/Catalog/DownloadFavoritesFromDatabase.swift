
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
//completion: @escaping (String) -> Void
