
import UIKit

class FeedCell: UICollectionViewCell, UIScrollViewDelegate{


    
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    
    var tiles = PicturesFromFirebseToTiles.tiles.initTiles(nameFolder: "Kitchens")
        
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .systemGray5
        
        
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
extension FeedCell{
    
    func style(){
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
                
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
                
        stackView.spacing = 8
                
        stackView.backgroundColor = .systemGray5
                
        scrollView.backgroundColor = .systemGray5
        
        
        
    }
    
    
    
    func layout(){
        
               addSubview(scrollView)
               
               scrollView.addSubview(stackView)
                       
               for tile in tiles{
                   
                   stackView.addArrangedSubview(tile.view)
                   
               }
               
               NSLayoutConstraint.activate([
                   
                   scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 110),
                   scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                   scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
                   scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -100),
                   
                   
                   stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                   stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                   stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                   stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                   
                   stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
                   
                   
                   
                   
                  
               ])
        
    }
    
    
}
/*extension FeedCell{
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
*/
