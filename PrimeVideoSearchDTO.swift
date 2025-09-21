//
//  PrimeVideoSearchDTO.swift
//  Sample
//
//  Created by Sahil2 on 21/09/25.
//

import Foundation

// MARK: - Prime Video Search Response
struct PrimeVideoSearchResponse: Codable {
    let v: String
    let page: [Page]
}

// MARK: - Page
struct Page: Codable {
    let name: String
    let assembly: Assembly
}

// MARK: - Assembly
struct Assembly: Codable {
    let body: [Body]
}

// MARK: - Body
struct Body: Codable {
    let props: Props
}

// MARK: - Args
struct Args: Codable {
    let isCrow: Bool
    let gvlString: String?
    let requestFeatureSwitches: RequestFeatureSwitches
    let isCookieConsentApplicable: Bool
    let queryToken: String?
    let useNodePlayer: Bool
    let hasAmazonAdvertisingPublisherConsent: Bool
    let isLivePageActive: Bool
    let pageType: String
    let phrase: String
    let isElcano: Bool
    let serviceToken: String?
    let avlString: String?
    let subPageType: String
    let enableVerticalPerformantRender: Bool
}

// MARK: - RequestFeatureSwitches
struct RequestFeatureSwitches: Codable {
    let HorizontalPagination: Bool
}

// MARK: - Props
struct Props: Codable {
    let search: SearchResults?
}

// MARK: - SearchResults
struct SearchResults: Codable {
    let containers: [Container]?
}


// MARK: - Container
struct Container: Codable {

    let entities: [Entity]
}




// MARK: - ContainerItem
struct ContainerItem: Codable {
    let itemId: String
    let itemType: String
    let title: String
    let subtitle: String?
    let description: String?
    let releaseYear: String?
    let duration: String?
    let rating: ItemRating?
    let genres: [String]?
//    let images: ItemImages?
//    let availability: ItemAvailability?
//    let badges: [ItemBadge]?
//    let metadata: ItemMetadata?
//    let actions: [ItemAction]?
//    let playbackInfo: PlaybackInfo?
}

// MARK: - ItemRating
struct ItemRating: Codable {
    let value: String?
    let scale: String?
    let source: String?
    let contentRating: String?
}


// MARK: - Entity
struct Entity: Codable {
    let impressionId: String?
    let entityType: String?
    let refMarker: String?
    let releaseYear: String?
    let synopsis: String?
    let widgetType: String?
    let title: String?
    let degradations: [String]?
    let images: EntityImages?
    let titleID: String?
    let displayTitle: String?
    let runtime: String?
    let contentMaturityRating: ContentMaturityRating?
    let maturityRatingBadge: MaturityRatingBadge?
}


// MARK: - EntityImages
struct EntityImages: Codable {
    let cover: CoverImage?
}

// MARK: - CoverImage
struct CoverImage: Codable {
    let url: String?
}


// MARK: - ContentMaturityRating
struct ContentMaturityRating: Codable {
    let locale: String?
    let title: String?
    let rating: String?
}

// MARK: - MaturityRatingBadge
struct MaturityRatingBadge: Codable {
    let __type: String?
    let countryCode: String?
    let id: String?
    let description: String?
    let displayText: String?
}
