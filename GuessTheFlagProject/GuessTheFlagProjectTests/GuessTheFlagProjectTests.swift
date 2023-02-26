//
//  GuessTheFlagProjectTests.swift
//  GuessTheFlagProjectTests
//
//  Created by Damian Mickiewicz on 22/02/2023.
//

import XCTest
@testable import GuessTheFlagProject

final class GuessTheFlagProjectTests: XCTestCase {
    
    let viewController = ViewController()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testViewControllerNil() throws {
        XCTAssertNotNil(viewController, "ViewController is nil")
    }

    func testIsCorrectAnswer() throws {
        let buttonID = 0
        let isCorrectAnswer = viewController.isCorrectAnswer(buttonId: buttonID)
        let correctAnswer = viewController.correctAnswer
        
        XCTAssertTrue(isCorrectAnswer, "correctAnswer = \(correctAnswer), buttonID = \(buttonID)")
    }
    
    func testIsNotCorrectAnswer() throws {
        let buttonID = 2
        let isCorrectAnswer = viewController.isCorrectAnswer(buttonId: buttonID)
        let correctAnswer = viewController.correctAnswer
        
        XCTAssertFalse(isCorrectAnswer, "correctAnswer = \(correctAnswer), buttonID = \(buttonID)")
    }
    
    func testIsEqualTrying() throws {
        let correctAnswer = viewController.correctAnswer
        let buttonID = 0
        
        XCTAssertEqual(correctAnswer, buttonID, "Isn't equal")
    }
    
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
