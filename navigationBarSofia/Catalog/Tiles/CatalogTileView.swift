import UIKit
import Firebase
import QuartzCore
import Shiny

class CatalogTileView: UIViewController{
    
    let detailView = DetailView()
    
    let label = UILabel()
    
    let loadingIndicator = UIActivityIndicatorView()
    
    let loadingViewTextDescription = UIView()
    
    let loadingViewLabel = UIView()
    
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
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        favButton.addTarget(self, action: #selector(onClickFavButton), for: .touchUpInside)
        loadingIndicator.startAnimating()
        imageButton.isHidden = true
        
        layout()
        style()
        
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
                        
            
            /*let indexPath = IndexPath(row: FeedCellFavorites.cellFavorites.nameFavArray.count, section: 0)

            FeedCellFavorites.cellFavorites.nameFavArray.append(label.text!)
            FeedCellFavorites.cellFavorites.count += 1
            
            FeedCellFavorites.cellFavorites.collectionView.insertItems(at: [indexPath])*/
            
            FeedCellFavorites.cellFavorites.nameFavArray.append(label.text!)
            FeedCellFavorites.cellFavorites.count += 1
            
            //FeedCellFavorites.cellFavorites.insert()
            
        }
    }
    
    
    
    
    
    
    
}
extension CatalogTileView{
    
    func style(){
        
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        favButton.translatesAutoresizingMaskIntoConstraints = false
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingViewLabel.translatesAutoresizingMaskIntoConstraints = false
        loadingViewTextDescription.translatesAutoresizingMaskIntoConstraints = false
        imageButton.imageView?.layer.cornerRadius = 20
        imageButton.imageView?.clipsToBounds = true
        
        label.font = UIFont(name: "Inter", size: 18)
        
        labelDescription.font = UIFont(name: "Inter-Light", size: 15)
        loadingViewLabel.backgroundColor = .systemGray4
        loadingViewTextDescription.backgroundColor = .systemGray4
        
        loadingViewLabel.layer.cornerRadius = 7
        loadingViewTextDescription.layer.cornerRadius = 15
        
        label.isHidden = true
        
        labelDescription.isHidden = true
        
        
    }
    
    
    
    func layout(){
                
        view.addSubview(imageButton)
        view.addSubview(label)
        view.addSubview(favButton)
        view.addSubview(labelDescription)
        view.addSubview(loadingIndicator)
        view.addSubview(loadingViewLabel)
        view.addSubview(loadingViewTextDescription)
        
        
        NSLayoutConstraint.activate([
            
            
            imageButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            imageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            imageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            imageButton.heightAnchor.constraint(equalToConstant: 300),
            
            loadingIndicator.centerXAnchor.constraint(equalTo: imageButton.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: imageButton.centerYAnchor),
            
            label.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            loadingViewLabel.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: 8),
            loadingViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            loadingViewLabel.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            loadingViewLabel.bottomAnchor.constraint(equalTo: label.bottomAnchor),
            
            
            favButton.topAnchor.constraint(equalTo: imageButton.topAnchor, constant: 15),
            favButton.trailingAnchor.constraint(equalTo: imageButton.trailingAnchor, constant: -15),
            
            favButton.heightAnchor.constraint(equalToConstant: 30),
            favButton.widthAnchor.constraint(equalToConstant: 30),
            
            labelDescription.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            labelDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            labelDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            labelDescription.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            
            loadingViewTextDescription.topAnchor.constraint(equalTo: labelDescription.topAnchor),
            loadingViewTextDescription.leadingAnchor.constraint(equalTo: labelDescription.leadingAnchor),
            loadingViewTextDescription.trailingAnchor.constraint(equalTo: labelDescription.trailingAnchor),
            loadingViewTextDescription.bottomAnchor.constraint(equalTo: labelDescription.bottomAnchor)

            
            
            
        ])
        
        
        
    }
}
