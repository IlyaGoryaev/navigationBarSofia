

import UIKit

class CatalogViewControllerKitchens: ViewController{
    
    let headerView = CatalogHeaderView()
    var headerViewTopConstraints: NSLayoutConstraint?
    
    let collectionView = UICollectionView()
    
    
    //let scrollView = UIScrollView()
    //let stackView = UIStackView()
    
    
    
    
    //var tiles = PicturesFromFirebseToTiles.tiles.initTiles(nameFolder: "Kitchens")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setUpScrollView()
        
        
        
        view.backgroundColor = .systemGray5
        title = "Catalog"
        headerView.backgroundColor = .white
        
        headerView.catalogButton2.addTarget(self, action: #selector(onClickCatalogButton2), for: .touchUpInside)
        headerView.catalogButton1.addTarget(self, action: #selector(onClickCatalogButton1), for: .touchUpInside)
        headerView.favButton.addTarget(self, action: #selector(onClickFavButton), for: .touchUpInside)
        
        headerView.catalogButton1.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 20)
    
                
        style()
        layout()
        
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "house.fill", title: "Person")
    }
    
    /*func setUpScrollView(){
        scrollView.delegate = self
        
    }*/
    
    @objc func onClickCatalogButton2(){
        
        self.headerView.viewLineConstraint?.constant = 130
        self.headerView.viewLineConstraintLeading?.constant = 101
        headerView.catalogButton1.titleLabel?.font = UIFont(name: "Avenir", size: 18)
        headerView.catalogButton2.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 20)
        headerView.favButton.titleLabel?.font = UIFont(name: "Avenir", size: 18)
        UIView.animate(withDuration: 0.5) {
            self.headerView.layoutIfNeeded()
        }
        
        
    }
    
    @objc func onClickCatalogButton1(){
        
        self.headerView.viewLineConstraint?.constant = 68
        self.headerView.viewLineConstraintLeading?.constant = 15
        headerView.catalogButton1.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 20)
        headerView.catalogButton2.titleLabel?.font = UIFont(name: "Avenir", size: 18)
        headerView.favButton.titleLabel?.font = UIFont(name: "Avenir", size: 18)
        UIView.animate(withDuration: 0.5) {
            self.headerView.layoutIfNeeded()
        }
        
        
    }
    
    @objc func onClickFavButton(){
        
        self.headerView.viewLineConstraint?.constant = 115
        self.headerView.viewLineConstraintLeading?.constant = 245
        headerView.catalogButton1.titleLabel?.font = UIFont(name: "Avenir", size: 18)
        headerView.catalogButton2.titleLabel?.font = UIFont(name: "Avenir", size: 18)
        headerView.favButton.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 20)
        UIView.animate(withDuration: 0.5) {
            self.headerView.layoutIfNeeded()
        }
        
    }
    
}
    
    
    




extension CatalogViewControllerKitchens{
    
    func style(){
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        //stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        //stackView.axis = .vertical
        
        //stackView.spacing = 8
        
        //stackView.backgroundColor = .systemGray5
        
        //scrollView.backgroundColor = .systemGray5
        
    }
    
    func layout(){
        
        
        view.addSubview(headerView)
        
        //view.addSubview(scrollView)
        
        
        
        //scrollView.addSubview(stackView)
                
        /*for tile in tiles{
            
            addChild(tile)
            stackView.addArrangedSubview(tile.view)
            tile.didMove(toParent: self)
            //!!!!
            
        }*/
        
        
        headerViewTopConstraints = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -60)
        
        NSLayoutConstraint.activate([
            headerViewTopConstraints!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            //scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            //scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            //scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            //scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            //stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            //stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            //stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            //stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            //stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            
            
            
            
           
        ])
        
        
    }
}
//MARK: TableView

extension CatalogViewControllerKitchens: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
     let y = scrollView.contentOffset.y
     
     
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
}
