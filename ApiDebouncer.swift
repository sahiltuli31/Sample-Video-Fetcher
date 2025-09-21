//
//  ApiDebouncer.swift
//  Sample
//
//  Created by Sahil2 on 21/09/25.
//

import Foundation


class Debouncer{
    
    
    static let shared = Debouncer()
    var debounceTime: TimeInterval = 1.0
    
    private var currentTask: Task<Void, Never>?

    
    func debounceApiCall(api: @escaping () async -> Void){
        
       
              if currentTask != nil {
                  print("cancelling old api call")
                  currentTask?.cancel()
              }
              
              // Create new task with debounce delay
              currentTask = Task {
                 
                  try? await Task.sleep(nanoseconds: UInt64(debounceTime * 1_000_000_000))
                  
                  if Task.isCancelled {
                      print("Task was cancelled during debounce")
                      return
                  }
                  
                
                  await api()
              }
    }
}
