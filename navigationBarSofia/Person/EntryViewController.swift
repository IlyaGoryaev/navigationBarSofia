
import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    let topView = UIView()
    let emailField = UITextField()
    let entryButton = UIButton()
    let forgetPasswordButton = UIButton()
    let passwordField = UITextField()
    let entryWithLable = UILabel()
    let goggleButton = UIButton()
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
        print(view.frame.height - view.frame.height * 0.35)
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        

    }

}
//554
extension EntryViewController{
    
    func style(){
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .navigationBarColor
        emailField.translatesAutoresizingMaskIntoConstraints = false
        forgetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        emailField.keyboardType = UIKeyboardType.default
        emailField.returnKeyType = .done
        emailField.autocapitalizationType = UITextAutocapitalizationType.none
        emailField.font = UIFont.systemFont(ofSize: 16)
        emailField.borderStyle = UITextField.BorderStyle.roundedRect
        emailField.clearButtonMode = UITextField.ViewMode.whileEditing
        emailField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        emailField.backgroundColor = .systemGray6
        
        
        
        entryButton.translatesAutoresizingMaskIntoConstraints = false
        entryButton.setTitle("Вход", for: .normal)
        entryButton.setTitleColor(.white, for: .normal)
        entryButton.backgroundColor = .personColor
        entryButton.titleLabel?.font = UIFont(name: "Inter-Bold", size: 18)
        entryButton.layer.cornerRadius = 18
        
        forgetPasswordButton.setTitle("Забыли пароль?", for: .normal)
        forgetPasswordButton.setTitleColor(.personColor, for: .normal)
        forgetPasswordButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.keyboardType = UIKeyboardType.default
        passwordField.returnKeyType = .done
        passwordField.autocapitalizationType = UITextAutocapitalizationType.none
        passwordField.font = UIFont.systemFont(ofSize: 16)
        passwordField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordField.clearButtonMode = UITextField.ViewMode.whileEditing
        passwordField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        passwordField.backgroundColor = .systemGray6
        
        entryWithLable.translatesAutoresizingMaskIntoConstraints = false
        entryWithLable.text = "Войдите с"
        entryWithLable.font = UIFont(name: "Inter-Medium", size: 15)
        entryWithLable.textColor = .label
        
        goggleButton.translatesAutoresizingMaskIntoConstraints = false
        goggleButton.setTitle("Google", for: .normal)
        goggleButton.titleLabel?.font = UIFont(name: "Inter-Light", size: 15)
        goggleButton.setTitleColor(.label, for: .normal)
        goggleButton.backgroundColor = .systemGray6
        goggleButton.layer.cornerRadius = 18
        
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        facebookButton.setTitle("Facebook", for: .normal)
        facebookButton.titleLabel?.font = UIFont(name: "Inter-Light", size: 15)
        facebookButton.setTitleColor(.label, for: .normal)
        facebookButton.backgroundColor = .systemGray6
        facebookButton.layer.cornerRadius = 18
        
        leftLine.translatesAutoresizingMaskIntoConstraints = false
        leftLine.backgroundColor = .systemGray5
        
        rightLine.translatesAutoresizingMaskIntoConstraints = false
        rightLine.backgroundColor = .systemGray5
        
        noAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        noAccountLabel.text = "Нет аккаунта?"
        noAccountLabel.font = UIFont(name: "Inter-Medium", size: 15)
        noAccountLabel.textColor = .label
        
        regButton.translatesAutoresizingMaskIntoConstraints = false
        regButton.setTitle("Зарегистрируйтесь", for: .normal)
        regButton.setTitleColor(.personColor, for: .normal)
        regButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
        
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.text = "Введите ваш логин и пароль"
        label2.font = UIFont(name: "Inter-Medium", size: 15)
        label2.textColor = .white
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.text = "Войдите в свой\nаккаунт"
        label1.font = UIFont(name: "Inter-Bold", size: 32)
        label1.textColor = .white
        label1.numberOfLines = 0
        
        
    }
    
    func layout(){
        
        view.addSubview(topView)
        view.addSubview(emailField)
        view.addSubview(entryButton)
        view.addSubview(forgetPasswordButton)
        view.addSubview(passwordField)
        view.addSubview(entryWithLable)
        view.addSubview(goggleButton)
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
            topView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.35),
            
            emailField.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: (view.frame.height - view.frame.height * 0.35) * 0.2),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.widthAnchor.constraint(equalToConstant: view.frame.width - 2*25),
            emailField.heightAnchor.constraint(equalToConstant: view.frame.height / 17),
            
            forgetPasswordButton.bottomAnchor.constraint(equalTo: emailField.bottomAnchor, constant: (view.frame.height - view.frame.height * 0.35) * 0.25),
            forgetPasswordButton.trailingAnchor.constraint(equalTo: emailField.trailingAnchor, constant: -5),
            passwordField.bottomAnchor.constraint(equalTo: forgetPasswordButton.topAnchor, constant: -5),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.widthAnchor.constraint(equalToConstant: view.frame.width - 2*25),
            passwordField.heightAnchor.constraint(equalToConstant: view.frame.height / 17),
            
            entryWithLable.bottomAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: (view.frame.height - view.frame.height * 0.35) * 0.27),
            entryWithLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            entryButton.bottomAnchor.constraint(equalTo: entryWithLable.topAnchor, constant: -25),
            entryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            entryButton.widthAnchor.constraint(equalToConstant: view.frame.width - 2*25),
            entryButton.heightAnchor.constraint(equalToConstant: view.frame.height / 17),
            
            goggleButton.topAnchor.constraint(equalTo: entryWithLable.bottomAnchor, constant: view.frame.height / 30),
            goggleButton.heightAnchor.constraint(equalToConstant: view.frame.height / 17),
            goggleButton.widthAnchor.constraint(equalToConstant: (view.frame.width - 2*25) / 2 - 10),
            goggleButton.leadingAnchor.constraint(equalTo: entryButton.leadingAnchor),
            
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
            noAccountLabel.trailingAnchor.constraint(equalTo: goggleButton.trailingAnchor),
            
            regButton.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            regButton.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 19),
            
            label2.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -20),
            label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            label1.bottomAnchor.constraint(equalTo: label2.topAnchor, constant: -20),
            label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        
        ])
        
        
        
    }
    
    
    
}
