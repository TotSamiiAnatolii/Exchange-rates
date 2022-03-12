//
//  ViewController.swift
//  exchange rates
//
//  Created by APPLE on 03.03.2022.
//

import UIKit

class MainViewController: UIViewController {

    let flagiArray = ["USD", "EUR", "GBP", "CNY", "CHF", "AUD", "CAD"]
    var ratesArray: RatesModelDTO?
    var data: DataModel?
    let ratesServices = RatesAPI()
    var mainView: MainView {return self.view as! MainView}
   
    override func loadView() {
        super.loadView()
        self.view = MainView(frame: UIScreen.main.bounds)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.collectionTable.delegate = self
        mainView.collectionTable.dataSource = self
        ratesServices.getRates { [weak self] rates, data  in
            guard let self = self else {return}
            self.ratesArray = rates
            self.data = data
            
            
       
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
        
                self.transformationData(ratesArray1: data)

                self.configureView(rates: (self.ratesArray?.valute["USD"]?.value)!, previous: (self.ratesArray?.valute["USD"]?.previous)!)
            }
           
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        view.backgroundColor = .white

    }
    
    func configureView(rates: Double, previous: Double) {
       
        self.mainView.ratesLabel.text = String (rates)
        
        let midllePrevious = rates - previous
        
        self.mainView.previousLabel.text = String(format: "%.3f", midllePrevious)

        if midllePrevious > 0 {
            self.mainView.previousLabel.textColor = .green
            self.mainView.imagePointer.image = UIImage(named: "green")
        }
        if midllePrevious == 0 {
            self.mainView.previousLabel.textColor = .black
        }
        if midllePrevious < 0 {
            self.mainView.previousLabel.textColor = .red
            self.mainView.imagePointer.image = UIImage(named: "red")
        }

        let difference = (rates - previous) / previous * 100
        self.mainView.differencePercent.text = "(\(String(format: "%.3f", difference))%)"
        
    }
    
    //                Data(дата на текущий курс)
    func transformationData(ratesArray1: DataModel) {
        let data = ratesArray1.date.components(separatedBy: "T").first?.components(separatedBy: "-")
        let dataArray = Array(data!.reversed())
        let finalData = dataArray[0..<dataArray.count].joined(separator: ".")
        self.mainView.descriptionLabel.text = "Курсы валют ЦБ РФ на \(finalData)"
    }
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flagiArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ValuteCell.identifier, for: indexPath) as! ValuteCell
        let nameFlag = flagiArray[indexPath.row]
        cell.configureCell(arrayFlag: nameFlag)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100 , height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nameValute = flagiArray[indexPath.row]
        let value = ratesArray?.valute[nameValute]
        configureView(rates: value?.value ?? 0 , previous: value?.previous ?? 0)
    }
}
