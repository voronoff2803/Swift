import Foundation
import SwiftyVK

typealias JSON = [String : Any]

class VkApiWork {
    static func getFriends(completion: @escaping ([FriendModel]?) -> Void) {
            VK.API.Friends.get([
            .fields: "sex,bdate,photo_100,photo_200"
            ])
            .onSuccess { let response = try JSONSerialization.jsonObject(with: $0)
                let jsonValue = (response as! JSON)["items"]
                let decoder = JSONDecoder()
                let itemsData = try? JSONSerialization.data(withJSONObject: jsonValue, options: [])
                let itemsArray = try? decoder.decode([FriendModel].self, from: itemsData!)
                completion(itemsArray)
                }
            .onError {_ in 
                print("Request failed with error: ($0)")
            }
            .send()
    }
}
