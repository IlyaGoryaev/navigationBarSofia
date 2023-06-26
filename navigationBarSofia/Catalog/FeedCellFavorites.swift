
import UIKit

class FeedCellFavorites: UICollectionViewCell, UIScrollViewDelegate{


    
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    
    var tiles: [CatalogTileView] = []
        
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        TilesNames.tilesNames.append("1")
        
        TilesNames.tilesNames.append("2")
        
        TilesNames.tilesNames.append("3")
        
        backgroundColor = .systemGray6
        
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpScrollView(){
            scrollView.delegate = self
        }
    
}
extension FeedCellFavorites{
    
    func style(){
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
                
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
                
        stackView.spacing = 8
                
        stackView.backgroundColor = .white
                
        scrollView.backgroundColor = .white
        
        
        
    }
    
    
    
    func layout(){
        
               addSubview(scrollView)
               
               scrollView.addSubview(stackView)
                       
               for tile in tiles{
                   
                   stackView.addArrangedSubview(tile.view)
    
               }
               
               NSLayoutConstraint.activate([
                   
                   scrollView.topAnchor.constraint(equalTo: topAnchor),
                   scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
                   scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
                   scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
                   
                   
                   stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                   stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                   stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                   stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                   
                   stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
                   
                   
                   
                   
                  
               ])
        
    }
    
    
}
extension FeedCellFavorites{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
     let y = scrollView.contentOffset.y
     /*
     
     let swipingDown = y <= 0
     let shouldSnap = y > 30
     //let labelHeight = headerView.catalogLabel.frame.height + 20
     
     UIView.animate(withDuration: 0.3){
     
     
     
     self.headerView.catalogLabel.alpha = swipingDown ? 1.0 : 0.0
     
     }
     
     UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: [], animations: {
     self.headerViewTopConstraints?.constant = shouldSnap ? -labelHeight : 0
     self.view.layoutIfNeeded()
     
     })*/
    }
}

