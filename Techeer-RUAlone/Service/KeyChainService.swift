//
//  KeyChainService.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/25.
//

import Foundation
import Security
import KakaoSDKAuth

final class KeyChainService {
    static let shared = KeyChainService()
    private init() { }
    
    private let service = Bundle.main.bundleIdentifier
    private let account = "Service"
    
    private lazy var query: [CFString: Any]? = {
        guard let service = self.service else { return nil }
        return [kSecClass: kSecClassGenericPassword,
                kSecAttrService: service,
                kSecAttrAccount: account]
    }()
    
    func createToken(_ token: String) -> Bool {
        guard let data = try? JSONEncoder().encode(token),
              let service = self.service else { return false }
        
        let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                kSecAttrService: service,
                                kSecAttrAccount: account,
                                kSecAttrGeneric: data]
        
        return SecItemAdd(query as CFDictionary, nil) == errSecSuccess
    }
    
    func readToken() -> String? {
        guard let service = self.service else { return nil }
        let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                kSecAttrService: service,
                                kSecAttrAccount: account,
                                kSecMatchLimit: kSecMatchLimitOne,
                                kSecReturnAttributes: true,
                                kSecReturnData: true]
        
        var item: CFTypeRef?
        if SecItemCopyMatching(query as CFDictionary, &item) != errSecSuccess { return nil }
        
        guard let existingItem = item as? [String: Any],
              let data = existingItem[kSecAttrGeneric as String] as? Data,
              let token = try? JSONDecoder().decode(String.self, from: data) else { return nil }
        
        return token
    }
    
    func updateToken(_ token: String) -> Bool {
        guard let query = self.query,
              let data = try? JSONEncoder().encode(token) else { return false }
        
        let attributes: [CFString: Any] = [kSecAttrAccount: account,
                                           kSecAttrGeneric: data]
        
        return SecItemUpdate(query as CFDictionary, attributes as CFDictionary) == errSecSuccess
    }
    
    func deleteToken() -> Bool {
        guard let query = self.query else { return false }
        return SecItemDelete(query as CFDictionary) == errSecSuccess
    }
}
