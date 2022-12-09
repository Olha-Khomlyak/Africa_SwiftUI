//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Olha Khomlyak on 8.12.2022.
//

import SwiftUI

struct ExternalWeblinkView: View {
    
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "http://wikipedia.org")!)
                    Image(systemName: "arrow.up.right.square")
                }
            }
        }
        .padding(.bottom, 20)

    }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [Animal]  = Bundle.main.decode("animals.json")

    static var previews: some View {
        ExternalWeblinkView(animal: animals[0])
    }
}
