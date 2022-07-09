//
//  ViewController.swift
//  CandelChart
//
//  Created by A.F on 7/9/22.
//

import UIKit
import Charts

class ViewController: UIViewController, ChartViewDelegate {
    
    // MARK: - Properties
    private var backgroundColor = UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1)
    private var blueColor = UIColor(red: 0, green: 203/255, blue: 252/255, alpha: 1)
    private var redColor = UIColor(red: 1, green: 81/255, blue: 85/255, alpha: 1)
    
    // MARK: - Outlets
    @IBOutlet weak var candleChartView: CandleStickChartView!
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        setupRightAxis()
        setupXAxis()
        updateChartData()
        
    }
    
    private func setupView() {
        candleChartView.backgroundColor = backgroundColor
        candleChartView.chartDescription.enabled = false
        candleChartView.dragEnabled = true
        candleChartView.setScaleEnabled(true)
        candleChartView.pinchZoomEnabled = true
        candleChartView.legend.enabled = false
        candleChartView.xAxis.labelPosition = .bottom
    }
    
    private func setupRightAxis() {
        candleChartView.leftAxis.enabled = false
        candleChartView.rightAxis.enabled = true
        candleChartView.rightAxis.spaceTop = 0.3
        candleChartView.rightAxis.spaceBottom = 0.3
        candleChartView.rightAxis.gridLineDashLengths = [5,5]
        candleChartView.rightAxis.axisLineWidth = 0
        candleChartView.rightAxis.labelTextColor = .gray
        candleChartView.rightAxis.gridColor = .gray
    }
    
    private func setupXAxis() {
        candleChartView.xAxis.labelPosition = .bottom
        candleChartView.xAxis.gridColor = .clear
        candleChartView.xAxis.axisLineWidth = 0
        candleChartView.xAxis.labelTextColor = .gray
    }
    
    func updateChartData() {
        self.setDataCount(Int(10), range: UInt32(50), isIncreasing: false)
    }
    
    func setDataCount(_ count: Int, range: UInt32, isIncreasing: Bool) {
        let yVals1 = (0..<count).map { (i) -> CandleChartDataEntry in
                let mult = range + 1
                let val = Double(arc4random_uniform(40) + mult)
                let high = Double(arc4random_uniform(9) + 8)
                let low = Double(arc4random_uniform(9) + 8)
                let open = Double(arc4random_uniform(6) + 1)
                let close = Double(arc4random_uniform(6) + 1)
                let even = i % 2 == 0
                
                return CandleChartDataEntry(x: Double(i), shadowH: val + high, shadowL: val - low, open: even ? val + open : val - open, close: even ? val - close : val + close, icon: UIImage(named: "icon"))
        }
        
        let set1 = CandleChartDataSet(entries: yVals1, label: "Data Set")
        set1.axisDependency = .right
        set1.setColor(UIColor(white: 80/255, alpha: 1))
        set1.drawIconsEnabled = false
        set1.shadowColor = .darkGray
        set1.shadowWidth = 0.7
        set1.decreasingColor = redColor
        set1.decreasingFilled = true
        set1.increasingColor = blueColor
        set1.increasingFilled = true
        set1.neutralColor = .blue
        let data = CandleChartData(dataSet: set1)
        
        let yVals2 = (0..<count).map { (i) -> CandleChartDataEntry in
            return CandleChartDataEntry(x: Double(i + 10), shadowH: 60, shadowL: 10, open: 20, close: 50, icon: UIImage(named: "icon"))
        }
        let set2 = CandleChartDataSet(entries: yVals2, label: "Data Set")
        set2.axisDependency = .right
        set2.setColor(UIColor(white: 80/255, alpha: 1))
        set2.drawIconsEnabled = false
        set2.shadowColor = .darkGray
        set2.shadowWidth = 0.7
        set2.decreasingColor = redColor
        set2.decreasingFilled = true
        set2.increasingColor = blueColor
        set2.increasingFilled = true
        set2.neutralColor = .blue
        data.append(set2)
        
        candleChartView.data = data
    }


}

