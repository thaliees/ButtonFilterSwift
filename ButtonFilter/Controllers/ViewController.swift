//
//  ViewController.swift
//  ButtonFilter
//
//  Created by Thaliees on 6/24/19.
//  Copyright © 2019 Thaliees. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var listTag: UICollectionView!
    @IBOutlet weak var content: UICollectionView!
    
    private let trailing:CGFloat = 8, leading:CGFloat = 8
    private let widthScreen:CGFloat = UIScreen.main.bounds.width
    private var tags:[String] = [String]()
    private var buttons:[UIButton] = [UIButton]()
    private var informationList:[InformationModel] = [InformationModel]()
    private var infoAux:[InformationModel] = [InformationModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Uncomment the next four lines, if you didn't implement the Delegate and DataSource from the Storyboard
        //listTag.delegate = self
        //listTag.dataSource = self
        //content.delegate = self
        //content.dataSource = self
        initTags()
        initInfo()
    }

    // MARK: Methods UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == listTag{
            return tags.count
        }
        return infoAux.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Create cell to show
        if collectionView == listTag{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as! TagCollectionViewCell
            let name:String = tags[indexPath.row]
            // Set resources
            cell.tagButton.setTitle(name.uppercased(), for: .normal)
            
            // Add to the array each button
            if !existButton(nameToValue: name.uppercased()){
                buttons.append(cell.tagButton)
            }
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "infoCell", for: indexPath) as! InformationCollectionViewCell
            // Set resources
            cell.title.text = self.infoAux[indexPath.row].title.uppercased()
            cell.date.text = self.infoAux[indexPath.row].date
            cell.descrip.text = self.infoAux[indexPath.row].description
            if self.infoAux[indexPath.row].image == "" {
                // Hide image but it doesn't take any space in layout purposes. (Function created in UIViewExtension)
                cell.image.gone(attribute: .width)
            }
            else{
                cell.image.image = UIImage(named: self.infoAux[indexPath.row].image)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == listTag{
            let length = tags[indexPath.row].count
            if length >= 7 && length < 15{
                return CGSize(width: 100, height: 40)
            }
            else if length >= 9 && length < 15 {
                return CGSize(width: 150, height: 40)
            }
            else if length >= 15 && length < 20{
                return CGSize(width: 200, height: 40)
            }
            else if length >= 20 && length < 25 {
                return CGSize(width: 270, height: 40)
            }
            else if length >= 25 {
                return CGSize(width: 300, height: 40)
            }
            
            return CGSize(width: 70, height: 40)
        }
        else{
            let result = (trailing * 2) + (leading * 2)
            return CGSize(width: widthScreen - result, height: 388)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Avoid space between cells
        if collectionView == listTag{
            return 5
        }
        return 10
    }
    
    // MARK: Methods UIButton
    @IBAction func selectedButtonAction(_ sender: UIButton) {
        // Obtain the value
        let tagToSearch:String = sender.currentTitle!
        // Is posiblle that here, you load the new info with tag indicated
        searchInfoWithTag(tag: tagToSearch)
    }
    
    // MARK: Custom Methods
    private func initTags(){
        // Initialize dataset.
        // (This data would usually come from a local content provider or remote server
        // For example, we will obtain 4 data (is possible that you use a Model)
        tags = ["ALL", "GENERAL", "MOBILE", "WEB"]
    }
    
    private func initInfo(){
        // Initialize dataset.
        // (This data would usually come from a local content provider or remote server)
        // For example, we will obtain 4 data of the InformationModel type
        var information:InformationModel = InformationModel(title: "Apple: Swift UI", date: "June 03, 2019", image: "", description: "In WWDC19 Apple announces the Swift UI beta: The Interface Builder editor within Xcode makes it simple to design a full user interface without writing any code. Simply drag and drop windows, buttons, text fields, and other objects onto the design canvas to create a functioning user interface.", tag: "MOBILE")
        informationList.append(information)
        information = InformationModel(title: "What is Flutter", date: "June 03, 2019", image: "im_flutter", description: "Here’s another Google product, but this one is applied to developing mobile Android and iOS applications, as well as creating apps for Google Fuchsia OS.\nIFlutter is absolutely JS-free as it’s written in Dart, a programming language also created by Google for developing server-side and web applications for both desktop and mobile platforms. This lets Flutter interact with the platform without passing through the JavaBridge which, in turn, allows you to work way faster than otherwise.", tag: "MOBILE")
        informationList.append(information)
        information = InformationModel(title: "Vue.js", date: "June 03, 2019", image: "im_vue_js", description: "Vue.js is one of the newer frameworks for web development which is growing in popularity very quickly. Its greatest advantage is, if you already have a product, you use Vue.js on its part and everything will function just fine. No lags, no troubles.", tag: "WEB");
        informationList.append(information)
        information = InformationModel(title: "Git 2.0", date: "June 10, 2019", image: "", description: "One of the most important changes of this release is that it has compatibility problems with previous versions or backwards. This means that there are differences in performance with respect to versions 1.x. On the other hand, the push.default is not defined ; its implicit value changes the behavior matching to simple , which means that when doing a git push without specifying a branch, only the current one will be updated (the same one that would use git pull to bring the code). However Git allows you to define in your global configuration file which one you want to use by default.", tag: "GENERAL")
        informationList.append(information)
        
        // Copy all element to infoAux (It is not neccessary if the data come from a local content provider or remote server)
        infoAux = informationList
    }
    
    func existButton(nameToValue:String) -> Bool {
        if buttons.isEmpty {
            return false
        }
        
        let total = buttons.count
        for i in 0..<total {
            if buttons[i].currentTitle! == nameToValue{
                return true
            }
        }
        return false
    }
    
    private func searchInfoWithTag(tag:String){
        // (This data would usually come from a local content provider or remote server)
        // In our case, we will obtain the data of our list initial
        // Therefore, we copy the initial data to another list (infoAux) and no lost data
        var newInfo:[InformationModel] = [InformationModel]()
        if tag.contains("ALL") {
            newInfo = informationList
        }
        else {
            for i in 0..<informationList.count {
                if informationList[i].tag.contains(tag){
                    newInfo.append(informationList[i])
                }
            }
        }
        
        // Update the information
        // Clean the list
        infoAux.removeAll()
        // Add the new elements
        infoAux = newInfo
        // Update our UICollectionView
        content.reloadData()
    }
}

