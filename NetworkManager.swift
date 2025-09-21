//
//  NetworkManager.swift
//  Sample
//
//  Created by Sahil2 on 21/09/25.
//

import Foundation


class NetworkManager{
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchDataForId(Id: String) async -> PrimeVideoSearchResponse? {
       
        
       
        let baseUrl = "https://www.primevideo.com/search/ref=atv_nb_sug"
        var urlComponents = URLComponents(string: baseUrl)
        urlComponents?.queryItems = [
            URLQueryItem(name: "ie", value: "UTF8"),
            URLQueryItem(name: "phrase", value: Id),
            URLQueryItem(name: "dvWebSPAClientVersion", value: "1.0.111788.0")
        ]
        
        guard let url = urlComponents?.url else {
            return nil
        }
        
        do {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            //  hardcoded headers 
            request.setValue("\"macOS\"", forHTTPHeaderField: "sec-ch-ua-platform")
            request.setValue("867", forHTTPHeaderField: "viewport-width")
            request.setValue("8", forHTTPHeaderField: "device-memory")
            request.setValue("\"Chromium\";v=\"140\", \"Not=A?Brand\";v=\"24\", \"Google Chrome\";v=\"140\"", forHTTPHeaderField: "sec-ch-ua")
            request.setValue("2", forHTTPHeaderField: "sec-ch-dpr")
            request.setValue("?0", forHTTPHeaderField: "sec-ch-ua-mobile")
            request.setValue("WebSPA", forHTTPHeaderField: "x-requested-with")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("867", forHTTPHeaderField: "sec-ch-viewport-width")
            request.setValue("10", forHTTPHeaderField: "downlink")
            request.setValue("4g", forHTTPHeaderField: "ect")
            request.setValue("https://www.primevideo.com/search/ref=atv_nb_sug?ie=UTF8&phrase=avengers", forHTTPHeaderField: "Referer")
            request.setValue("8", forHTTPHeaderField: "sec-ch-device-memory")
            request.setValue("58.999", forHTTPHeaderField: "X-Amzn-Client-TTL-Seconds")
            request.setValue("navigation", forHTTPHeaderField: "x-purpose")
            request.setValue("2", forHTTPHeaderField: "dpr")
            request.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36", forHTTPHeaderField: "User-Agent")
            request.setValue("50", forHTTPHeaderField: "rtt")
            request.setValue("\"15.1.1\"", forHTTPHeaderField: "sec-ch-ua-platform-version")
            request.setValue("i18n-prefs=USD; lc-main-av=en_US; session-id=261-4692638-3127722; session-id-time=2082787201l", forHTTPHeaderField: "Cookie")
            
            let (data, response) = try await URLSession.shared.data(for: request)

            do {
                let decoder = JSONDecoder()
                let searchResponse = try decoder.decode(PrimeVideoSearchResponse.self, from: data)
                
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                return searchResponse
                
            } catch {
                print("JSON Decoding error: \(error)")
                if let responseString = String(data: data, encoding: .utf8) {
                    return nil
                } else {
                    return nil
                }
            }
            
        } catch {
            print("Network error: \(error)")
            return nil
        }
    }
}
