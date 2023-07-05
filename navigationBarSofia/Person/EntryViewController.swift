
import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    let topView = UIView()
    let emailField = UITextField()
    let entryButton = UIButton()
    let forgetPasswordButton = UIButton()
    let passwordField = UITextField()
    let entryWithLable = UILabel()
    let googleButton = UIButton()
    let facebookButton = UIButton()
    let leftLine = UIView()
    let rightLine = UIView()
    let noAccountLabel = UILabel()
    let regButton = UIButton()
    let label2 = UILabel()
    let label1 = UILabel()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        style()
        layout()
        
        //regButton.addTarget(self, action: #selector(openRegController), for: .touchUpInside)
        forgetPasswordButton.addTarget(self, action: #selector(tappedForgetPasswordButton), for: .touchUpInside)
        emailField.delegate = self
        passwordField.delegate = self
        setUpTextField(emailField, "Почта")
        setUpTextField(passwordField, "Пароль")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    @objc func openRegController(){
        dismiss(animated: true)
        let regController = RegistrationViewController()
        regController.modalPresentationStyle = .fullScreen
        present(regController, animated: true)
        
    }

}
extension EntryViewController{
    
    func style(){
        
        setUpStyleTopView()
        setUpStyleEmailField()
        setUpStyleEntryButton()
        setUpStyleForgetPasswordButton()
        setUpStylePasswordField()
        setUpStyleEntryWithLable()
        setUpStyleGoogleButton()
        setUpFacebookButton()
        setUpStyleLeftLine()
        setUpStyleRightLine()
        setUpStyleRegButton()
        setUpStyleLabel2()
        setUpStyleLabel1()
        setUpStyleNoAccountLabel()
        
    }
    
    func layout(){
        
        let sizeInProp = 0.3
        
        view.addSubview(topView)
        view.addSubview(emailField)
        view.addSubview(entryButton)
        view.addSubview(forgetPasswordButton)
        view.addSubview(passwordField)
        view.addSubview(entryWithLable)
        view.addSubview(googleButton)
        view.addSubview(facebookButton)
        view.addSubview(leftLine)
        view.addSubview(rightLine)
        view.addSubview(noAccountLabel)
        view.addSubview(regButton)
        view.addSubview(label2)
        view.addSubview(label1)
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: view.frame.height * sizeInProp),
            
            emailField.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: (view.frame.height - view.frame.height * sizeInProp) * 0.2),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.widthAnchor.constraint(equalToConstant: view.frame.width - 2*25),
            emailField.heightAnchor.constraint(equalToConstant: view.frame.height / 17),
            
            forgetPasswordButton.bottomAnchor.constraint(equalTo: emailField.bottomAnchor, constant: (view.frame.height - view.frame.height * sizeInProp) * 0.23),
            forgetPasswordButton.trailingAnchor.constraint(equalTo: emailField.trailingAnchor, constant: -5),
            passwordField.bottomAnchor.constraint(equalTo: forgetPasswordButton.topAnchor, constant: -5),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.widthAnchor.constraint(equalToConstant: view.frame.width - 2*25),
            passwordField.heightAnchor.constraint(equalToConstant: view.frame.height / 17),
            
            entryWithLable.bottomAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: (view.frame.height - view.frame.height * sizeInProp) * 0.27),
            entryWithLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            entryButton.bottomAnchor.constraint(equalTo: entryWithLable.topAnchor, constant: -25),
            entryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            entryButton.widthAnchor.constraint(equalToConstant: view.frame.width - 2*25),
            entryButton.heightAnchor.constraint(equalToConstant: view.frame.height / 17),
            
            googleButton.topAnchor.constraint(equalTo: entryWithLable.bottomAnchor, constant: view.frame.height / 30),
            googleButton.heightAnchor.constraint(equalToConstant: view.frame.height / 17),
            googleButton.widthAnchor.constraint(equalToConstant: (view.frame.width - 2*25) / 2 - 10),
            googleButton.leadingAnchor.constraint(equalTo: entryButton.leadingAnchor),
            
            facebookButton.topAnchor.constraint(equalTo: entryWithLable.bottomAnchor, constant: view.frame.height / 30),
            facebookButton.heightAnchor.constraint(equalToConstant: view.frame.height / 17),
            facebookButton.widthAnchor.constraint(equalToConstant: (view.frame.width - 2*25) / 2 - 10),
            facebookButton.trailingAnchor.constraint(equalTo: entryButton.trailingAnchor),
            
            leftLine.topAnchor.constraint(equalTo: entryWithLable.centerYAnchor),
            leftLine.leadingAnchor.constraint(equalTo: entryButton.leadingAnchor),
            leftLine.heightAnchor.constraint(equalToConstant: 2),
            leftLine.trailingAnchor.constraint(equalTo: entryWithLable.leadingAnchor, constant: -5),
            
            rightLine.topAnchor.constraint(equalTo: entryWithLable.centerYAnchor),
            rightLine.trailingAnchor.constraint(equalTo: entryButton.trailingAnchor),
            rightLine.heightAnchor.constraint(equalToConstant: 2),
            rightLine.leadingAnchor.constraint(equalTo: entryWithLable.trailingAnchor, constant: 5),
            
            noAccountLabel.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 25),
            noAccountLabel.trailingAnchor.constraint(equalTo: googleButton.trailingAnchor),
            
            regButton.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            regButton.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 19),
            
            label2.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -20),
            label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            label1.bottomAnchor.constraint(equalTo: label2.topAnchor, constant: -20),
            label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        
        ])
    }
}
extension EntryViewController{
    
