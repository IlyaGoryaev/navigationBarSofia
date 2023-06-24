import UIKit

class DetailView: UIView{
    
    let scrollView = UIScrollView()
    
    let lable = UILabel()
    
    let blackView = BlackView()
    
    let buttonCall = UIButton()
        
    let buttonBack = UIButton()
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        buttonCall.addTarget(self, action: #selector(pressedButtonCall), for: .touchUpInside)
        
        style()
        layout()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeRight.direction = .right

        addGestureRecognizer(swipeRight)
        
        
        
    }
    
    @objc func swipe(){
        UIView.animate(withDuration: 0.2) {
            self.alpha = 0
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension DetailView{
    
    private func style(){
        
        lable.translatesAutoresizingMaskIntoConstraints = false
        buttonBack.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        buttonCall.translatesAutoresizingMaskIntoConstraints = false
        
        buttonBack.setTitle("Назад", for: .normal)
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        buttonCall.setTitle("Заказать звонок", for: .normal)
        
        
    }
    
    private func layout(){
        
        
        //addSubview(lable)
        //addSubview(imageView)
        //addSubview(buttonBack)
        addSubview(scrollView)
        scrollView.addSubview(lable)
        scrollView.addSubview(imageView)
        scrollView.addSubview(buttonBack)
        scrollView.addSubview(buttonCall)
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            lable.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            lable.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            
            buttonBack.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            buttonBack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
            
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: -20),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: topAnchor, constant: 400),
            
            buttonCall.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            buttonCall.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: 20),
            
    
        ])
        
        
        
    }
    
    
}
extension DetailView{
    func scrollViewDidScroll(){
        
        print(scrollView.contentOffset.y)
        
        
        
    }
    
    
    
}
extension DetailView{
    
    @objc func pressedButtonCall(){
        
        if let window = UIApplication.shared.delegate?.window?!.windowScene!.keyWindow {
            
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            addSubview(blackView)
            blackView.frame = window.frame
            blackView.alpha = 0
            UIView.animate(withDuration: 0.5) {
                self.blackView.alpha = 1
            }
            
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDissmis)))
            
            
        }
        
        
        
    }
    
    @objc func handleDissmis(){
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
        }
        
        
    }
}
