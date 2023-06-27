

import UIKit

class CatalogViewControllerKitchens: UICollectionViewController, UICollectionViewDelegateFlowLayout{
        
    let headerView = CatalogHeaderView()
    
    let buttonFav = UIButton()
                    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        
        view.backgroundColor = .white
        title = "Catalog"
        headerView.backgroundColor = .systemGray6
        headerView.catalogButton2.addTarget(self, action: #selector(onClickCatalogButton2), for: .touchUpInside)
        headerView.catalogButton1.addTarget(self, action: #selector(onClickCatalogButton1), for: .touchUpInside)
        headerView.catalogButton1.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 18)
        headerView.catalogButton2.titleLabel?.font = UIFont(name: "Inter", size: 18)
        headerView.catalogButton2.setTitleColor(.lightGray, for: .normal)
        buttonFav.addTarget(self, action: #selector(tappedFavButton), for: .touchUpInside)
        collectionView.register(FeedCellCollectionViewKitchens.self, forCellWithReuseIdentifier: "cellId")
        collectionView.register(FeedCellWardrobes.self, forCellWithReuseIdentifier: "cellIdWardrobes")
        collectionView.showsHorizontalScrollIndicator = false
        
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
        
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
            
        }
        
        collectionView.isPagingEnabled = true
                
        style()
        
        self.layout()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    
    
    @objc func onClickCatalogButton2(){
        
        collectionView.isPagingEnabled = false
        scrollToMenuIndex(menuIndex: 1)
        collectionView.isPagingEnabled = true
        UIView.animate(withDuration: 0.3) {
            self.headerView.layoutIfNeeded()
        }
        
        
        
        
        
        
    }
    
    @objc func onClickCatalogButton1(){
        
        
        collectionView.isPagingEnabled = false
        scrollToMenuIndex(menuIndex: 0)
        collectionView.isPagingEnabled = true
        
        UIView.animate(withDuration: 0.3) {
            self.headerView.layoutIfNeeded()
        }
        
        
        
        
    }
    
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)

        if scrollView.contentOffset.x > 280{
            headerView.viewLineConstraint?.constant = 120
            self.headerView.viewLineConstraintLeading?.constant = 101
            headerView.catalogButton2.setTitleColor(.black, for: .normal)
            headerView.catalogButton1.setTitleColor(.lightGray, for: .normal)
            
        }
        
        if scrollView.contentOffset.x < 280{
            headerView.viewLineConstraint?.constant = 55
            self.headerView.viewLineConstraintLeading?.constant = 15
            headerView.catalogButton2.setTitleColor(.lightGray, for: .normal)
            headerView.catalogButton1.setTitleColor(.black, for: .normal)
        }
        UIView.animate(withDuration: 0.4) {
            self.headerView.layoutIfNeeded()
        }
        
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
            return cell
        }
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdWardrobes", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSizeMake(view.frame.width, view.frame.height - headerView.frame.height - tabBarController!.tabBar.frame.height)
    }
    
    func scrollToMenuIndex(menuIndex: Int){
        
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
        
    }
    
    
}
    
    
    




extension CatalogViewControllerKitchens{
    
    func style(){
        headerView.translatesAutoresizingMaskIntoConstraints = false
                
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonFav.translatesAutoresizingMaskIntoConstraints = false
        
        buttonFav.backgroundColor = UIColor(red: 254.0 / 255.0, green: 116.0 / 255.0, blue: 96.0 / 255.0, alpha: 1.0)
        
        buttonFav.layer.cornerRadius =  30
        
        buttonFav.setImage(UIImage(named: "HeartWhite3"), for: .normal)
        
        buttonFav.imageView?.contentMode = .scaleAspectFit
        
                                
    }
    
    func layout(){
        
        
        view.addSubview(headerView)
        view.addSubview(buttonFav)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            buttonFav.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            buttonFav.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonFav.heightAnchor.constraint(equalToConstant: 60),
            buttonFav.widthAnchor.constraint(equalToConstant: 60),
        
            
           
        ])
        
        
    }
}
extension CatalogViewControllerKitchens{
    
    @objc func tappedFavButton(){
        
        let viewController = FeedFavorites()
        viewController.view.backgroundColor = .systemGray6
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
    
}
