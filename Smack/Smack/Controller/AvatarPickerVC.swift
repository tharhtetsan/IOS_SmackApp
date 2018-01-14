//
//  AvatarPickerVC.swift
//  Smack
//
//  Created by ths on 1/14/18.
//  Copyright © 2018 ths. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    //MARK: Outlets
    @IBOutlet weak var SegmentControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
   
    
    //MARK : variables
    var avatarType = AvatarType.dark
    
    @IBAction func SegmentControlValueChange(_ sender: Any) {
    
        if SegmentControl.selectedSegmentIndex == 0 {
            avatarType = AvatarType.dark
        }else
        {
            avatarType = AvatarType.light
        }
        collectionView.reloadData()
    }
  
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell
        {
            cell.configureCell(index: indexPath.item, type: avatarType)
            return cell
        }
        return UICollectionViewCell()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var numOfColumns : CGFloat = 3
        if UIScreen.main.bounds.width > 320
        {
            numOfColumns = 4
        }
        let spaceBetweenCell : CGFloat = 40
        let padding :CGFloat = 10
        let cellDimension = ((collectionView.bounds.width - padding ) - (numOfColumns - 1) * spaceBetweenCell)/numOfColumns
        
        return CGSize(width : cellDimension ,height : cellDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if avatarType == .dark{
            UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
        }else
        {
            UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    @IBAction func Btn_back_Pressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
