//
//  SocketService.swift
//  Smack
//
//  Created by Luca Lo Forte on 04/06/18.
//  Copyright © 2018 Luca Lo Forte. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {
    
    static let instance = SocketService()
    
    override init() {
        super.init()
    }
    
    var manager = SocketManager(socketURL: URL(string: BASE_URL)!, config: [.log(true), .compress])
    lazy var socket = manager.defaultSocket
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    //emit: quando inviamo qualcosa tramite socket
    //on : il modo di ricevere informazioni
    
    //Abbiamo bisogno di un funzione per fare un emit di un oggetto channel verso il server
    //e una per sapere quando il sever risponde con il channel aggiunto
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        manager.defaultSocket.emit("newChannel", channelName,channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        manager.defaultSocket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else {return}
            guard let channelDescription = dataArray[1] as? String else {return}
            guard let channelId = dataArray[2] as? String else {return}
            
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDescription, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    func addMessage(messageBody: String, userId: String, channelId: String, completion: @escaping CompletionHandler) {
        let user = UserDataService.instance
        manager.defaultSocket.emit("newMessage", messageBody,userId,channelId, user.name, user.avatarName, user.avatarColor)
        completion(true)
    }
    
    func getMessage(completion: @escaping CompletionHandler) {
        manager.defaultSocket.on("messageCreated") { (dataArray, ack) in
            guard let messageBody = dataArray[0] as? String else {return}
            //guard let userId = dataArray[1] as? String else {return}
            guard let channelId = dataArray[2] as? String else {return}
            guard let userName = dataArray[3] as? String else {return}
            guard let userAvatar = dataArray[4] as? String else {return}
            guard let userAvatarColor = dataArray[5] as? String else {return}
            guard let messageId = dataArray[6] as? String else {return}
            guard let timeStamp = dataArray[7] as? String else {return}
            
            let newMessage = Message(message: messageBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: messageId, timeStamp: timeStamp)
            MessageService.instance.messages.append(newMessage)
            completion(true)
        }
    }
    
}











