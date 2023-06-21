import Foundation

class PicturesFromFirebseToTiles{
    
    static let tiles = PicturesFromFirebseToTiles()
    
    
    func initTiles(nameFolder: String) -> [CatalogTileView]{
        
        var tiles: [CatalogTileView] = []
        
        for i in 0...TilesNames.tilesNames.count - 1{
            
            tiles.append(CatalogTileView(TilesNames.tilesNames[i], "Лайм"))
            
            FirebaseDownload.shared.getPicture(name: TilesNames.tilesNames[i] + ".jpg", nameFolder: nameFolder) { pic in
                
                tiles[i].image.image = pic
                
            }
                    
            
            
        }
        
        return tiles
        
    }
    
    
}
