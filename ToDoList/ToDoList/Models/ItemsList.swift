import Foundation

var arrayItems: [[String: Any]] {
    get {
        let array = UserDefaults.standard.array(forKey: "Key")
        if array == nil {
            return []
        } else {
            return array as! [[String : Any]]
        }
    }
    set {
        UserDefaults.standard.set(newValue, forKey: "Key")
        UserDefaults.standard.synchronize()
    }
}
