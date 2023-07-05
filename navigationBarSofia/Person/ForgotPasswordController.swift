import UIKit

class ForgotPasswordController: UIViewController, UITextFieldDelegate {
    
    let topView = UIView()
    let backButton = UIButton()
    let emailTextField = UITextField()
    let entryButton = UIButton()
    let blackView = UIView()
    let emailView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        style()
        layout()
        emailTextField.delegate = self
        entryButton.addTarget(self, action: #selector(tappedContinueButton), for: .touchUpInside)
    }

}
extension ForgotPasswordController{
    
    func style(){
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .navigationBarColor
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("Назад", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.addTarget(self, action: #selector(dismissForgetPasswordController), for: .touchUpInside)
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.keyboardType = UIKeyboardType.default
        emailTextField.returnKeyType = .done
        emailTextField.autocapitalizationType = UITextAutocapitalizationType.none
        emailTextField.font = UIFont.systemFont(ofSize: 16)
        emailTextField.borderStyle = UITextField.BorderStyle.roundedRect
        emailTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        emailTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        emailTextField.backgroundColor = .systemGray6
        
        entryButton.translatesAutoresizingMaskIntoConstraints = false
        entryButton.setTitle("Продолжить", for: .normal)
        entryButton.setTitleColor(.white, for: .normal)
        entryButton.backgroundColor = .personColor
        entryButton.titleLabel?.font = UIFont(name: "Inter-Bold", size: 18)
        entryButton.layer.cornerRadius = 18
    }
    
    func layout(){
        let sizeInProp = 0.3
        
        view.addSubview(topView)
        view.addSubview(backButton)
        view.addSubview(emailTextField)
        view.addSubview(entryButton)
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: view.frame.height * sizeInProp),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            emailTextField.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: (view.frame.height - view.frame.height * sizeInProp) * 0.2),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 2*25),
            emailTextField.heightAnchor.constraint(equalToConstant: view.frame.height / 17),
            
            entryButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 40),
            entryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            entryButton.widthAnchor.constraint(equalToConstant: view.frame.width - 2*25),
            entryButton.heightAnchor.constraint(equalToConstant: view.frame.height / 17),
            
            
        ])
    }
    
    @objc func dismissForgetPasswordController(){
        
        dismiss(animated: true)
        
    }
    
    
}
extension ForgotPasswordController{
    
    @objc func tappedContinueButton(){
        
        if let window = UIApplication.shared.delegate?.window?!.windowScene?.keyWindow{
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            emailView.backgroundColor = .red
            
            window.addSubview(blackView)
            
            blackView.addSubview(emailView)
            
            NSLayoutConstraint.activate([
                emailView.widthAnchor.constraint(equalToConstant: blackView.frame.width),
                emailView.bottomAnchor.constraint(equalTo: blackView.bottomAnchor),
                emailView.heightAnchor.constraint(equalToConstant: 300)
            ])
            
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5) {
                self.blackView.alpha = 1
            }
            
            
        }
        
        
    }
    
    
    @objc func handleDismiss(){
        
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
        }
        
        
    }
    
    
}
