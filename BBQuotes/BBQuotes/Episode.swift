//
//  Episode.swift
//  BBQuotes
//
//  Created by dtharpeuno on 12/31/25.
//

import Foundation

struct Episode: Decodable {
	let episode: Int
	let title: String
	let image: URL
	let synopsis: String
	let writtenBy: String
	let directedBy: String
	let airDate: String
	
	//computer prop
	var seasonEpisode: String {
		"Season \(episode/100) Episode \(episode % 100)"
	}
}
