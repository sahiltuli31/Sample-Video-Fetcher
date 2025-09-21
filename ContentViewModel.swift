//
//  ContentViewModel.swift
//  Sample
//
//  Created by Sahil2 on 21/09/25.
//

import Foundation


class ContentViewModel: ObservableObject {
    
    
    @Published var text: String = "Type Something To Search"
    @Published var isLoading: Bool = false
    @Published var movieData: Entity? = nil
   
    func fetchData(_ Id: String) async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        do{
           
            Debouncer.shared.debounceApiCall {
                    let result = await NetworkManager.shared.fetchDataForId(Id: Id)
                    DispatchQueue.main.async {
                        if result != nil{
                            self.movieData = result?.page.first?.assembly.body.first?.props.search?.containers?.first?.entities.first
                            self.isLoading = false
                        }else {
                            self.text = "No Data Found"
                            self.isLoading = false
                        }
                    }
                   
                }
          
           
        }
        
    }
    
}
