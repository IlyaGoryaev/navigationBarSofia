import UIKit

class KitchensCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    let downloadView = UIImageView()
    
    let downloadingController = UIActivityIndicatorView()
    
    var representedId: String = ""
    
    let favButton = makeFuvButton(text: "Избранное")
    
    let label = UILabel()
    
    let subView = UIImageView()
    
    let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        downloadingController.startAnimating()

        style()
        
        layout()
        
        favButton.addTarget(self, action: #selector(onClickFavButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onClickFavButton(){
        if self.favButton.image(for: .normal) == UIImage(named: "HeartRed3"){
            
            self.favButton.setImage(UIImage(named: "HeartW"), for: .normal)
            FavoritesToFirebase.FavoritesSave.deleteFromFirebase(name: label.text!)
            AppDelegate.defaults.removeObject(forKey: label.text!)
            
            
            
            
            
            
        } else {
            self.favButton.setImage(UIImage(named: "HeartRed3"), for: .normal)
            FavoritesToFirebase.FavoritesSave.saveToFirebase(name: label.text!)
            AppDelegate.defaults.set(1, forKey: label.text!)
                    
            FeedFavorites.cellFavorites.nameFavArray.append(label.text!)
            FeedFavorites.cellFavorites.count += 1
            
        }
    }
    
    
}
extension KitchensCell{
    
    func style(){
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Лайм")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        favButton.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        subView.translatesAutoresizingMaskIntoConstraints = false
        subView.layer.cornerRadius = 20
        subView.clipsToBounds = true
        subView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        subView.backgroundColor = UIColor(white: 0, alpha: 0.7)
        label.textColor = .white
        
        downloadView.translatesAutoresizingMaskIntoConstraints = false
        downloadView.backgroundColor = .systemGray5
        downloadView.layer.cornerRadius = 20
        downloadView.clipsToBounds = true
        
        downloadingController.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func layout(){
        addSubview(downloadView)
        downloadView.addSubview(downloadingController)
        addSubview(imageView)
        addSubview(favButton)
        addSubview(subView)
        subView.addSubview(label)
        
        NSLayoutConstraint.activate([
        
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            downloadView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            downloadView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            downloadView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            downloadView.heightAnchor.constraint(equalToConstant: 300),
            
            downloadingController.centerXAnchor.constraint(equalTo: downloadView.centerXAnchor),
            downloadingController.centerYAnchor.constraint(equalTo: downloadView.centerYAnchor),
            
            subView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            subView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            subView.heightAnchor.constraint(equalToConstant: 40),
            
            favButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 15),
            favButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -15),
            
            favButton.heightAnchor.constraint(equalToConstant: 30),
            favButton.widthAnchor.constraint(equalToConstant: 30),
            
            label.centerYAnchor.constraint(equalTo: subView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 15),
            
            
            
            
        ])
        
        
        
        
    }
    
    
    
    
}
