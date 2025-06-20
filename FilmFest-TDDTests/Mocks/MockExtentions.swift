//
//  MockExtentions.swift
//  FilmFest-TDDTests
//
//  Created by Lahiru Neranjan on 2025-06-20.
//

import Foundation
import UIKit

@testable import FilmFest_TDD

extension MovieLibraryDataServiceTests{
    
    class TableViewMock:UITableView{
        var cellDequeuedProperly = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
}
