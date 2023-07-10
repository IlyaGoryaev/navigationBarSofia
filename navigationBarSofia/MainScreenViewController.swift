import UIKit


class MainScreenViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
 
    
    override init(collectionViewLayout layoutCollection: UICollectionViewLayout) {
        super.init(collectionViewLayout: layoutCollection)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.backgroundColor = .navigationBarColor
        style()
        layout()
        tabBarItem = UITabBarItem(title: "Меню", image: UIImage(systemName: "menucard"), tag: 0)
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
        
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 15
            
        }
        collectionView.showsHorizontalScrollIndicator = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as? UICollectionViewCell{
            cell.backgroundColor = .red
            cell.layer.cornerRadius = 5
            cell.clipsToBounds = true
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSizeMake(view.frame.width - 60, view.frame.height * 0.25)
    }
    
}
extension MainScreenViewController{
    
    func style(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func layout(){
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.25),
        
        
        ])
        
    }
    
    
}
