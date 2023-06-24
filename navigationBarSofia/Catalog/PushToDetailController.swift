import UIKit
extension CatalogTileView{
    
    
    @objc func pushToDetailController(){
        
        
        if let window = UIApplication.shared.delegate?.window?!.windowScene!.keyWindow {
            
            self.detailView.backgroundColor = .blue
            
            self.detailView.lable.text = self.label.text
            self.detailView.imageView.image = self.imageButton.imageView?.image
            
            
            window.addSubview(self.detailView)
            self.detailView.frame = window.frame
            self.detailView.alpha = 0
            //self.detailView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDissmis)))
            self.detailView.buttonBack.addTarget(self, action: #selector(handleDissmis), for: .touchUpInside)
            
            
            
            UIView.animate(withDuration: 0.2) {
                self.detailView.alpha = 1
            }
            
            //self.detailView.alpha = 1
            
            
        }
        
    }
    
    
    @objc func handleDissmis(){
        UIView.animate(withDuration: 0.2) {
            self.detailView.alpha = 0
        }
        
        //self.detailView.alpha = 0
        
        
        
    }
    
    
    
    
}
