//
//  File.swift
//  GotITApp
//
//  Created by Albert Ahmadiev on 15.07.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import Foundation

protocol CellsUpdateProtocol {
    func reloadData()
}

protocol CellsDelegate: AnyObject{
    func updateData()
    func manager() -> DataManager
}
