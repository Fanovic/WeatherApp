//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Lucas Fanovich on 14/12/2020.
//

import XCTest
import PromiseKit
@testable import WeatherApp

class WeatherAppTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    func testWeatherSuccess(){
        let expectation = XCTestExpectation(description: "weather request")
        var success: Bool = false
        firstly {
            WeatherService.fetchForecastByCity(with: "Mar%20del%20Plata")
        }.done { (response) in
            success = true
            expectation.fulfill()
        }.catch { (error) in
            success = false
        }
        wait(for: [expectation], timeout: 10)
        XCTAssertTrue(success)
    }
    
    func testWeatherFailure(){
        let expectation = XCTestExpectation(description: "weather request")
        var success: Bool = false
        firstly {
            WeatherService.fetchForecastByCity(with: "Mar del Plata")
        }.done { (response) in
            success = true
        }.catch { (error) in
            success = false
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
        XCTAssertFalse(success)
    }
    func testWeatherEmptyFailure(){
        let expectation = XCTestExpectation(description: "weather request")
        var success: Bool = false
        firstly {
            WeatherService.fetchForecastByCity(with: "")
        }.done { (response) in
            success = true
        }.catch { (error) in
            success = false
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
        XCTAssertFalse(success)
    }

}
