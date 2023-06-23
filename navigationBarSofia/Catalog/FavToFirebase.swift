import UIKit
import Firebase

class FavoritesToFirebase{
    
    static let FavoritesSave = FavoritesToFirebase()
    
    
    func saveToFirebase(name: String){
        
        let ref = Database.database().reference().child("Favorites")
        ref.child(name).updateChildValues(
            ["name": name]
        )
        
        
    }
    
    func deleteFromFirebase(name: String){
        
        let ref = Database.database().reference().child("Favorites")
        ref.child(name).removeValue()
        
        
    }
    
    
    
}
