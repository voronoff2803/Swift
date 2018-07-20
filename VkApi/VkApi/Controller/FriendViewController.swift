import UIKit

class FriendViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bigLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var bdateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    func setupView(friend: FriendModel!) {
        print(friend)
        DispatchQueue.main.async {
            self.bigLabel.text = friend.first_name + " " + friend.last_name
            if friend.sex == 2 {
                self.sexLabel.text = "Пол: мужской"
            } else {
                self.sexLabel.text = "Пол: женский"
            }
            if let birthdate = friend.bdate {
                self.bdateLabel.text = "Дата рождения: " + String(birthdate)
            }
            if friend.online == 1 {
                self.statusLabel.text = "Пользователь онлайн"
            } else {
                self.statusLabel.text = "Пользователь не в сети"
            }
            self.downloadImage(url: URL(string: friend.photo_200!)!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.imageView.image = UIImage(data: data)
            }
        }
    }

}
