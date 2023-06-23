import UIKit
import Firebase

class CatalogTileView: UIViewController{
    
    let image = UIImageView()
    
    let label = UILabel()
    
    let labelDescription = UILabel()
    
    let favButton = makeFuvButton(text: "Избранное")
    
    init(_ text: String, _ textDescription: String, _ image: String){
        super.init(nibName: nil, bundle: nil)
        self.image.image = UIImage(named: image)
        self.image.contentMode = .scaleToFill
        self.label.text = text
        self.labelDescription.text = textDescription
        self.labelDescription.numberOfLines = 0
        downloadFromFirebase { array in
            for name in array{
                
                if self.label.text! == name{
                    
                    self.favButton.setImage(UIImage(named: "HeartRed3"), for: .normal)
                    
                }
                
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        favButton.addTarget(self, action: #selector(onClickFavButton), for: .touchUpInside)
        
        layout()
        style()
        
    }
    
    
    @objc func onClickFavButton(){
        if self.favButton.image(for: .normal) == UIImage(named: "HeartRed3"){
            
            self.favButton.setImage(UIImage(named: "HeartW"), for: .normal)
            FavoritesToFirebase.FavoritesSave.deleteFromFirebase(name: label.text!)
            
            
            
            
            
        } else {
            self.favButton.setImage(UIImage(named: "HeartRed3"), for: .normal)
            FavoritesToFirebase.FavoritesSave.saveToFirebase(name: label.text!)
        }
    }
    
    
    
    
    
    
    
}
extension CatalogTileView{
    
    func style(){
        
        image.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        favButton.translatesAutoresizingMaskIntoConstraints = false
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        
        
        
    }
    
    
    
    func layout(){
                
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(favButton)
        view.addSubview(labelDescription)
        
        
        NSLayoutConstraint.activate([
            
            
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            
            image.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            image.heightAnchor.constraint(equalToConstant: 240),
            
            favButton.topAnchor.constraint(equalTo: image.topAnchor, constant: 8),
            favButton.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -8),
            
            favButton.heightAnchor.constraint(equalToConstant: 40),
            favButton.widthAnchor.constraint(equalToConstant: 40),
            
            labelDescription.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8),
            labelDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            
            
            view.heightAnchor.constraint(equalToConstant: 350)
            
            
            
        ])
        
        
        
    }
}
