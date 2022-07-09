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
    private var data = CandleChartData()
    private var sliderXValue: Float = 15
    private var sliderYValue: Float = 50
    
    // MARK: - Outlets
    @IBOutlet weak var candleChartView: CandleStickChartView!
    @IBOutlet weak var zoomInButton: UIButton!
    @IBOutlet weak var zoomOutButton: UIButton!
    
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
        zoomInButton.layer.cornerRadius = 2
        zoomOutButton.layer.cornerRadius = 2
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
    
    private func updateChartData() {
      
        let entry1 = CandleChartDataEntry(x: Double(5), shadowH: 60, shadowL: 10, open: 20, close: 50, icon: UIImage(named: "down-arrow"))
        let entry2 = CandleChartDataEntry(x: Double(10), shadowH: 70, shadowL: 20, open: 30, close: 60, icon: UIImage(named: "down-arrow"))
        
      
        let entry3 = CandleChartDataEntry(x: Double(15), shadowH: 10, shadowL: 60, open: 50, close: 20, icon: UIImage(named: "up-arrow"))
        let entry4 = CandleChartDataEntry(x: Double(20), shadowH: 20, shadowL: 70, open: 60, close: 30, icon: UIImage(named: "up-arrow"))
        
        addCurrencyEntry([entry1, entry2])
        addCurrencyEntry([entry3, entry4])
    }
    
    private func addCurrencyEntry(_ entries: [CandleChartDataEntry]) {
        let set = CandleChartDataSet(entries: entries, label: "")
        set.axisDependency = .right
        set.setColor(UIColor(white: 80/255, alpha: 1))
        set.drawIconsEnabled = false
        set.shadowColor = .darkGray
        set.shadowWidth = 0.7
        set.decreasingColor = redColor
        set.decreasingFilled = true
        set.increasingColor = blueColor
        set.increasingFilled = true
        set.neutralColor = .blue
        set.valueTextColor = .clear
        set.drawIconsEnabled = true 
        data.append(set)
        candleChartView.data = data
    }

    @IBAction func didPressZoomIn(_ sender: Any) {
        candleChartView.zoomIn()
    }
    
    @IBAction func didPressZoomOut(_ sender: Any) {
        candleChartView.zoomOut()
    }
    
    
}

