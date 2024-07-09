//
//  DetailView.swift
//  Sparkle
//
//  Created by Promise Ochornma on 09/07/2024.
//

import SwiftUI
import Kingfisher
import SparkleDateFormatter

struct DetailView: View {
    var filmVCharacter: FilmCharacter
    var body: some View {
        ZStack {
            Color("grey").ignoresSafeArea()
            ScrollView{
                VStack(spacing: 20) {
                    KFImage.url(URL(string: filmVCharacter.avatar))
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(15)
                    HStack {
                        Text("Name")
                            .font(.system(size: 12).weight(.regular))
                        .foregroundColor(.black)
                        Spacer()
                        Text(filmVCharacter.name)
                            .font(.system(size: 14).weight(.semibold))
                        .foregroundColor(.black)
                    }
                    HStack {
                        Text("Type")
                            .font(.system(size: 12).weight(.regular))
                        .foregroundColor(.black)
                        Spacer()
                        Text(filmVCharacter.type)
                            .font(.system(size: 14).weight(.semibold))
                        .foregroundColor(.black)
                    }
                    HStack {
                        Text("Gender")
                            .font(.system(size: 12).weight(.regular))
                        .foregroundColor(.black)
                        Spacer()
                        Text(filmVCharacter.gender)
                            .font(.system(size: 14).weight(.semibold))
                        .foregroundColor(.black)
                    }
                    HStack {
                        Text("Species")
                            .font(.system(size: 12).weight(.regular))
                        .foregroundColor(.black)
                        Spacer()
                        Text(filmVCharacter.species)
                            .font(.system(size: 14).weight(.semibold))
                        .foregroundColor(.black)
                    }
                    HStack {
                        Text("Location")
                            .font(.system(size: 12).weight(.regular))
                        .foregroundColor(.black)
                        Spacer()
                        Text(filmVCharacter.location)
                            .font(.system(size: 14).weight(.semibold))
                        .foregroundColor(.black)
                    }
                    HStack {
                        Text("Origin")
                            .font(.system(size: 12).weight(.regular))
                        .foregroundColor(.black)
                        Spacer()
                        Text(filmVCharacter.origin)
                            .font(.system(size: 14).weight(.semibold))
                        .foregroundColor(.black)
                    }
                    HStack {
                        Text("Episodes")
                            .font(.system(size: 12).weight(.regular))
                        .foregroundColor(.black)
                        Spacer()
                        Text(filmVCharacter.episodes)
                            .font(.system(size: 14).weight(.semibold))
                        .foregroundColor(.black)
                    }
                    HStack {
                        Text("Date")
                            .font(.system(size: 12).weight(.regular))
                        .foregroundColor(.black)
                        Spacer()
                        Text(filmVCharacter.date)
                            .font(.system(size: 14).weight(.semibold))
                        .foregroundColor(.black)
                    }
                }
                .padding(.init(top: 16, leading: 24, bottom: 16, trailing: 24))
            }
            
        
        }.navigationTitle(filmVCharacter.name)
            .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    DetailView(filmVCharacter: .init(data: .init(id: 2, name: "sdscc", status: .alive, species: .human, type: "dkdjd", gender: .female, origin: .init(name: "ssks", url: "lsls"), location: .init(name: "sjsjs", url: "ssms"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: [], url: "ssms", created: "2017-11-04T18:48:46.250Z")))
}
