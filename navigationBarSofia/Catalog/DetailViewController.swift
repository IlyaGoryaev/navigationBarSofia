

import UIKit
import Firebase

class DetailViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    var name: String?
    
    
    override init(collectionViewLayout layoutCollection: UICollectionViewLayout) {
        super.init(collectionViewLayout: layoutCollection)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
        
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
            
        }
        style()
        layout()
        
    }
    
    init(collectionViewLayout layoutCollection: UICollectionViewLayout, name: String){
        super.init(collectionViewLayout: layoutCollection)
        self.name = name
        collectionView.register(CellKitchenToDetailController.self, forCellWithReuseIdentifier: "cellId")
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
        
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
            
        }
        style()
        layout()
        collectionView.isPagingEnabled = true
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
extension DetailViewController{
    
    func style(){
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func layout(){
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.35)
        
        ])
        
    }
    
    
}
extension DetailViewController{
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as? CellKitchenToDetailController{
            cell.backgroundColor = .systemGray5
            cell.imageView.image = nil
            FirebaseDownload.shared.getPictureForDetail(name: self.name! + String(indexPath.row + 1) + ".jpeg", nameFolder: "KitchensDetails", nameSubFolder: self.name!) { pic in
                cell.imageView.image = pic
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = AppDelegate.defaults.object(forKey: name!) as? Int{
            return count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSizeMake(view.frame.width, view.frame.height * 0.35)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.collectionView.layoutIfNeeded()
    }
    
}





