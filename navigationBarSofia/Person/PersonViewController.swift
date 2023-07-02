

import UIKit

class PersonViewController: ViewController {
    
    let buttonLogIn = UIButton()
    let buttonSignUp = UIButton()
    let welcomeLabel = UILabel()
    let couponsLabel = UILabel()
    let giftLabel = UILabel()
    let couponsImage = UIImageView()
    let shareImage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .personColor
        style()
        layout()
        print(view.frame.height)
        buttonLogIn.addTarget(self, action: #selector(tappedButtonLogIn), for: .touchUpInside)
                
    }
    
    @objc func tappedButtonLogIn(){
        
        let entryController = EntryViewController()
        let backButton = UIButton()
        backButton.setTitle("Назад", for: .normal)
      backButton.translatesAutoresizingMaskIntoConstraints = false
        entryController.view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: entryController.view.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: entryController.view.leadingAnchor, constant: 15)
        ])
        entryController.modalPresentationStyle = .fullScreen
        navigationController?.navigationBar.isHidden = true
        present(entryController, animated: true)
        backButton.addTarget(self, action: #selector(dismissEntryController), for: .touchUpInside)
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "person.fill", title: "Person")
    }
    
    @objc func dismissEntryController(){
        dismiss(animated: true)
    }

}
extension PersonViewController{
    
    func style(){
        
        buttonLogIn.translatesAutoresizingMaskIntoConstraints = false
        buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        couponsImage.translatesAutoresizingMaskIntoConstraints = false
        giftLabel.translatesAutoresizingMaskIntoConstraints = false
        couponsLabel.translatesAutoresizingMaskIntoConstraints = false
        shareImage.translatesAutoresizingMaskIntoConstraints = false
        buttonSignUp.setTitle("Регистрация", for: .normal)
        buttonLogIn.setTitle("Вход", for: .normal)
        buttonLogIn.backgroundColor = .blue
        buttonSignUp.backgroundColor = .white
        buttonLogIn.layer.cornerRadius = 20
        buttonLogIn.layer.borderWidth = 3
        buttonLogIn.layer.borderColor = UIColor.white.cgColor
        buttonLogIn.clipsToBounds = true
        buttonSignUp.layer.cornerRadius = 20
        buttonSignUp.clipsToBounds = true
        buttonSignUp.setTitleColor(.personColor, for: .normal)
        buttonSignUp.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
        buttonLogIn.backgroundColor = .personColor
        buttonLogIn.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
        welcomeLabel.text = "Добро пожаловать"
        welcomeLabel.font = UIFont(name: "Inter-Medium", size: 23)
        welcomeLabel.textColor = .white
        couponsImage.image = UIImage(named: "Coupon")
        couponsImage.contentMode = .scaleAspectFit
        
        
        couponsLabel.text = "Купоны"
        couponsLabel.font = UIFont(name: "Inter-Medium", size: 23)
        couponsLabel.textColor = .white
        
        shareImage.image = UIImage(named: "Share")
        shareImage.contentMode = .scaleAspectFit
        
        giftLabel.text = "Вознаграждение"
        giftLabel.font = UIFont(name: "Inter-Medium", size: 23)
        giftLabel.textColor = .white
    }
    
    func layout(){
        
        view.addSubview(buttonLogIn)
        view.addSubview(buttonSignUp)
        view.addSubview(welcomeLabel)
        view.addSubview(couponsImage)
        view.addSubview(couponsLabel)
        view.addSubview(shareImage)
        view.addSubview(giftLabel)
        
        NSLayoutConstraint.activate([
            
            buttonSignUp.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            buttonSignUp.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonSignUp.heightAnchor.constraint(equalToConstant: 40),
            buttonSignUp.widthAnchor.constraint(equalToConstant: 150),
            
            buttonLogIn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            buttonLogIn.trailingAnchor.constraint(equalTo: buttonSignUp.leadingAnchor, constant: -20),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 40),
            buttonLogIn.widthAnchor.constraint(equalToConstant: 80),
            
            welcomeLabel.topAnchor.constraint(equalTo: buttonLogIn.bottomAnchor, constant: 40),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            couponsImage.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 25),
            couponsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            couponsImage.heightAnchor.constraint(equalToConstant: 150),
            couponsImage.widthAnchor.constraint(equalToConstant: 150),
            
            couponsLabel.topAnchor.constraint(equalTo: couponsImage.bottomAnchor, constant: 18),
            couponsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            shareImage.topAnchor.constraint(equalTo: couponsLabel.bottomAnchor, constant: 35),
            shareImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shareImage.heightAnchor.constraint(equalToConstant: 150),
            shareImage.widthAnchor.constraint(equalToConstant: 150),
            
            giftLabel.topAnchor.constraint(equalTo: shareImage.bottomAnchor, constant: 18),
            giftLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
            
            
        ])
        
        
    }
}
