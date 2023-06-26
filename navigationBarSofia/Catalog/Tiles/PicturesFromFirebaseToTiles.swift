import Foundation
import UIKit


class PicturesFromFirebseToTiles{
    
    public static let tiles = PicturesFromFirebseToTiles()
    
    func initTiles(nameFolder: String) -> [CatalogTileView]{
        
        var tiles: [CatalogTileView] = []
        
        let description: String = "Кухня с фасадами из пластика. Одним из самых популярных материалов для изготовления кухонных фасадов считается пластик. Благодаря эффектному внешнему виду, богатой палитре цветов и фактуры фасады из пластикасоздают оригинальные комбинации."

        
        for i in 0...TilesNames.tilesNames.count - 1{
            
            tiles.append(CatalogTileView(TilesNames.tilesNames[i], description, "Лайм"))
            
            FirebaseDownload.shared.getPicture(name: TilesNames.tilesNames[i] + ".jpg", nameFolder: nameFolder) { pic in
                
                tiles[i].imageButton.setImage(pic, for: .normal)
                downloadFromFirebase { array in
                    
                    
                    
                    for name in array{
                        
                        
                        if tiles[i].label.text! == name{
                            
                            tiles[i].favButton.setImage(UIImage(named: "HeartRed3"), for: .normal)
                            
                            AppDelegate.defaults.set(1, forKey: name)
                            
                            tiles[i].loadingIndicator.stopAnimating()
                            tiles[i].loadingIndicator.isHidden = true
                            tiles[i].imageButton.isHidden = false
                            tiles[i].loadingViewLabel.isHidden = true
                            tiles[i].loadingViewTextDescription.isHidden = true
                            tiles[i].label.isHidden = false
                            tiles[i].labelDescription.isHidden = false
                            
                        }
                        
                        
                        
                    }
                    tiles[i].loadingIndicator.stopAnimating()
                    tiles[i].imageButton.isHidden = false
                    tiles[i].loadingViewLabel.isHidden = true
                    tiles[i].loadingViewTextDescription.isHidden = true
                    tiles[i].label.isHidden = false
                    tiles[i].labelDescription.isHidden = false
                }
                
            }
            
        }
        
        return tiles
        
    }
    
}
