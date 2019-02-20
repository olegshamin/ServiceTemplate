//
//  PersonServiceTests.swift
//  ServiceTemplateTests
//
//  Created by Oleg Shamin on 20.02.19.
//  Copyright © 2019 olegshamin. All rights reserved.
//

import XCTest
@testable import ServiceTemplate

private extension TimeInterval {
    static let expectationTimeout: TimeInterval = 1
}

private extension String {
    static let mockPersonId: String = "ad990087-f798-4056-b62c-cdf629d2da6b"
}

class PersonServiceTests: BaseTestCase {
    
    // MARK: Properties
    
    var service: PersonService!
    var offlineService: PersonService!
    
    // MARK: Life cycle

    override func setUp() {
        super.setUp()
        
        service = FakePersonServiceAssemblyImpl().service()
        offlineService = OfflinePersonServiceAssemblyImpl().service()
    }

    override func tearDown() {
        super.tearDown()
        service = nil
        offlineService = nil
    }
    
    // MARK: Tests
    
    func testPersonCallbackCalled() {
        // Given
        let expectation = self.expectation(description: "Service expectation")
        // When
        service.person(with: .mockPersonId) { _ in
            // Then
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: .expectationTimeout)
    }
    
    func testOfflinePersonCallbackCalled() {
        // Given
        let expectation = self.expectation(description: "Service expectation")
        // When
        service.person(with: .mockPersonId) { _ in
            self.offlineService.person(with: .mockPersonId) { _ in
                // Then
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: .expectationTimeout)
    }
    
    func testTest() {
        // Given
        let expectedPerson = Person.mockPerson
        // When
        service.person(with: .mockPersonId) { (result) in
            // Then
            guard case .success(let person) = result else {
                XCTFail("Wrong result case: \(result)")
                return
            }
            XCTAssertTrue(person == expectedPerson, "Person should be equal to expected model")
        }
    }
}
