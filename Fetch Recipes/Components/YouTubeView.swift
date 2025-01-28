//
//  YouTubeView.swift
//  Fetch Recipes
//
//  Created by Kristhian De Oliveira on 1/28/25.
//



import SwiftUI
import WebKit

struct YouTubeView: UIViewRepresentable {
    let url: String
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let demoURL = URL(string: url) else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: demoURL))
    }
}
