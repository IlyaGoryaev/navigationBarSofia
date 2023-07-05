import UIKit
import Firebase

extension EntryViewController{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let email = self.emailField.text!
        let password = self.passwordField.text!
        if (!email.isEmpty && !password.isEmpty){
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if error != nil{
                    self.showAlertError()
                }
            }
        } else {
            
            if email.isEmpty{
                UIView.animate(withDuration: 0.6) {
                    self.emailField.backgroundColor = .red
                    self.emailField.backgroundColor = .systemGray6
                }
            }
            
            if password.isEmpty{
                UIView.animate(withDuration: 0.6) {
                    self.passwordField.backgroundColor = .red
                    self.passwordField.backgroundColor = .systemGray6
                }
            }
            
            if password.isEmpty && email.isEmpty{
                UIView.animate(withDuration: 0.6) {
                    self.emailField.backgroundColor = .red
                    self.passwordField.backgroundColor = .red
                    self.emailField.backgroundColor = .systemGray6
                    self.passwordField.backgroundColor = .systemGray6
                }
            }
            
            
        }
        
        return true
    }
    
    func showAlertError(){
        
        let alert = UIAlertController(title: "Ошибка", message: "Неверно введен логин или пароль", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default))
        present(alert, animated: true)
    }
    
    
}
