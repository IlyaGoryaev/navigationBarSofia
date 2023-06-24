import UIKit
import Firebase
import QuartzCore

class CatalogTileView: UIViewController{
    
    let detailView = DetailView()
    
    let label = UILabel()
    
    let imageButton = UIButton()
    
    let labelDescription = UILabel()
    
    let favButton = makeFuvButton(text: "Избранное")
    
    init(_ text: String, _ textDescription: String, _ image: String){
        super.init(nibName: nil, bundle: nil)
        self.imageButton.setImage(UIImage(named: image), for: .normal)
        self.imageButton.imageView?.contentMode = .scaleToFill
        self.label.text = text
        
        imageButton.addTarget(self, action: #selector(pushToDetailController), for: .touchUpInside)
        
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
        view.backgroundColor = .systemGray6
        
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
        
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        favButton.translatesAutoresizingMaskIntoConstraints = false
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        imageButton.imageView?.layer.cornerRadius = 20
        imageButton.imageView?.clipsToBounds = true
        
        label.font = UIFont(name: "Avenir Heavy", size: 18)
        
        labelDescription.font = UIFont(name: "Avenir", size: 16)
        
        
    }
    
    
    
    func layout(){
                
        view.addSubview(imageButton)
        view.addSubview(label)
        view.addSubview(favButton)
        view.addSubview(labelDescription)
        
        
        NSLayoutConstraint.activate([
            
            
            imageButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            imageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            imageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            imageButton.heightAnchor.constraint(equalToConstant: 300),
            
            label.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: 8),
            
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
        
            
            favButton.topAnchor.constraint(equalTo: imageButton.topAnchor, constant: 15),
            favButton.trailingAnchor.constraint(equalTo: imageButton.trailingAnchor, constant: -15),
            
            favButton.heightAnchor.constraint(equalToConstant: 30),
            favButton.widthAnchor.constraint(equalToConstant: 30),
            
            labelDescription.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            labelDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            labelDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            labelDescription.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)

            
            
            
        ])
        
        
        
    }
}
