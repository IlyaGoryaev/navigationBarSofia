

import UIKit

class FeedCellWardrobes: UICollectionViewCell, UIScrollViewDelegate{


    
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    
    var tiles: [CatalogTileView] = []
        
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .systemGray6
        
        for i in 0...2{
            
            tiles.append(CatalogTileView("\(i+1)", "ewsfwefwe", "\(i+1)"))
            
        }
        
        
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
extension FeedCellWardrobes{
    
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
