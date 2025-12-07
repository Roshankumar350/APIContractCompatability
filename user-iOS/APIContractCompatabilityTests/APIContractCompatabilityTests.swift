//
//  APIContractCompatabilityTests.swift
//  APIContractCompatabilityTests
//
//  Created by Roshan Sah on 03/12/25.
//

import XCTest
@testable import APIContractCompatability
import Combine

@MainActor
final class APIContractCompatabilityTests: XCTestCase {

    var viewModel: UserViewModel<MockUserResourceManager>!
    var cancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        viewModel = UserViewModel(resourceManager: MockUserResourceManager())
        cancellables = []
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchUsersV1() throws {
        let expectation = expectation(description: "Fetch users from Version v1")
        
        viewModel.$users
            .dropFirst()
            .sink { users in
                XCTAssertTrue(users.count == 2)
                XCTAssertEqual(users[0].firstName, "Ava")
                XCTAssertEqual(users[0].lastName, "Sharma")
                XCTAssertEqual(users[0].fullName, "Ava Sharma")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.fetchUsers(for: .v1)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchUsersV2() throws {
        let expectation = expectation(description: "Fetch users from Version v2")
        viewModel.$users
            .dropFirst()
            .sink { users in
                XCTAssertTrue(users.count == 2)
                XCTAssertEqual(users[0].firstName, "Ava")
                XCTAssertEqual(users[0].lastName, "Sharma")
                XCTAssertEqual(users[0].fullName, "Ava Sharma")
                expectation.fulfill()
                
            }
            .store(in: &cancellables)
        
        viewModel.fetchUsers(for: .v2)
        
        wait(for: [expectation], timeout: 2.0)
    }

}
