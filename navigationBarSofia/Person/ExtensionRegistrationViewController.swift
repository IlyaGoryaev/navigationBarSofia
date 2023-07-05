import UIKit
import Firebase

extension RegistrationViewController{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let name = nameField.text!
        let email = emailField.text!
        let password = passwordField.text!
        if (!name.isEmpty && !email.isEmpty && !password.isEmpty){
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if error == nil{
                    if let result = result{
                        print(result.user.uid)
                        let ref = Database.database().reference().child("users")
                        ref.child(result.user.uid).updateChildValues(["name" : name, "email" : email])
                    }
                    self.dismiss(animated: true)
                } else {
                    print(error)
                    self.showAlert()
                }
            }
            
        }
        return true
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Ошибка", message: "Не удается создать пользователя", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default))
        present(alert, animated: true)
    }
    
    func showAlertSuccess(){
        let alert = UIAlertController(title: "Успех!", message: "Вы успешно зарегистрировались", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .cancel))
        present(alert, animated: true)
    }
    
    
}
