import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var seconLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
