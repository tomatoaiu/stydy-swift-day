//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//: Playground - noun: a place where people can play

struct RowBaseSpreadSheet {
	
	enum Row {
		case header(title: String)
		case row(Any)
	}
	
	var rows: Array<Row> = []
	
	mutating func insert(_ row: Row) {
		rows.append(row)
	}
	
	mutating func remove (_ row: Row) -> Int? {
		
		guard let index = rows.index(of: row) else {
			return nil
		}
		
		rows.remove(at: index)
		return index
	}
	
	mutating func remove (at row: Int) -> Int? {
		
		guard rows.indices.contains(row) else {
			return nil
		}
		
		rows.remove(at: row)
		return row
	}
}

extension RowBaseSpreadSheet.Row : Equatable {
	static func == (lhs: RowBaseSpreadSheet.Row, rhs: RowBaseSpreadSheet.Row) -> Bool {
		switch (lhs, rhs) {
		case let (.header(lTitle), .header(rTitle)):
			return lTitle == rTitle
		case (.row, .row):
			return true
		default:
			return false
		}
	}
}

var spreadSheet = RowBaseSpreadSheet()
spreadSheet.insert(.header(title: "A"))
spreadSheet.insert(.header(title: "A"))
spreadSheet.insert(.header(title: "A"))
spreadSheet.insert(.header(title: "A"))
spreadSheet.remove(at: 3)

spreadSheet.remove(.header(title: "A"))
spreadSheet.remove(.header(title: "1"))

