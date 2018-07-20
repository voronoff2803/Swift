import Foundation
import UIKit

class FriendUITableViewCell: UITableViewCell {

    @IBOutlet weak var FriendImageView: UIImageView!
    @IBOutlet weak var FriendeUILabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var bdateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
                self.FriendImageView.image = UIImage(data: data)
            }
        }
    }
    
    func setCell(first_name: String, last_name: String, status: Int, bdate: String?, sex: Int, imgUrl: String) {
        self.FriendeUILabel.text = first_name + " " + last_name
        self.downloadImage(url: URL(string: imgUrl)!)
        if status == 1 {
            self.statusLabel.text = "онлайн"
            self.statusLabel.textColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        } else {
            self.statusLabel.text = "не в сети"
            self.statusLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        self.accessoryType = .disclosureIndicator
        if let birthdate = bdate {
            self.bdateLabel.text = "Дата рождения: " + birthdate
        }
    }
    

}
