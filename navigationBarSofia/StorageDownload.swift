
import Foundation
import Firebase
import FirebaseStorage

class FirebaseDownload{
    
    var imageCache = NSCache<NSString, UIImage>()
    
    static let shared = FirebaseDownload()
    
    
    let store = Storage.storage()
    let storeRef = Storage.storage().reference()
    
    
    
    
    func getPicture(name: String, nameFolder: String, completion: @escaping (UIImage) -> Void){
        
        if let cachedImage = imageCache.object(forKey: "\(nameFolder)/\(name)" as NSString){
            completion(cachedImage)
        } else {
            
            
            let logoRef = self.storeRef.child("\(nameFolder)/\(name)")
            var image = UIImage(named: "Лайм")!
            logoRef.getData(maxSize: 2048 * 1024, completion: {data, error in
                guard error == nil else {
                    completion(image)
                    return}
                image = UIImage(data: data!)!
                self.imageCache.setObject(image, forKey: "\(nameFolder)/\(name)" as NSString)
                completion(image)
            })
        }
    }
    
}
