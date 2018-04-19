import UIKit
import Alamofire
class RegistrarViewController: UIViewController {

    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var respuesta: UILabel!
    
    var url_registrar = "http://127.0.0.1/ws/registrar.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func resgistrar(_ sender: UIButton) {
        
        let parametros : Parameters = [
            "usuario": user.text!,
            "pass": pass.text!,
            "nombre": name.text!,
            "email": email.text!
        ]
        
        Alamofire.request(url_registrar, method: .post, parameters: parametros).responseJSON { (response) in
            print(response)
            
            if let result = response.result.value {
                let jsonData = result as! NSDictionary
                self.respuesta.text = jsonData.value(forKey: "mensaje") as! String?
            }
            
        }
        
    }
    
    @IBAction func regresar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
