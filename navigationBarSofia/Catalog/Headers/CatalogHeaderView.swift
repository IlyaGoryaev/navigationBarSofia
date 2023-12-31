

import UIKit


class CatalogHeaderView: UIView{
    
    let catalogLabel = UILabel()
    
    let catalogButton1 = UIButton()
        
    let viewLine = UIView()
            
    let catalogButton2 = UIButton()
    
    var viewLineConstraint: NSLayoutConstraint?
    
    var viewLineConstraintLeading: NSLayoutConstraint?
    
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
        
        /*catalogLabel.translatesAutoresizingMaskIntoConstraints = false
        catalogLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        catalogLabel.text = "Каталог"
        catalogLabel.font = UIFont(name: "Inter-Bold", size: 22)
        catalogLabel.numberOfLines = 0
        catalogLabel.lineBreakMode = .byWordWrapping*/
        
        catalogButton1.translatesAutoresizingMaskIntoConstraints = false
        catalogButton1.setTitleColor(.white, for: .normal)
        catalogButton1.setTitle("Кухни", for: .normal)
        catalogButton1.titleLabel?.font = UIFont(name: "Inter", size: 10)
        
        catalogButton2.translatesAutoresizingMaskIntoConstraints = false
        catalogButton2.setTitleColor(.white, for: .normal)
        catalogButton2.setTitle("Шкафы-купе", for: .normal)
        
        viewLine.translatesAutoresizingMaskIntoConstraints = false
        viewLine.backgroundColor = .personColor
        
    
    }
    
    func layout(){
        addSubview(catalogButton1)
        addSubview(catalogButton2)
        addSubview(viewLine)
        
        viewLineConstraint = viewLine.widthAnchor.constraint(equalToConstant: 55)
        viewLineConstraintLeading = viewLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
        NSLayoutConstraint.activate([
            
            catalogButton1.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            catalogButton1.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: catalogButton1.bottomAnchor, multiplier: 1),
            
            catalogButton2.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            catalogButton2.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: CGFloat(catalogButton1.titleLabel!.text!.count + 8)),
            bottomAnchor.constraint(equalToSystemSpacingBelow: catalogButton2.bottomAnchor, multiplier: 1),

            viewLine.bottomAnchor.constraint(equalTo: bottomAnchor),
            viewLineConstraintLeading!,
            viewLine.heightAnchor.constraint(equalToConstant: 2),
            viewLineConstraint!,
            
        
        ])
        
        
    }
}
