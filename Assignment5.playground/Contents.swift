//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func isLeap(y: Int) -> Bool {
    return (y % 4 == 0) && (y % 100 != 0 || y % 400 == 0)
}

let monthArray = [(mo: 1, dy: 31),(mo: 2, dy: 28),(mo: 3, dy: 31),(mo: 4, dy: 30),(mo: 5,dy: 31),(mo: 6, dy: 30),(mo: 7, dy: 31),(mo: 8, dy: 31),(mo: 9, dy: 30),(mo: 10,dy: 31),(mo: 11,dy: 30),(mo: 12, dy: 31)]
var years = (1900...2015).map { $0 }

func julianDate(year: Int, month: Int, day: Int) -> Int {
    var filteredYears = years.filter{ isLeap($0) == true && $0 <= year}
    var filteredMonth = monthArray.filter({$0.mo < month})
    var days: Int {return filteredMonth.reduce(0,combine: {$0 + $1.dy}) + day + (year-1900)*365 + filteredYears.count}
    return days
}

julianDate(1960, month:  9, day: 28)
julianDate(1900, month:  1, day: 1)
julianDate(1900, month: 12, day: 31)
julianDate(1901, month: 1, day: 1)
julianDate(1901, month: 1, day: 1) - julianDate(1900, month: 1, day: 1)
julianDate(2001, month: 1, day: 1) - julianDate(2000, month: 1, day: 1)
isLeap(1960)
isLeap(1900)
isLeap(2000)

