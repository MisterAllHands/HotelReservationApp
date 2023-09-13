//
//  SwiftClass.swift
//  HotelReservationApp
//
//  Created by TTGMOTSF on 07/09/2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {return false}
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = formater(mask: "+X (XXX) XXX-XX-XX", phoneNumber: newString)
        return false
    }
    
    func formater(mask: String, phoneNumber: String) -> String {
        let number = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result: String = ""
        var index = number.startIndex
        
        for character in mask where index < number.endIndex {
            if character == "X" {
                result.append(number[index])
                index = number.index(after: index)
            }else{
                result.append(character)
            }
        }
        return result
    }
}
