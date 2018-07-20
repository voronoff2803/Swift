import UIKit
import Foundation
import SwiftyVK

class AuthViewController: UIViewController {

    @IBAction func AuthButtnonPressed(_ sender: Any) {
        auth()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if VK.sessions.default.state == .authorized {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "showResult", sender: nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func auth() {
        VK.sessions.default.logIn(
            onSuccess: { _ in
                self.performSegue(withIdentifier: "showResult", sender: nil)
        },
            onError: { _ in
                let alertcontroller = UIAlertController(title: "Ошибка", message: "Проверьте соединение с интернетом", preferredStyle: UIAlertControllerStyle.alert)
                let cancelAlert = UIAlertAction(title: "Отмена", style: UIAlertActionStyle.default) { (alert) in
                }
                alertcontroller.addAction(cancelAlert)
                self.present(alertcontroller, animated: true, completion: nil)
        }
        )
    }


}

