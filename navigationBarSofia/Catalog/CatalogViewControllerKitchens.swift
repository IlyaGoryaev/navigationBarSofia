

import UIKit

class CatalogViewControllerKitchens: UICollectionViewController, UICollectionViewDelegateFlowLayout{
        
    let headerView = CatalogHeaderView()
    
    var headerViewTopConstraints: NSLayoutConstraint?
    
    static let kitchens = CatalogViewControllerKitchens(collectionViewLayout: UICollectionViewLayout())
    
    let buttonFav = UIButton()
                    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        
        AppDelegate.defaults.set(0, forKey: "isScrollCatalogController")
        tabBarItem = UITabBarItem(title: "Каталог", image: UIImage(systemName: "book"), tag: 0)
        view.backgroundColor = .navigationBarColor
        title = "Каталог"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.red]
        headerView.backgroundColor = .navigationBarColor
        headerView.catalogButton2.addTarget(self, action: #selector(onClickCatalogButton2), for: .touchUpInside)
        headerView.catalogButton1.addTarget(self, action: #selector(onClickCatalogButton1), for: .touchUpInside)
        headerView.catalogButton1.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 18)
        headerView.catalogButton2.titleLabel?.font = UIFont(name: "Inter", size: 18)
        headerView.catalogButton2.setTitleColor(.lightGray, for: .normal)
        buttonFav.addTarget(self, action: #selector(tappedFavButton), for: .touchUpInside)
        collectionView.register(FeedCellCollectionViewKitchens.self, forCellWithReuseIdentifier: "cellId")
        //collectionView.register(FeedCellWardrobes.self, forCellWithReuseIdentifier: "cellIdWardrobes")
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
        if (scrollView.contentOffset.x > 1){
            AppDelegate.defaults.set(1, forKey: "isScrollCatalogController")
        }

        if scrollView.contentOffset.x > 280{
            headerView.viewLineConstraint?.constant = 120
            self.headerView.viewLineConstraintLeading?.constant = 101
            headerView.catalogButton2.setTitleColor(.white, for: .normal)
            headerView.catalogButton1.setTitleColor(.lightGray, for: .normal)
            headerView.catalogButton2.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 18)
            headerView.catalogButton1.titleLabel?.font = UIFont(name: "Inter", size: 18)
        }
        
        if scrollView.contentOffset.x < 280{
            headerView.viewLineConstraint?.constant = 55
            self.headerView.viewLineConstraintLeading?.constant = 15
            headerView.catalogButton2.setTitleColor(.lightGray, for: .normal)
            headerView.catalogButton1.setTitleColor(.white, for: .normal)
            
            headerView.catalogButton1.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 18)
            headerView.catalogButton2.titleLabel?.font = UIFont(name: "Inter", size: 18)
        }
        if AppDelegate.defaults.value(forKey: "isScrollCatalogController") as! Int == 1 {
            UIView.animate(withDuration: 0.4) {
                self.headerView.layoutIfNeeded()
            }
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
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSizeMake(view.frame.width, view.frame.height - headerView.frame.height - tabBarController!.tabBar.frame.height - (navigationController?.navigationBar.frame.height)! - 45)
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
        
        buttonFav.backgroundColor = .personColor
        
        buttonFav.layer.cornerRadius =  30
        
        buttonFav.setImage(UIImage(named: "HeartWhite"), for: .normal)
        
        buttonFav.imageEdgeInsets = UIEdgeInsets(top: 17, left: 10, bottom: 17, right: 10)
        
        buttonFav.imageView?.contentMode = .scaleAspectFit
        
                                
    }
    
    func layout(){
        
        
        view.addSubview(headerView)
        view.addSubview(buttonFav)
        
        headerViewTopConstraints = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        NSLayoutConstraint.activate([
            headerViewTopConstraints!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 46),
            
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
        viewController.headerView.backButton.setImage(UIImage(named: "BackButton"), for: .normal)
        present(viewController, animated: true)
    }
    
    
}
