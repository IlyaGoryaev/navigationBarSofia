
import UIKit


class SettingsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let headerView = SettingsHeaderView()
    
    let bottomView = SettingsBottomView()
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        
        
        AppDelegate.defaults.set(0, forKey: "isScroll")
        
        tabBarController?.tabBar.backgroundColor = .systemGray6
        
        title = "Настройки"
        
        navigationController?.navigationBar.backgroundColor = .systemGray6
        
        collectionView.register(SettingsFAQCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView.showsHorizontalScrollIndicator = false
        
        headerView.faqButton.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 18)
        
        headerView.callButton.titleLabel?.font = UIFont(name: "Inter", size: 18)
        
        headerView.callButton.setTitleColor(.lightGray, for: .normal)
        
        headerView.faqButton.addTarget(self, action: #selector(tappedFAQButton), for: .touchUpInside)
        
        headerView.callButton.addTarget(self, action: #selector(tappedCallButton), for: .touchUpInside)
        
        
        style()
        
        layouT()
        
        bottomView.button1.addTarget(self, action: #selector(tappedButton1), for: .touchUpInside)
        
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
        
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
            
        }
        collectionView.isPagingEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    @objc func tappedButton1(){
        
        let controller = UIViewController()
        controller.view.backgroundColor = .brown
        
        navigationController?.pushViewController(controller, animated: true)
        
        
    }
    
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as? SettingsFAQCell{
            
            cell.firstQ.addTarget(self, action: #selector(tappedFirstQ), for: .touchUpInside)
            
            
            return cell
        }
        return UICollectionViewCell()
        
    }
    
    @objc func tappedFirstQ(){
        
        let controller = UIViewController()
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        controller.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            
            button.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor)
        
        ])
        button.setTitle("Back", for: .normal)
        
        button.addTarget(self, action: #selector(controllerDissmis), for: .touchUpInside)
        
        controller.view.backgroundColor = .red
        controller.modalPresentationStyle = .currentContext
        
        present(controller, animated: true)
        
    }
    
    @objc func controllerDissmis(){
        
        dismiss(animated: true)
        
    }
    
    @objc func tappedFAQButton(){
        
        collectionView.isPagingEnabled = false
        scrollToMenuIndex(menuIndex: 0)
        collectionView.isPagingEnabled = true
        
        UIView.animate(withDuration: 0.3) {
            self.headerView.layoutIfNeeded()
        }
        
        
    }
    
    @objc func tappedCallButton(){
        
        collectionView.isPagingEnabled = false
        scrollToMenuIndex(menuIndex: 1)
        collectionView.isPagingEnabled = true
        
        UIView.animate(withDuration: 0.3) {
            self.headerView.layoutIfNeeded()
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSizeMake(view.frame.width, view.frame.height - headerView.frame.height - (tabBarController?.tabBar.frame.height)! - bottomView.frame.height - navigationController!.navigationBar.frame.height - 96)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.x > 1){
            AppDelegate.defaults.set(1, forKey: "isScroll")
        }
        if (scrollView.contentOffset.x < 280) && (scrollView.contentOffset.x > 1){
            headerView.redLineLeadingConstraint?.constant = 18
            headerView.redLineWidthConstraint?.constant = 40
            headerView.faqButton.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 18)
            headerView.faqButton.setTitleColor(.label, for: .normal)
            headerView.callButton.setTitleColor(.lightGray, for: .normal)
            headerView.callButton.titleLabel?.font = UIFont(name: "Inter", size: 18)
        }
        
        if scrollView.contentOffset.x > 280{
            
            headerView.redLineLeadingConstraint?.constant = 118
            headerView.redLineWidthConstraint?.constant = 132
            headerView.callButton.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 18)
            headerView.callButton.setTitleColor(.label, for: .normal)
            headerView.faqButton.setTitleColor(.lightGray, for: .normal)
            headerView.faqButton.titleLabel?.font = UIFont(name: "Inter", size: 18)
            
        }
        if AppDelegate.defaults.value(forKey: "isScroll") as! Int == 1 {
            UIView.animate(withDuration: 0.4) {
                self.headerView.layoutIfNeeded()
            }
        }
    }
    
    func scrollToMenuIndex(menuIndex: Int){
        
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
        
    }
    
    
    
}
extension SettingsViewController{
    
    
    func style(){
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func layouT(){
        
        view.addSubview(headerView)
        view.addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            headerView.widthAnchor.constraint(equalToConstant: view.frame.width),
            headerView.heightAnchor.constraint(equalToConstant: 46),
            
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            
            bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 410)
        
        
        ])
        
    }
}

