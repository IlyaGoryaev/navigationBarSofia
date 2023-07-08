
import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {
    
    let topView = UIView()
    let nameField = UITextField()
    let emailField = UITextField()
    let passwordField = UITextField()
    let registrationButton = UIButton()
    let label2 = UILabel()
    let label1 = UILabel()
    let accountLabel = UILabel()
    let entryButton = UIButton()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        style()
        layout()
        
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        setUpTextField(nameField, "Ваше имя")
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
}
extension RegistrationViewController{
    
    func style(){
        setUpStyleTopView()
        setUpStyleEmailField()
        setUpStylePasswordField()
        setUpStyleNameField()
        setUpStyleRegButton()
        setUpStyleAccountLabel()
        setUpStyleEntryButton()
        setUpStyleLabel2()
        setUpStyleLabel1()
    }
    
    func layout(){
        let sizeInProp = 0.25
        
        view.addSubview(topView)
        view.addSubview(nameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(registrationButton)
        view.addSubview(accountLabel)
        view.addSubview(entryButton)
        view.addSubview(label2)
        view.addSubview(label1)
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: view.frame.height * sizeInProp),
            
            nameField.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: (view.frame.height - view.frame.height * sizeInProp) * 0.15),
            nameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameField.widthAnchor.constraint(equalToConstant: view.frame.width - 2*25),
            nameField.heightAnchor.constraint(equalToConstant: view.frame.height / 17),
            
            emailField.bottomAnchor.constraint(equalTo: nameField.bottomAnchor, constant: (view.frame.height - view.frame.height * sizeInProp) * 0.15),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.widthAnchor.constraint(equalToConstant: view.frame.width - 2*25),
            emailField.heightAnchor.constraint(equalToConstant: view.frame.height / 17),
            
            passwordField.bottomAnchor.constraint(equalTo: emailField.bottomAnchor, constant: (view.frame.height - view.frame.height * sizeInProp) * 0.15),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.widthAnchor.constraint(equalToConstant: view.frame.width - 2*25),
            passwordField.heightAnchor.constraint(equalToConstant: view.frame.height / 17),
            
            registrationButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 50),
            registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registrationButton.widthAnchor.constraint(equalToConstant: view.frame.width - 2*25),
            registrationButton.heightAnchor.constraint(equalToConstant: view.frame.height / 17),
            
            accountLabel.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 25),
            accountLabel.trailingAnchor.constraint(equalTo: registrationButton.centerXAnchor, constant: -5),
            
            entryButton.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 19),
            entryButton.leadingAnchor.constraint(equalTo: registrationButton.centerXAnchor, constant: 5),
            
            label2.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -20),
            label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            label1.bottomAnchor.constraint(equalTo: label2.topAnchor, constant: -20),
            label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        ])
        
    }
    
    
}
extension RegistrationViewController{
    
    
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
    
    func setUpStyleNameField(){
        nameField.translatesAutoresizingMaskIntoConstraints = false
        nameField.keyboardType = UIKeyboardType.default
        nameField.returnKeyType = .done
        nameField.autocapitalizationType = UITextAutocapitalizationType.none
        nameField.font = UIFont.systemFont(ofSize: 20)
        nameField.borderStyle = UITextField.BorderStyle.roundedRect
        nameField.clearButtonMode = UITextField.ViewMode.whileEditing
        nameField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        nameField.backgroundColor = .systemGray6
        
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
    
    func setUpStyleRegButton(){
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.setTitle("Вход", for: .normal)
        registrationButton.setTitleColor(.white, for: .normal)
        registrationButton.backgroundColor = .personColor
        registrationButton.titleLabel?.font = UIFont(name: "Inter-Bold", size: 18)
        registrationButton.layer.cornerRadius = 18
    }
    
    func setUpStyleAccountLabel(){
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
        accountLabel.text = "Есть аккаунта?"
        accountLabel.font = UIFont(name: "Inter-Medium", size: 15)
        accountLabel.textColor = .label
    }
    
    func setUpStyleEntryButton(){
        entryButton.translatesAutoresizingMaskIntoConstraints = false
        entryButton.setTitle("Войдите", for: .normal)
        entryButton.setTitleColor(.personColor, for: .normal)
        entryButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
    }
    
    
    func setUpStyleLabel2(){
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.text = "Создайте свой аккаунт"
        label2.font = UIFont(name: "Inter-Medium", size: 15)
        label2.textColor = .white
    }
    
    func setUpStyleLabel1(){
        self.label1.translatesAutoresizingMaskIntoConstraints = false
        self.label1.text = "Регистрация"
        self.label1.font = UIFont(name: "Inter-Bold", size: 32)
        self.label1.textColor = .white
    }
    
    
}
