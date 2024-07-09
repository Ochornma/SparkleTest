//
//  ContentView.swift
//  Sparkle
//
//  Created by Promise Ochornma on 08/07/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = HomeViewModel()
    @State var openDetailsPage = false
    @State var theFilmCharacter: FilmCharacter?
    var body: some View {
        NavigationStack{
            
            ZStack {
                Color("grey").ignoresSafeArea()
                ScrollView{
                    LazyVStack {
                        ForEach(vm.filmCharacter, id: \.id, content: {filmCharacter in
                            CharcterItemView(character: filmCharacter)
                                .onTapGesture {
                                    self.theFilmCharacter = filmCharacter
                                    openDetailsPage = true
                                }
                        })
                    }
                    .padding()
                }
                .onAppear{
                    vm.requestForCharacter(page: 0)
                }
                .navigationDestination(
                    isPresented: $openDetailsPage) {
                        if let theFilmCharacter  {
                            DetailView(filmVCharacter: theFilmCharacter)
                        }
                        
                    }
            
            }.navigationTitle("Film Characters")
                .navigationBarTitleDisplayMode(.large)
                
        }.navigationBarBackButtonHidden(false)
    }
}

#Preview {
    ContentView()
}
