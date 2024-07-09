//
//  CharcterItemView.swift
//  Sparkle
//
//  Created by Promise Ochornma on 09/07/2024.
//

import SwiftUI
import Kingfisher

struct CharcterItemView: View {
    let character: FilmCharacter
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8.0, style: .continuous)
                .fill(.white)
                .shadow(color: .black.opacity(0.10), radius: 8)
            HStack(alignment: .center, spacing: 10){
                KFImage.url(URL(string: character.avatar))
                    .resizable()
                    .frame(width: 30, height: 30)
                    .cornerRadius(15)
                VStack(alignment: .leading){
                    Text(character.name)
                        .font(.system(size: 10).weight(.bold))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text(character.episodes)
                        .font(.system(size: 10).weight(.regular))
                        .foregroundColor(.black)
                    
                }
                
                Spacer()
                
                VStack(alignment: .trailing){
                    Text(character.gender)
                        .font(.system(size: 10).weight(.bold))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text(character.species)
                        .font(.system(size: 10).weight(.regular))
                        .foregroundColor(.black)
                    
                }
                
            
               
            }.padding(.horizontal, 16)
                .padding(.vertical, 10)
            
            
        }.frame(height: 50)
           
    }

}

#Preview {
    CharcterItemView(character: FilmCharacter(data: .init(id: 1, name: "ssss", status: .alive, species: .human, type: "ddd", gender: .female, origin: .init(name: "eaaa", url: "ddddd"), location: .init(name: "sdddd", url: "ddddd"), image: "https://rickandmortyapi.com/api/character/avatar/20.jpeg", episode: ["",""], url: "smss", created: "2017-11-04T22:34:53.659Z")))
}
