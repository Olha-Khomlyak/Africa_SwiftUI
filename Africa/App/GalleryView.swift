//
//  GalleryView.swift
//  Africa
//
//  Created by Olha Khomlyak on 7.12.2022.
//

import SwiftUI

struct GalleryView: View {
    
    //MARK: - PROPERTIES
    
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let hapticInpact = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: - GRID LAYOUTS
    
    //SIMPLE GRID LAYOUT
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//
//    ]
    //EFFECTIVE GRID DEFENITION
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DYNAMIC GRID LAYOUT
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    //MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 30){
                //MARK: - MAIN IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white, lineWidth: 8))
                //MARK: - SLIDER
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { _ in
                        gridSwitch()
                    }
                
                
                //MARK: - GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white, lineWidth: 1))
                            .onTapGesture {
                                hapticInpact.impactOccurred()
                                selectedAnimal = animal.image
                            }
                    }
                }//: GRID
                .onAppear{
                    gridSwitch()
                }
                .animation(.easeIn, value: UUID())
            }//: VSTACK
            .padding(.horizontal,10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
      
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
