//
//  SearchBar.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 5/15/20.
//  Copyright © 2020 Black Rose Productions. All rights reserved.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchTextField.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        print("SearchBar - \(#function)")
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
}

extension SearchBar {
    final class Coordinator: NSObject, UISearchBarDelegate, UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return false
        }
    }
}
