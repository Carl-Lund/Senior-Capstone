//
//  View+Extentions.swift
//  swiftui
//
//  Created by Carl Lund on 11/3/23.
//

import Foundation
import SwiftUI

extension View {
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}
