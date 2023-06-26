
import UIKit
import Firebase

class FeedCellFavorites: UICollectionViewCell{
    
    static var cellFavorites = FeedCellFavorites()
    
    var nameFavArray: [String] = []
    
    var count: Int = 0
    
    let collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        collectionView.delegate = self
        
        collectionView.dataSource = self
                
        collectionView.register(FavoritesCell.self, forCellWithReuseIdentifier: "FavoritesCellId")
        
        style()
        
        Layout()
        
        for name in TilesNames.tilesNames{
            
            if AppDelegate.defaults.integer(forKey: name) == 1{
                
                count += 1
                
                nameFavArray.append(name)
                
            }
            
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
extension FeedCellFavorites{
    
    func style(){
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    func Layout(){
        
        
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
            
        
        
        ])
        
        
        
    }
    
    
    
    
    
}
extension FeedCellFavorites: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        
    }
    
    
    
}
extension FeedCellFavorites: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCellId", for: indexPath) as! FavoritesCell?{
            
            cell.backgroundColor = .white
            
            cell.label.text = nameFavArray[indexPath.row]
            
            FirebaseDownload.shared.getPicture(name: cell.label.text! + ".jpg", nameFolder: "Kitchens") { pic in
                cell.imageView.image = pic
            }
            
            cell.delegate = self
            
            return cell
        }
        
        
        
        return UICollectionViewCell()
        
    }
    
}

extension FeedCellFavorites: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSizeMake(frame.width, 400)
    }
    
    
    
}
extension FeedCellFavorites: FavoritesCellDelegate{
    
    
    @objc func insert() {
        let indexPath = IndexPath(row: nameFavArray.count, section: 0)
        
        nameFavArray.append(TilesNames.tilesNames.randomElement()!)
        count += 1
        
        collectionView.insertItems(at: [indexPath])
    }
    
    func delete(cell: FavoritesCell) {
        if let indexPath = collectionView.indexPath(for: cell){
            count = count - 1
            print(nameFavArray)
            
            
            for i in 0...nameFavArray.count-1{
                if nameFavArray[i] == cell.label.text!{
                    nameFavArray.remove(at: i)
                    break
                }
            }
            
            
            
            collectionView.deleteItems(at: [indexPath])
            insert()
            
        }
    }
    
    
    
    
}
