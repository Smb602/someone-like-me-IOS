/*
  ChatMessagesCell.swift
  Someone Like Me

  This class is responsible for the how cells look in the chats storyboard/myChatViewController and this is done via the MessagesCell design zip file which is a custom designed cell with a profile photo displayed and the email of user who sent it along with their message.

  Created by Sharon Borges-Bango on 28/07/2018.
  Copyright © 2018 Sharon Borges-Bango. All rights reserved.
*/

import UIKit

class ChatMessagesCell: UITableViewCell {

    
    
    @IBOutlet var displayPicture: UIImageView!
    @IBOutlet var theSendersUsername: UILabel!
    @IBOutlet var theMessageBody: UILabel!
    @IBOutlet var theMessageBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   // override func setSelected(_ selected: Bool, animated: Bool) {
       // super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
  //  }

}
