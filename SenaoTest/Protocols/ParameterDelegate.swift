//
//  ParameterDelegate.swift
//  SenaoTest
//
//  Created by 劉柏賢 on 2022/6/24.
//

import Foundation

protocol ParameterDelegate: AnyObject {
    func getParameter() -> Any?
    func setParameter(_ value: Any?)
}
