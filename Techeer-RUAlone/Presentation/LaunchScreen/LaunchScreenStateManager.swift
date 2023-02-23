//
//  LaunchScreenStateManager.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2023/02/24.
//

import Foundation

final class LaunchScreenStateManager: ObservableObject {
    @MainActor @Published private(set) var state: LaunchScreenStep = .firstStep
    
    @MainActor func dismiss() {
        Task {
            state = .secondStep
            try? await Task.sleep(for: Duration.seconds(1))            
            self.state = .finished
        }
    }
}
