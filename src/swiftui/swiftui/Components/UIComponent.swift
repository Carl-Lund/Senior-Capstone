//
//  UIComponent.swift
//  swiftui
//
//  Created by Carl Lund on 11/3/23.
//

import Foundation
import SwiftUI

protocol UIComponent {
    var uniqueId: String { get }
    func render() -> AnyView
}
