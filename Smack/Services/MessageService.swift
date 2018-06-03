//
//  MessageService.swift
//  Smack
//
//  Created by Luca Lo Forte on 03/06/18.
//  Copyright © 2018 Luca Lo Forte. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    func findAllChannel(completion: @escaping CompletionHandler ) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
//            //Swift 4 new way to handle parsing(json)
//            if response.result.isSuccess {
//                guard let data = response.data else {return}
//
//                do {
//                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
//                } catch let error {
//                    debugPrint(error as Any)
//                }
            if response.result.isSuccess {
                let json : JSON = JSON(response.result.value!)
                if let channelsArray = json.array {
                    for item in channelsArray {
                        let name = item["name"].stringValue
                        let description = item["description"].stringValue
                        let id = item["_id"].stringValue
                        let channel = Channel(channelTitle: name, channelDescription: description, id: id)
                        self.channels.append(channel)
                    }
                    completion(true)
                }
            
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
