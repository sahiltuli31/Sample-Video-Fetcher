//
//  ContentView.swift
//  Sample
//
//  Created by Sahil2 on 21/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var songIdOrName: String = ""
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        
        
        VStack {
            
            
            Text("Amazon Prime Video Search")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            HStack {
                
                Text("Enter the Movie Id/Name:")
                TextField(text: $songIdOrName){
                    Text("Enter here")
                }
                .padding(8)
                .overlay{
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                }
                
                
                
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(songIdOrName.isEmpty ? .gray : .blue)
                    .frame(width: 40, height: 40)
                    .overlay(
                        Circle()
                            .fill(Color.gray.opacity(0.1))
                            .frame(width: 45, height: 45)
                    )
                    .onTapGesture {
                        if !songIdOrName.isEmpty {
                            Task {
                                await viewModel.fetchData(songIdOrName)
                            }
                        }
                    }
            }
            .padding()
            
            if viewModel.isLoading == true{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
            }
            else{
                if let trackData = viewModel.movieData {
                    VStack(alignment: .leading, spacing: 12) {
                       
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Title:")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            Text(trackData.displayTitle ?? songIdOrName)
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                       
                        if let releaseYear = trackData.releaseYear, !releaseYear.isEmpty {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Release Year:")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                Text(releaseYear)
                                    .font(.body)
                            }
                        }
                        
                        
                        if let synopsis = trackData.synopsis, !synopsis.isEmpty {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Synopsis:")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                Text(synopsis)
                                    .font(.body)
                                    .lineLimit(nil)
                                    .multilineTextAlignment(.leading)
                            }
                        }
 
                        
                       
                        if let imageUrl = trackData.images?.cover?.url, !imageUrl.isEmpty {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Cover Image URL:")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                Text(imageUrl)
                                    .font(.caption)
                                    .foregroundColor(.red)
                                    .lineLimit(3)
                            }
                        }
                        
                        if let maturityRating = trackData.contentMaturityRating?.rating {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Maturity Rating:")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                Text(maturityRating)
                                    .font(.caption)
                                    .foregroundColor(.orange)
                            }
                        }
                        
                        if let runTime = trackData.runtime {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Total Runtime:")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                Text(runTime)
                                    .font(.caption)
                                    .foregroundColor(.orange)
                            }
                        }
                    }
                    .padding()
                }else{
                    Text(viewModel.text)
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
            }
            
           
            Spacer()
           
        }
        .onChange(of: songIdOrName) { newValue in
            Task{
                await viewModel.fetchData(songIdOrName)
            }
        }
        
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel())
}
