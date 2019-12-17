//
//  ContentView.swift
//  ListAppUI
//
//  Created by José Javier Cueto Mejía on 16/12/19.
//  Copyright © 2019 José Javier Cueto Mejía. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let countryList:[Country] = [
        Country(id: 0, name: "Mozambique", population: 2634),
        Country(id: 1, name: "Mexico", population: 5234),
        Country(id: 2, name: "EUA", population: 1234),
        Country(id: 3, name: "Brazil", population: 2334),
        Country(id: 4, name: "Canada", population: 2344)
    ]
    var names = ["javier","jose","maria","karina","nathalie","nath"]
    var body: some View {
        NavigationView {
            List(self.countryList, id:\.id) { country in
                NavigationLink(destination: Destiny(country: country)){
                    CellRow(country: country)
                }.navigationBarTitle("Paises en el mundo")
                
            }
        }
    }
}


struct Destiny:View {
    let country: Country
    var body: some View{
        Text("\(country.name) is population \(country.population)")
    }
}

struct Country{
    let id: Int
    let name: String
    let population: Int
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CellRow: View {
    let country: Country
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(country.name)
                .font(.title)
                .foregroundColor(.gray)
            Text("Pop: \(country.population)")
                .italic()
                .font(.headline)
                .foregroundColor(.pink)
        }
    }
}
