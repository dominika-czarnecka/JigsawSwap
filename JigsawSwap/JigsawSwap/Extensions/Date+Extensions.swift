//
//  Date+Extensions.swift
//  MediApp
//
//  Created by Dominika Czarnecka on 05.11.2017.
//  Copyright © 2017 DominikaCzarnecka. All rights reserved.
//

import UIKit

extension Formatter {
	
	static let dayAndMonth: DateFormatter = {
		let formatter = DateFormatter()
		formatter.timeZone = TimeZone.current
		formatter.dateFormat = "dd.MM"
		return formatter
	}()
	
	static let monthMedium: DateFormatter = {
		let formatter = DateFormatter()
		formatter.timeZone = TimeZone.current
		formatter.dateFormat = "MMMM"
		return formatter
	}()
	
	static let hour24: DateFormatter = {
		let formatter = DateFormatter()
		formatter.timeZone = TimeZone.current
		formatter.dateFormat = "HH:mm"
		return formatter
	}()
	
	static let dayMonthAndYear: DateFormatter = {
		let formatter = DateFormatter()
		formatter.timeZone = TimeZone.current
		formatter.dateFormat = "dd.MM.yyyy"
		return formatter
	}()
}

extension Date {
	
    lazy var dayAndMonth: String { return Formatter.dayAndMonth.string(from: self) }
    lazy var monthMedium: String  { return Formatter.monthMedium.string(from: self) }
    lazy var hour24:  String      { return Formatter.hour24.string(from: self) }
    lazy var allDate: String { return Formatter.dayMonthAndYear.string(from: self) }
	
}
