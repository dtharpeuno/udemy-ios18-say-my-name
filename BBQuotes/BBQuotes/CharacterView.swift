//
//  CharacterView.swift
//  BBQuotes
//
//  Created by dtharpeuno on 12/27/25.
//

import SwiftUI

struct CharacterView: View {
	let character: Char
	let show: String
	
	var body: some View {
		GeometryReader { geo in
			ScrollViewReader { proxy in
				ZStack(alignment: .top) {
					Image(show.removeCaseAndSpace())
					.resizable()
					.scaledToFit()
					
					ScrollView {
						
						TabView {
							ForEach(character.images, id: \.self){
								characterImageURL in
								AsyncImage(url: characterImageURL) {
									image in
									image.resizable()
										.scaledToFit()
								} placeholder: {
									ProgressView()
								}
							}
						}.tabViewStyle(.page)
							.frame(width: geo.size.width/1.2, height: geo.size.height/1.7)
							.clipShape(.rect(cornerRadius: 40))
							.padding(.top, 60)
						
						
						VStack(alignment: .leading) {
							Text(character.name)
							
							Text("Portrayed By \(character.portrayedBy)")
								.font(.subheadline)
							
							Divider()
							
							Text("\(character.name) Character Info")
								.font(.title2)
							
							Text("Born: \(character.birthday)")
							
							Divider()
							
							Text("Occupations:")
							
							ForEach(character.occupations, id: \.self) {
								occupation in
								Text("* \(occupation)")
									.font(.subheadline)
							}
							
							Divider()
							
							Text("Nicknames:")
							
							if character.aliases.count > 0 {
								ForEach(character.aliases, id: \.self) {
									alias in
									Text("* \(alias)")
										.font(.subheadline)
								}
								
							} else {
								Text("None")
									.font(.subheadline)
							}
							
							Divider()
							
							DisclosureGroup("Status (spolier alert)") {
								VStack(alignment: .leading) {
									Text(character.status)
										.font(.title2)
									
									if let death = character.death {
										AsyncImage(url: death.image) {
											image in
											image.resizable()
												.scaledToFit()
												.clipShape(.rect(cornerRadius: 15))
												.onAppear{
													withAnimation{
														proxy.scrollTo(1, anchor: .bottom)
													}
												}
										} placeholder: {
											ProgressView()
										}
										
										Text("How: \(death.details)")
											.padding(.bottom, 7)
										Text("Last Words: \(death.lastWords)")
									}
								}
								.frame(maxWidth: .infinity, alignment: .leading)
							}
							.tint(.primary)
							
						}
						.frame(width: geo.size.width/1.2, alignment: .leading)
						.padding(30)
						.id(1)
					}
					.scrollIndicators(.hidden)
				}
			}
		}
		.ignoresSafeArea()
	}
}

#Preview {
	CharacterView(character: ViewModel().character, show: Constants.bbName)
		.preferredColorScheme(.dark)
}
