import UIKit
import Alamofire

struct Contacto: Codable {
    let nombre : String
    let email : String
    let id: String
}

class MostrarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tabla: UITableView!
    var contactos = [Contacto]()
    override func viewDidLoad() {
        super.viewDidLoad()
        datos()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        datos()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabla.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let contacto = contactos[indexPath.row]
        cell.textLabel?.text = contacto.nombre
        cell.detailTextLabel?.text = contacto.email
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editar", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editar" {
            if let id = tabla.indexPathForSelectedRow {
            let fila = contactos[id.row]
            let destino = segue.destination as! EditarViewController
                destino.contacto = fila
            }
        }
    }

    func datos(){
        let url = URL(string: "http://127.0.0.1/ws/mostrar.php")
        
        Alamofire.request(url!).responseJSON { (response) in
            let result = response.data
            do{
                self.contactos = try JSONDecoder().decode([Contacto].self, from: result!)
                DispatchQueue.main.async {
                    self.tabla.reloadData()
                }
            }catch{
                print("error al conectar con php")
            }
        }
   
    }

    @IBAction func salir(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "sesion")
        dismiss(animated: true, completion: nil)
    }
    
}











