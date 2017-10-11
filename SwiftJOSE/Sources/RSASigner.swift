//
//  RSASigner.swift
//  SwiftJOSE
//
//  Created by Daniel Egger on 21/08/2017.
//  Copyright © 2017 Airside Mobile, Inc. All rights reserved.
//

import Foundation

public struct RSASigner: Signer {
    let key: String
    
    var supportedAlgorithms: [SigningAlgorithm] {
        return [ .rs512 ]
    }
    
    public init(key: String) {
        self.key = key
    }
    
    public func sign(_ signingInput: Data, using algorithm: SigningAlgorithm) -> Data? {
        guard supportedAlgorithms.contains(algorithm) else {
            return nil
        }
        
        let input = String(data: signingInput, encoding: .utf8)!
        return "\(algorithm.rawValue)(\(input))".data(using: .utf8)
    }
}