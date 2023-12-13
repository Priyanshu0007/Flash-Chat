
import UIKit
import Firebase
class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var message:[Message]=[
        Message(sender: "1@1.com", body: "Hey!"),
        Message(sender: "2@1.com", body: "Helo!"),
        Message(sender: "3@1.com", body: "Hola!"),
        Message(sender: "4@1.com", body: "Hello!")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        title=K.appName
        navigationItem.hidesBackButton=true
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do{
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }catch let signOutError as NSError{
            print("Error signing out : %@", signOutError)
        }
    }
    
}
extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text=message[indexPath.row].body
        return cell
    }
    
}

