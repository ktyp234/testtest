//
//  savedata.swift
//  testcustom
//
//  Created by 김지훈 on 18/01/2019.
//  Copyright © 2019 KimJihun. All rights reserved.
//

import Foundation
struct savedata {
    static var shared = savedata()
    var name: String?

    private init() { }
}
