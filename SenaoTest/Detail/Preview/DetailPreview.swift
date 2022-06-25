//
//  DetailPreview.swift
//  SenaoTest
//
//  Created by 劉柏賢 on 2022/6/24.
//

import SwiftUI

struct DetailPreview: UIViewRepresentable {
    
    let view: UIView
    
    init() {
        let json: String = #"""
        {
          "data": [
            {
              "price": 39950,
              "martShortName": "iPhone 12 Pro Max 256GB",
              "imageUrl": "https://pdinfo.senao.com.tw/octopus/contents/99b404a6bcfb4a74a27e4a10746fb258.jpg",
              "finalPrice": 39950,
              "martName": "Phone 12 Pro Max 256GB【下殺97折 送保護貼兌換券】",
              "stockAvailable": 30,
              "martId": 1250797
            }
          ]
        }
        """#

        guard let model = MarketModel(json: json) else {
            let errorView = UIView()
            errorView.backgroundColor = .orange
            self.view = errorView
            return
        }

        guard let subModel = model.data.first else {
            let errorView = UIView()
            errorView.backgroundColor = .orange
            self.view = errorView
            return
        }

        
        let storyboard = UIStoryboard(name: "DetailStoryboard", bundle: Bundle.main)
        let viewController = storyboard.instantiateInitialViewController() as! (ParameterDelegate & UIViewController)
        
        let navigationParameter = DetailNavigationParameter(model: subModel)
        viewController.setParameter(navigationParameter)

        view = viewController.view
    }
    
    func makeUIView(context: Context) -> UIView {
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

struct Detail_Preview: PreviewProvider {

    static var previews: some View {
        Group {
            DetailPreview()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            
            DetailPreview()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
    }
}
