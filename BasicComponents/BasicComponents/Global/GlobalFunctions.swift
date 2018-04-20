//
//  GlobalFunctions.swift
//  BasicComponents
//
//  Created by Kevin Cheng on 20/4/2018.
//  Copyright © 2018 Kevin Cheng. All rights reserved.
//

public func printLog<T>( _ object: @autoclosure() -> T, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
  #if DEBUG
    let value = object();
    let stringRepresentation: String;
    
    if let value = value as? CustomDebugStringConvertible {
      stringRepresentation = value.debugDescription;
    } else if let value = value as? CustomStringConvertible {
      stringRepresentation = value.description;
    } else {
      print("printLog only works for values that conform to CustomDebugStringConvertible or CustomStringConvertible");
      stringRepresentation = "Unknown";
    }
    
    let fileURL = NSURL(string: file)?.lastPathComponent ?? "Unknown file";
    let queue = Thread.isMainThread ? "UI" : "BG";
    let dateFormatter = DateFormatter();
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss:SSS";
    let timestamp = dateFormatter.string(from: Date());
    
    print("✅ \(timestamp) {\(queue)} \(fileURL)[\(line)] \(function):\n" + stringRepresentation);
  #endif
}

public var DateWithGMTTimeZone: Date {
  return DateWithTimeZone(timeZone: TimeZone(abbreviation: "GMT"));
}

public func DateWithTimeZone(timeZone: TimeZone?)-> Date {
  let now = Date();
  var dateComponents = DateComponents();
  let calendar = NSCalendar.current;
  dateComponents.year = calendar.component(Calendar.Component.year, from: now);
  dateComponents.month = calendar.component(Calendar.Component.month, from: now);
  dateComponents.day = calendar.component(Calendar.Component.day, from: now);
  dateComponents.hour = calendar.component(Calendar.Component.hour, from: now);
  dateComponents.minute = calendar.component(Calendar.Component.minute, from: now);
  dateComponents.second = calendar.component(Calendar.Component.second, from: now);
  dateComponents.timeZone = timeZone;
  
  guard let calendarDate = calendar.date(from: dateComponents) else {
    fatalError("can't get converted date from calendar");
  }
  
  return calendarDate;
}
