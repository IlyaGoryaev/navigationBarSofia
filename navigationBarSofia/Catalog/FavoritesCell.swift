import UIKit

protocol FavoritesCellDelegate: AnyObject{
    
    func delete(cell: FavoritesCell)
    
    func insert()
    
}




class FavoritesCell: UICollectionViewCell {
    
    
    let imageView = UIImageView()
    
    weak var delegate: FavoritesCellDelegate?
    
    let favButton = makeFuvButton(text: "Избранное")
    
    let label = UILabel()
    
    let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        
        layout()
        
        favButton.addTarget(self, action: #selector(deleteItem), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func deleteItem(){
        
        delegate?.delete(cell: self)
        print(self.label.text!)
        AppDelegate.defaults.removeObject(forKey: self.label.text!)
        FavoritesToFirebase.FavoritesSave.deleteFromFirebase(name: self.label.text!)
        
    }
    
}
extension FavoritesCell{
    
    func style(){
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Лайм")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        favButton.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        favButton.setImage(UIImage(named: "HeartRed3"), for: .normal)
        descriptionLabel.text = "Кухня с фасадами из пластика. Одним из самых популярных материалов для изготовления кухонных фасадов считается пластик. Благодаря эффектному внешнему виду, богатой палитре цветов и фактуры фасады из пластикасоздают оригинальные комбинации."
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: "Inter-Light", size: 15)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
    }
    
    func layout(){
        
        addSubview(imageView)
        addSubview(favButton)
        addSubview(label)
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
        
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            favButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 15),
            favButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -15),
            
            favButton.heightAnchor.constraint(equalToConstant: 30),
            favButton.widthAnchor.constraint(equalToConstant: 30),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 8),
            descriptionLabel.topAnchor.constraint(equalTo:label.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            
            
            
            
        ])
        
        
        
        
    }
    
    
    
    
}
