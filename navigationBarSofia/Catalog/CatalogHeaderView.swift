

import UIKit


class CatalogHeaderView: UIView{
    
    let catalogLabel = UILabel()
    
    let catalogButton1 = UIButton()
    
    let favButton = UIButton()
    
    let catalogButton2 = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension CatalogHeaderView{
    
    func style(){
        
        catalogLabel.translatesAutoresizingMaskIntoConstraints = false
        catalogLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        catalogLabel.text = "Каталог"
        catalogLabel.numberOfLines = 0
        catalogLabel.lineBreakMode = .byWordWrapping
        
        catalogButton1.translatesAutoresizingMaskIntoConstraints = false
        catalogButton1.setTitleColor(.label, for: .normal)
        catalogButton1.setTitle("Кухни", for: .normal)
        
        favButton.translatesAutoresizingMaskIntoConstraints = false
        favButton.setTitleColor(.label, for: .normal)
        favButton.setTitle("Избранное", for: .normal)
        
        catalogButton2.translatesAutoresizingMaskIntoConstraints = false
        catalogButton2.setTitleColor(.label, for: .normal)
        catalogButton2.setTitle("Шкафы-купе", for: .normal)
        
        
        
        
    }
    
    
    func layout(){
        addSubview(catalogLabel)
        addSubview(catalogButton1)
        addSubview(favButton)
        addSubview(catalogButton2)
        
        NSLayoutConstraint.activate([
            catalogLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            catalogLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: catalogLabel.trailingAnchor, multiplier: 1),
            
            catalogButton1.topAnchor.constraint(equalToSystemSpacingBelow: catalogLabel.bottomAnchor, multiplier: 2),
            catalogButton1.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: catalogButton1.bottomAnchor, multiplier: 1),
            
            catalogButton2.topAnchor.constraint(equalToSystemSpacingBelow: catalogLabel.bottomAnchor, multiplier: 2),
            catalogButton2.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: CGFloat(catalogButton1.titleLabel!.text!.count + 8)),
            bottomAnchor.constraint(equalToSystemSpacingBelow: catalogButton2.bottomAnchor, multiplier: 1),
            
            favButton.topAnchor.constraint(equalToSystemSpacingBelow: catalogLabel.bottomAnchor, multiplier: 2),
            favButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: CGFloat(catalogButton1.titleLabel!.text!.count) + CGFloat(catalogButton2.titleLabel!.text!.count) + 16),
            bottomAnchor.constraint(equalToSystemSpacingBelow: favButton.bottomAnchor, multiplier: 1)
        
        ])
        
        
    }
}
