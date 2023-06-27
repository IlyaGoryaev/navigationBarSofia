
import UIKit
import Firebase

class FeedFavorites: UIViewController{
    
    static var cellFavorites = FeedFavorites()
    
    let headerView = FavoritesHeaderView()
    
    var nameFavArray: [String] = []
    
    var count: Int = 0
    
    let collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
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
    
    @objc func backButtonTapped(){
        
        self.dismiss(animated: true)
        
        FeedCellCollectionViewKitchens.kitchens.collectionView.reloadData()
        
    }
    
    
    
    
}
extension FeedFavorites{
    
    func style(){
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    func Layout(){
        
        
        self.view.addSubview(collectionView)
        self.view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 30)
            
        
            
        
        
        ])
        
        
        
    }
    
    
    
    
    
}
extension FeedFavorites: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        
    }
    
    
    
}
extension FeedFavorites: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCellId", for: indexPath) as! FavoritesCell?{
            
            cell.backgroundColor = .white
            
            cell.label.text = nameFavArray[indexPath.row]
            cell.label.font = UIFont(name: "Inter", size: 18)
            
            FirebaseDownload.shared.getPicture(name: cell.label.text! + ".jpg", nameFolder: "Kitchens") { pic in
                cell.imageView.image = pic
            }
            
            cell.delegate = self
            
            return cell
        }
        
        
        
        return UICollectionViewCell()
        
    }
    
}

extension FeedFavorites: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSizeMake(view.frame.width, 450)
        
    }
    
    
    
}
extension FeedFavorites: FavoritesCellDelegate{
    
    
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
            
        }
    }
    
    
    
    
}
