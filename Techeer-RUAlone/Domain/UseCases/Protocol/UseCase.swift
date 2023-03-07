//
//  UseCase.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/01/21.
//

import Foundation
import Combine

public protocol UseCase {
    @discardableResult
    func start() -> Cancellable?
}
