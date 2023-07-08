
import Foundation
import Firebase
import FirebaseStorage

class FirebaseDownload{
    
    var imageCache = NSCache<NSString, UIImage>()
    
    static let shared = FirebaseDownload()
    
    
    let store = Storage.storage()
    let storeRef = Storage.storage().reference()
    
    var imageStorageReference: StorageReference?
    
    
    
    func getPicture(name: String, nameFolder: String, completion: @escaping (UIImage) -> Void){
        
        if let cachedImage = imageCache.object(forKey: "\(nameFolder)/\(name)" as NSString){
            completion(cachedImage)
        } else {
            
            
            
            let logoRef = self.storeRef.child("\(nameFolder)/\(name)")
            
            imageStorageReference = logoRef
            
            var image: UIImage? = UIImage(named: "Лайм")!
            
            logoRef.getData(maxSize: 2048 * 1024, completion: {data, error in
                
                if error != nil{
                    print(error)
                    return
                }
                
                image = UIImage(data: data!)!
                self.imageCache.setObject(image!, forKey: "\(nameFolder)/\(name)" as NSString)
                completion(image!)
                
                
                
            }).resume()
        }
    }
    
}

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView{
    
    var imageStorageReference: StorageReference?
    
    let store = Storage.storage()
    
    let storeRef = Storage.storage().reference()
    
    
    func getPicture(name: String, nameFolder: String){
        
        self.image = nil
        
        if let cachedImage = imageCache.object(forKey: "\(nameFolder)/\(name)" as NSString){
            self.image = cachedImage as? UIImage
            return
        }
            
            
            let logoRef = self.storeRef.child("\(nameFolder)/\(name)")
            
            imageStorageReference = logoRef
            
            var image = UIImage(named: "Лайм")!
            
            logoRef.getData(maxSize: 2048 * 1024, completion: {data, error in
                
                if error != nil{
                    print(error)
                    return
                }
                
            
                (Dispatch.DispatchQueue.main).async {
                    image = UIImage(data: data!)!
                    
                    if self.imageStorageReference == logoRef.child("\(nameFolder)/\(name)"){
                        self.image = image
                    }
                    imageCache.setObject(image, forKey: "\(nameFolder)/\(name)" as NSString)
                }
                
                
                
            }).resume()
        }
}
