//
//  TopStories.swift
//  nytimes
//
//  Created by Mark Demmos Dowa on 11/23/21.
//

import Foundation

// MARK: - TopStories
struct TopStories: Codable {
    var status: String
    var copyright: String
    var section: String
    var lastUpdated: String
    var numResults: Int
    var stories: [Story]?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case copyright = "copyright"
        case section = "section"
        case lastUpdated = "last_updated"
        case numResults = "num_results"
        case stories = "results"
    }
}

// MARK: - Story
struct Story: Codable {
    var section: String
    var subsection: String
    var title: String
    var abstract: String
    var url: String
    var uri: String
    var byline: String
    var itemType: String
    var updatedDate: String
    var createdDate: String
    var publishedDate: String
    var materialTypeFacet: String
    var kicker: String
    var desFacet: [String]?
    var orgFacet: [String]?
    var perFacet: [String]?
    var geoFacet: [String]?
    var multimedia: [Multimedia]?
    var shortURL: String

    enum CodingKeys: String, CodingKey {
        case section = "section"
        case subsection = "subsection"
        case title = "title"
        case abstract = "abstract"
        case url = "url"
        case uri = "uri"
        case byline = "byline"
        case itemType = "item_type"
        case updatedDate = "updated_date"
        case createdDate = "created_date"
        case publishedDate = "published_date"
        case materialTypeFacet = "material_type_facet"
        case kicker = "kicker"
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case multimedia = "multimedia"
        case shortURL = "short_url"
    }
}

// MARK: - Multimedia
struct Multimedia: Codable {
    var url: String
    var format: String
    var height: Int
    var width: Int
    var type: String
    var subtype: String
    var caption: String
    var copyright: String

    enum CodingKeys: String, CodingKey {
        case url
        case format
        case height
        case width
        case type
        case subtype
        case caption
        case copyright
    }
}