    @objc func tappedForgetPasswordButton(){
        
        let controller = ForgotPasswordController()
        
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
        
    }
}

extension EntryViewController{
    
    
    func setUpTextField(_ textField: UITextField, _ labelText: String){
        let label = UILabel()
        label.text = labelText
        label.font = UIFont(name: "Inter-Light", size: 14)
        textField.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: textField.leadingAnchor)
        ])
    }
    
    func setUpStyleTopView(){
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .navigationBarColor
    
    }
    
    func setUpStyleEmailField(){
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.keyboardType = UIKeyboardType.default
        emailField.returnKeyType = .done
        emailField.autocapitalizationType = UITextAutocapitalizationType.none
        emailField.font = UIFont.systemFont(ofSize: 20)
        emailField.borderStyle = UITextField.BorderStyle.roundedRect
        emailField.clearButtonMode = UITextField.ViewMode.whileEditing
        emailField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        emailField.backgroundColor = .systemGray6
        
    }
    
    func setUpStyleEntryButton(){
        entryButton.translatesAutoresizingMaskIntoConstraints = false
        entryButton.setTitle("Вход", for: .normal)
        entryButton.setTitleColor(.white, for: .normal)
        entryButton.backgroundColor = .personColor
        entryButton.titleLabel?.font = UIFont(name: "Inter-Bold", size: 18)
        entryButton.layer.cornerRadius = 18
    }
    
    func setUpStyleForgetPasswordButton(){
        forgetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgetPasswordButton.setTitle("Забыли пароль?", for: .normal)
        forgetPasswordButton.setTitleColor(.personColor, for: .normal)
        forgetPasswordButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
        
        
    }
    
    func setUpStylePasswordField(){
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.keyboardType = UIKeyboardType.default
        passwordField.returnKeyType = .done
        passwordField.autocapitalizationType = UITextAutocapitalizationType.none
        passwordField.font = UIFont.systemFont(ofSize: 20)
        passwordField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordField.clearButtonMode = UITextField.ViewMode.whileEditing
        passwordField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        passwordField.backgroundColor = .systemGray6
        passwordField.isSecureTextEntry = true
        
        
    }
    
    func setUpStyleEntryWithLable(){
        entryWithLable.translatesAutoresizingMaskIntoConstraints = false
        entryWithLable.text = "Войдите с"
        entryWithLable.font = UIFont(name: "Inter-Medium", size: 15)
        entryWithLable.textColor = .label
        
    }
    
    func setUpStyleGoogleButton(){
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        googleButton.setTitle("Google", for: .normal)
        googleButton.titleLabel?.font = UIFont(name: "Inter-Light", size: 15)
        googleButton.setTitleColor(.label, for: .normal)
        googleButton.backgroundColor = .systemGray6
        googleButton.layer.cornerRadius = 18
        
    }
    
    func setUpFacebookButton(){
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        facebookButton.setTitle("Facebook", for: .normal)
        facebookButton.titleLabel?.font = UIFont(name: "Inter-Light", size: 15)
        facebookButton.setTitleColor(.label, for: .normal)
        facebookButton.backgroundColor = .systemGray6
        facebookButton.layer.cornerRadius = 18
        
        
    }
    
    func setUpStyleLeftLine(){
        leftLine.translatesAutoresizingMaskIntoConstraints = false
        leftLine.backgroundColor = .systemGray5
    }
    
    func setUpStyleRightLine(){
        rightLine.translatesAutoresizingMaskIntoConstraints = false
        rightLine.backgroundColor = .systemGray5
    }
    func setUpStyleNoAccountLabel(){
        noAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        noAccountLabel.text = "Нет аккаунта?"
        noAccountLabel.font = UIFont(name: "Inter-Medium", size: 15)
        noAccountLabel.textColor = .label
    }
    
    func setUpStyleRegButton(){
        regButton.translatesAutoresizingMaskIntoConstraints = false
        regButton.setTitle("Зарегистрируйтесь", for: .normal)
        regButton.setTitleColor(.personColor, for: .normal)
        regButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
    }
    
    func setUpStyleLabel2(){
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.text = "Введите ваш логин и пароль"
        label2.font = UIFont(name: "Inter-Medium", size: 15)
        label2.textColor = .white
    }
    
    func setUpStyleLabel1(){
        self.label1.translatesAutoresizingMaskIntoConstraints = false
        self.label1.text = "Войдите в свой\nаккаунт"
        self.label1.font = UIFont(name: "Inter-Bold", size: 32)
        self.label1.textColor = .white
        self.label1.numberOfLines = 0
    }
    
    
}
