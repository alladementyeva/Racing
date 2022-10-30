//
//  ChangeCarCollectionViewController.swift
//  Race
//
//  Created by user on 18.10.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

var userCarImage: String = "sedan_blue"

class ChangeCarCollectionViewController: UICollectionViewController {

    let cars = ["sedan_blue", "sedan_purple", "sedan_red", "sport_car"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return the number of items
        return cars.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> ChangeCarCollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ChangeCarCollectionViewCell
        
        // Configure the cell
        let imageName = cars[indexPath.item]
        let image = UIImage(named: imageName)
        
        cell.carPicture.image = image
        cell.carPicture.contentMode = .scaleAspectFit
        
        if cars[indexPath.item] == userCarImage {
            cell.backgroundColor = UIColor(named:"Grey")
        }
            
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
    
        // remove selection from all cells
        for item in 0..<collectionView.numberOfItems(inSection: 0){
            collectionView.cellForItem(at: IndexPath(row:item, section:0))?.backgroundColor = UIColor(named:"SpaceGrey")
        }
                          
        // select the selected cell
        collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor(named:"Grey")
        
        // save the selection in global var
        userCarImage = cars[indexPath.item]
        
        // for debug:
        let alert = UIAlertController(title: "Car change", message: "Car changed", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
        return true
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

 
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
 

}
