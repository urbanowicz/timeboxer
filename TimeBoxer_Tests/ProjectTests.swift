//
//  ProjectTests.swift
//  TimeBoxer
//
//  Created by Tomasz Urbanowicz on 07/02/16.
//  Copyright © 2016 Tomasz Urbanowicz. All rights reserved.
//

import XCTest

class ProjectTests: XCTestCase {
    var project:Project?
    override func setUp() {
        super.setUp()
        project = Project(projectName: "myProject", startDate: NSDate())
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testProjectCreation() {
        let myProject = project!
        let compareResult = NSCalendar.currentCalendar().compareDate(NSDate(), toDate: myProject.startDate, toUnitGranularity: NSCalendarUnit.Day)
        XCTAssert(myProject.name == "myProject")
        XCTAssert(compareResult == NSComparisonResult.OrderedSame)
    }
    
    func testRecordWork() {
        let myProject = project!
        XCTAssert(myProject.workChunks.count == 0)
        myProject.recordWork(3600)
        XCTAssert(myProject.workChunks.count == 1)
        XCTAssert(myProject.totalSeconds() == 3600)
        myProject.recordWork(20)
        XCTAssert(myProject.workChunks.count == 2)
        XCTAssert(myProject.totalSeconds() == 3620)
    }
    
    func testLastWorkedOn() {
        let myProject = project!
        XCTAssert(myProject.lastWrokedOn() == nil)
        myProject.recordWork(3600)
        let lastWorkedOn = myProject.lastWrokedOn()
        XCTAssert(lastWorkedOn != nil)
        let compareResult = NSCalendar.currentCalendar().compareDate(NSDate(), toDate: lastWorkedOn!, toUnitGranularity: NSCalendarUnit.Day)
        XCTAssert(compareResult == NSComparisonResult.OrderedSame)
    }
    
    func testDaysSinceStart() {
        XCTAssert(project!.daysSinceStart() == 1)
        let tenDaysAgo = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Day, value: -10, toDate: NSDate(), options: NSCalendarOptions())!
        let myProject = Project(projectName: "myProject", startDate: tenDaysAgo)
        XCTAssert(myProject.daysSinceStart() == 11)
        
    }
    
    func testAveragePaceLastSevenDays_1() {
        let myProject = project!
        var pace = myProject.averagePaceLastSevenDays()
        XCTAssert(pace == 0)
        myProject.recordWork(200)
        myProject.recordWork(200)
        pace = myProject.averagePaceLastSevenDays()
        XCTAssert(pace == 400)
    }
    
    func testAveragePaceLastSevenDays_2() {
        let tenDaysAgo = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Day, value: -10, toDate: NSDate(), options: NSCalendarOptions())!
        var myProject = Project(projectName: "myProject", startDate: tenDaysAgo)
        myProject.workChunks.append(createWorkChunkWith(9, duration: 200))
        XCTAssert(myProject.averagePaceLastSevenDays() == 0)
        myProject.workChunks.append(createWorkChunkWith(7, duration: 200))
        XCTAssert(myProject.averagePaceLastSevenDays() == 0)
        myProject.workChunks.append(createWorkChunkWith(6, duration: 300))
        myProject.workChunks.append(createWorkChunkWith(5, duration: 200))
        myProject.workChunks.append(createWorkChunkWith(5, duration: 200))
        XCTAssert(myProject.averagePaceLastSevenDays() == (300 + 200 + 200) / 7)
    }
    
    private func createWorkChunkWith(numberOfDaysAgo:Int, duration: Int) -> WorkChunk {
        let workDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Day, value: -numberOfDaysAgo, toDate: NSDate(), options: NSCalendarOptions())!
        return WorkChunk(date: workDate, duration: duration)
    }
    
}