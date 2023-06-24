

import UIKit

class CatalogViewControllerKitchens: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let headerView = CatalogHeaderView()
    var headerViewTopConstraints: NSLayoutConstraint?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        view.backgroundColor = .systemGray6
        
        title = "Catalog"
        headerView.backgroundColor = .white
        
        headerView.catalogButton2.addTarget(self, action: #selector(onClickCatalogButton2), for: .touchUpInside)
        
        headerView.catalogButton1.addTarget(self, action: #selector(onClickCatalogButton1), for: .touchUpInside)
        
        headerView.favButton.addTarget(self, action: #selector(onClickFavButton), for: .touchUpInside)
        
        headerView.catalogButton1.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 20)
        
                        
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: "cellId")
                
        collectionView.showsHorizontalScrollIndicator = false
        
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
        
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
            
        }
        
        collectionView.isPagingEnabled = true
                
        style()
        layout()
        
        
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
    
    @objc func onClickFavButton(){
        
        collectionView.isPagingEnabled = false
        scrollToMenuIndex(menuIndex: 2)
        collectionView.isPagingEnabled = true
        
        UIView.animate(withDuration: 0.3) {
            self.headerView.layoutIfNeeded()
        }
    }
    
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)

        if scrollView.contentOffset.x > 280{
            headerView.viewLineConstraint?.constant = 130
            self.headerView.viewLineConstraintLeading?.constant = 101
            headerView.catalogButton1.titleLabel?.font = UIFont(name: "Avenir", size: 18)
            headerView.catalogButton2.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 20)
            headerView.favButton.titleLabel?.font = UIFont(name: "Avenir", size: 18)
            
        }
        
        if scrollView.contentOffset.x < 280{
            headerView.viewLineConstraint?.constant = 64
            self.headerView.viewLineConstraintLeading?.constant = 15
            headerView.catalogButton1.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 20)
            headerView.catalogButton2.titleLabel?.font = UIFont(name: "Avenir", size: 18)
            headerView.favButton.titleLabel?.font = UIFont(name: "Avenir", size: 18)
        }
        if scrollView.contentOffset.x > 680{
            headerView.viewLineConstraint?.constant = 112
            headerView.viewLineConstraintLeading?.constant = 245
            headerView.catalogButton1.titleLabel?.font = UIFont(name: "Avenir", size: 18)
            headerView.catalogButton2.titleLabel?.font = UIFont(name: "Avenir", size: 18)
            headerView.favButton.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 20)
        }
        UIView.animate(withDuration: 0.3) {
            self.headerView.layoutIfNeeded()
        }
        
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
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
        
    }
    
    func layout(){
        
        
        view.addSubview(headerView)
        
        
        headerViewTopConstraints = headerView.topAnchor.constraint(equalTo: view.topAnchor)
        
        NSLayoutConstraint.activate([
            headerViewTopConstraints!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            
           
        ])
        
        
    }
}
/*extension FeedCell{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
     let y = scrollView.contentOffset.y
     
     
     let swipingDown = y <= 0
     let shouldSnap = y > 30
        let labelHeight = CatalogViewControllerKitchens.headerView.catalogLabel.frame.height + 20
     
     UIView.animate(withDuration: 0.3){
     
     
     
     self.headerView.catalogLabel.alpha = swipingDown ? 1.0 : 0.0
     
     }
     
     UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: [], animations: {
     self.headerViewTopConstraints?.constant = shouldSnap ? -labelHeight : 0
     self.view.layoutIfNeeded()
     
     })
    }
}
//MARK: TableView
*/
/*extension CatalogViewControllerKitchens{
    func scrollViewDidScroll() {
     let y = collscrollView.contentOffset.y
     
     
     let swipingDown = y <= 0
     let shouldSnap = y > 30
     let labelHeight = headerView.catalogLabel.frame.height + 80
     
     UIView.animate(withDuration: 0.3){
     
     
     
     self.headerView.catalogLabel.alpha = swipingDown ? 1.0 : 0.0
     
     }
     
     UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: [], animations: {
     self.headerViewTopConstraints?.constant = shouldSnap ? -labelHeight : -60
     self.view.layoutIfNeeded()
     
     })
    }
}*/
