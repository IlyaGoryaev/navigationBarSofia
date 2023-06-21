import UIKit


class CatalogTileView: UIViewController{
    
    let image = UIImageView()
    
    let label = UILabel()
    
    init(_ text: String, _ image: String){
        super.init(nibName: nil, bundle: nil)
        self.image.image = UIImage(named: image)
        self.image.contentMode = .scaleAspectFit
        self.label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        layout()
    }
    
    
    func layout(){
        image.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(image)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            
            
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            
            image.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            image.heightAnchor.constraint(equalToConstant: 230),
            
            
            view.heightAnchor.constraint(equalToConstant: 300)
            
        
        
        ])
        
        
        
    }
    
    
}
