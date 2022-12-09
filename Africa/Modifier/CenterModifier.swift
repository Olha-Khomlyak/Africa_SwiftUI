//
//  CenterModifier.swift
//  Africa
//
//  Created by Olha Khomlyak on 9.12.2022.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
