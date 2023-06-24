import Foundation
import UIKit


class PicturesFromFirebseToTiles{
    
    static let tiles = PicturesFromFirebseToTiles()
    
    
    func initTiles(nameFolder: String) -> [CatalogTileView]{
        
        var tiles: [CatalogTileView] = []
        
        let description: String = "Кухня с фасадами из пластика. Одним из самых популярных материалов для изготовления кухонных фасадов считается пластик. Благодаря эффектному внешнему виду, богатой палитре цветов и фактуры фасады из пластикасоздают оригинальные комбинации."

        
        for i in 0...TilesNames.tilesNames.count - 1{
            
            tiles.append(CatalogTileView(TilesNames.tilesNames[i], description, "Лайм"))
            
            FirebaseDownload.shared.getPicture(name: TilesNames.tilesNames[i] + ".jpg", nameFolder: nameFolder) { pic in
                
                tiles[i].imageButton.setImage(pic, for: .normal)
                tiles[1].imageButton.setImage(UIImage(named: "Лечче"), for: .normal)
                
            }
            
        }
        
        return tiles
        
    }
    
}
