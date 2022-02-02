//
//  CryptoController.swift
//  ControlDeGastos
//
//  Created by Américo MQ on 02/02/22.
//

import Foundation
import CryptoKit

class CryptoController {
    func encryptData(_ data: String) -> String? {
        guard let dataToEncrypt = data.data(using: .utf8) else { return nil }
        let hashed = SHA512.hash(data: dataToEncrypt)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }
    func compareEncryptedData(_ data: String) -> Bool {
        return true
    }
}
