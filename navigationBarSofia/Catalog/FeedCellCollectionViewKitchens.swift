import UIKit
import Firebase
import FirebaseStorage

class FeedCellCollectionViewKitchens: UICollectionViewCell {
    
    var nameFavArray: [String] = TilesNames.tilesNames
    
    var count: Int = 0
    
    let view = DetailViewController()
    
    
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
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCellId", for: indexPath) as? KitchensCell{
            let representedId = indexPath.row
            cell.representedId = String(representedId)
            cell.imageView.image = nil
            cell.label.isHidden = true
            cell.subView.isHidden = true
            cell.favButton.isHidden = true
            cell.downloadingController.startAnimating()
            
            FirebaseDownload.shared.getPicture(name: nameFavArray[indexPath.row] + ".jpeg", nameFolder: "Kitchens") { pic in
                if cell.representedId == String(representedId){
                    cell.imageView.image = pic
                    cell.label.isHidden = false
                    cell.subView.isHidden = false
                    cell.favButton.isHidden = false
                    cell.downloadingController.stopAnimating()
                }
            }
            cell.backgroundColor = .white
            cell.label.text = nameFavArray[indexPath.row]
            cell.label.font = UIFont(name: "Inter", size: 18)
            if AppDelegate.defaults.value(forKey: cell.label.text!) as? Int == 1{
                
                cell.favButton.setImage(UIImage(named: "HeartRed3"), for: .normal)
                
            } else {
                cell.favButton.setImage(UIImage(named: "HeartW"), for: .normal)
            }
            
            return cell
        }
        
        
        
        return UICollectionViewCell()
        
    }
    
    
}


extension FeedCellCollectionViewKitchens: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSizeMake(frame.width, 330)
        
    }
    
    
    
}
extension FeedCellCollectionViewKitchens{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = UIViewController()
        controller.modalPresentationStyle = .fullScreen
        controller.view.backgroundColor = .red
        let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(backButton)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.label, for: .normal)
        NSLayoutConstraint.activate([
            backButton.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor),
            backButton.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor)
        
        ])
        
        
        if let controllerView = UIApplication.shared.delegate?.window?!.windowScene?.keyWindow?.rootViewController as? TabBarController{
            print("gferfer")
            
            
            
        }
    }
}

extension FeedCellCollectionViewKitchens{
    
    @objc func dismissController(){
        
        view.view.isHidden = true
        
        
    }
    
    @objc func dismissController1(){
        
        UIApplication.shared.delegate?.window?!.windowScene?.keyWindow?.rootViewController?.dismiss(animated: true)
    }

}
