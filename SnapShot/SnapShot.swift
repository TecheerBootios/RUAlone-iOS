//
//  SnapShot.swift
//  SnapShot
//
//  Created by Sean Hong on 2023/03/06.
//

import XCTest

final class SnapShot: XCTestCase {
    override func setUp() {
        super.setUp()
        
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        snapshot("0Launch")
        
        let authenticationButton = XCUIApplication().buttons
        authenticationButton.firstMatch.tap()
        snapshot("1HomeScreen")
        
        let tabBar = XCUIApplication().tabBars
        let homeTabBar = tabBar.buttons.element(boundBy: 0)
        let feedTabBar = tabBar.buttons.element(boundBy: 1)
        let messageTabBar = tabBar.buttons.element(boundBy: 2)
        
        feedTabBar.tap()
        snapshot("2FeedScreen")
        
        messageTabBar.tap()
        snapshot("3MessageScreen")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
