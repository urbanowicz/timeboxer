
import UIKit

struct WorkChunk {
    var date:NSDate
    var duration:Int
}
 let formatter = NSDateFormatter()
formatter.dateFormat = "YYYY-MMM-dd"
let calendar = NSCalendar.currentCalendar()
let someMonday = formatter.dateFromString("2016-MAR-28")!

calendar.compareDate(NSDate(), toDate: someMonday, toUnitGranularity: NSCalendarUnit.Day) == NSComparisonResult.OrderedSame


let numberOfSeconds = 3600
let now = NSDate()
let stopTime = calendar.dateByAddingUnit(NSCalendarUnit.Second, value: numberOfSeconds, toDate: now, options: NSCalendarOptions())

stopTime?.timeIntervalSinceDate(now)