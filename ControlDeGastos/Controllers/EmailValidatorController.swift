//
//  EmailValidatorController.swift
//  ControlDeGastos
//
//  Created by Américo MQ on 02/02/22.
//

import Foundation

class EmailValidatorController {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
    }
}
