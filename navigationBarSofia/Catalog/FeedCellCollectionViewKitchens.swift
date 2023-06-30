import UIKit

class FeedCellCollectionViewKitchens: UICollectionViewCell {
    //Pагрузить избранное из firebase
    
    var nameFavArray: [String] = TilesNames.tilesNames
    
    var count: Int = 0
    
    
    let collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        collectionView.delegate = self
        
        collectionView.dataSource = self
                
        collectionView.register(KitchensCell.self, forCellWithReuseIdentifier: "FavoritesCellId")
        
        style()
        
        layouT()
        
        
        
        downloadFromFirebase { array in
            for name in array{
                AppDelegate.defaults.setValue(1, forKey: name)
                
            }
        }
        
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func appear(){
        
        
    }
    
    
    
    
    
}
extension FeedCellCollectionViewKitchens{
    
    func style(){
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        
    }
    
    func layouT(){
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
         
        
        ])
        
        
        
    }
    
}
extension FeedCellCollectionViewKitchens: UICollectionViewDelegate{
    
    
    
}
extension FeedCellCollectionViewKitchens: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        nameFavArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCellId", for: indexPath) as! KitchensCell?{
            
            cell.backgroundColor = .white
            
            cell.label.text = nameFavArray[indexPath.row]
            cell.label.font = UIFont(name: "Inter", size: 18)
            if AppDelegate.defaults.value(forKey: cell.label.text!) as? Int == 1{
                
                cell.favButton.setImage(UIImage(named: "HeartRed3"), for: .normal)
                
            } else {
                cell.favButton.setImage(UIImage(named: "HeartW"), for: .normal)
            }
            cell.imageView.isHidden = true
            
            FirebaseDownload.shared.getPicture(name: cell.label.text! + ".jpg", nameFolder: "Kitchens") { pic in
                cell.imageView.image = pic
                cell.imageView.isHidden = false
                
            }
            
            return cell
        }
        
        
        
        return UICollectionViewCell()
        
    }
    
    
    
}


extension FeedCellCollectionViewKitchens: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSizeMake(frame.width, 480)
        
    }
    
    
    
}
extension FeedCellCollectionViewKitchens{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //collectionView.reloadData()
        //UserDefaults
    }
    
    
}

extension FeedCellCollectionViewKitchens{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        CatalogViewControllerKitchens.kitchens.buttonFav.isHidden = true
        
    }
    
    
}
