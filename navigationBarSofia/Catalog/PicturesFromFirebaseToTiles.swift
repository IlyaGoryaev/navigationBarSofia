import Foundation
import UIKit


class PicturesFromFirebseToTiles{
    
    static let tiles = PicturesFromFirebseToTiles()
    
    
    func initTiles(nameFolder: String) -> [CatalogTileView]{
        
        var tiles: [CatalogTileView] = []
        
        let description: String = "Стоимость этой кухни: 26000 руб"
        
        for i in 0...TilesNames.tilesNames.count - 1{
            
            tiles.append(CatalogTileView(TilesNames.tilesNames[i], description, "Лайм"))
            
            FirebaseDownload.shared.getPicture(name: TilesNames.tilesNames[i] + ".jpg", nameFolder: nameFolder) { pic in
                
                tiles[i].image.image = pic
                
            }
            
        }
        
        return tiles
        
    }
    
}
