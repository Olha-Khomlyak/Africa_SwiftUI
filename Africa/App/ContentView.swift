//
//  ContentView.swift
//  Africa
//
//  Created by Olha Khomlyak on 8.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive:Bool = false
    
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 1)
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var gridIcon: String = "square.grid.2x2"
    
    
    //MARK: - FUNCTIONS
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number:" , gridColumn)
        switch gridColumn {
        case 1:
            gridIcon = "square.grid.2x2"
        case 2:
            gridIcon = "square.grid.3x2"
        case 3:
            gridIcon = "rectangle.grid.1x2"
        default:
            gridIcon = "square.grid.2x2"
        }
    }
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            Group{
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink {
                                AnimalDetailView(animal: animal)
                            } label: {
                                AnimalListItemView(animal: animal)
                            }
                            
                        }
                        CreditsView()
                            .modifier(CenterModifier())
                    }//: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals){ animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }//: LINK
                            }//: LOOP
                        }//: GRID
                        .padding(10)
                        .animation(.easeIn, value: UUID())
                    }//: SCROLL
                }//: CONDITION
            }//: GROUP
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing:16){
                        // LIST
                        Button(action: {
                            haptics.impactOccurred()
                            isGridViewActive = false
                        }){
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        // GRID
                        Button(action: {
                            haptics.impactOccurred()
                            isGridViewActive = true
                            gridSwitch()
                            
                        }){
                            Image(systemName: gridIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        }//: NAVIGATION
        .listStyle(PlainListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

