//
//  CatalogViewController.swift
//  navigationBarSofia
//
//  Created by Илья Горяев on 19.06.2023.
//

import UIKit

class CatalogViewController: ViewController{
    
    let headerView = CatalogHeaderView()
    
    var headerViewTopConstraints: NSLayoutConstraint?
    
    let scrollView = UIScrollView()
    
    let stackView = UIStackView()
    
    var tiles = PicturesFromFirebseToTiles.tiles.initTiles()
    
    let cellID = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpScrollView()
        
        
        
        view.backgroundColor = .systemGray6
        title = "Catalog"
        headerView.backgroundColor = .white
        
        
        
        style()
        layout()
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "house.fill", title: "Person")
    }
    
    func setUpScrollView(){
        scrollView.delegate = self
    }
    
    
}


extension CatalogViewController{
    
    func style(){
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        stackView.axis = .vertical
        
        stackView.spacing = 8
        
        stackView.backgroundColor = .systemGray6
        
        scrollView.backgroundColor = .systemGray6
        
    }
    
    func layout(){
        
        
        view.addSubview(headerView)
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(stackView)
                
        //tiles.append(CatalogTileView("Renjren", "Джаз.jpg"))
                
        for tile in tiles{
            
            addChild(tile)
            stackView.addArrangedSubview(tile.view)
            tile.didMove(toParent: self)
            //!!!!
            
        }
        
        
        headerViewTopConstraints = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        NSLayoutConstraint.activate([
            headerViewTopConstraints!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            
            
            
            
           
        ])
        
        
    }
}
//MARK: TableView

extension CatalogViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
     let y = scrollView.contentOffset.y
     
     
     let swipingDown = y <= 0
     let shouldSnap = y > 30
     let labelHeight = headerView.catalogLabel.frame.height + 20
     
     UIView.animate(withDuration: 0.3){
     
     
     
     self.headerView.catalogLabel.alpha = swipingDown ? 1.0 : 0.0
     
     }
     
     UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: [], animations: {
     self.headerViewTopConstraints?.constant = shouldSnap ? -labelHeight : 0
     self.view.layoutIfNeeded()
     
     })
    }
}
