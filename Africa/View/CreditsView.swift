//
//  CreditsView.swift
//  Africa
//
//  Created by Olha Khomlyak on 9.12.2022.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack{
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
Copyrights © Olha Khomlyak
All right reserved
Better Apps ♡ Less Code
""")
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}

