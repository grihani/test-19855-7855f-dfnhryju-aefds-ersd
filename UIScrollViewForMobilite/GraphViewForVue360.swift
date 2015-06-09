//
//  GraphViewForVue360.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 19/05/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit
//@IBDesignable
class GraphViewForVue360: UIView {

    var labelsForXAxis: [String] = ["D","J","F","M","A","M","J","J","A","S","O","N","D","J"]
    
    var valueForFirstBar: [Double] = [1000,1200,50,500,300,150,500,300,150,500,500,300,150,300] {
        didSet {
            setNeedsDisplay()
        }
    }
    var valueForSecondBar: [Double] = [150,1000,1200,50,500,300,150,500,20,3000,205,85,48,85] {
        didSet {
            setNeedsDisplay()
        }
    }
    var valueForLine: [Double] = [500,1500,250,800,1200,50,500, 2400,1800,750,200,520,174,280] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var margin: CGFloat = 0
    var spacer: CGFloat = 0
    
    @IBInspectable var actualMonth: Int = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var selectedMonth: Int = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var colorForFirstBar: UIColor = UIColor(red: 142/255, green: 180/255, blue: 227/255, alpha: 1)
    @IBInspectable var colorForSecondBar: UIColor = UIColor(red: 250/255, green: 192/255, blue: 144/255, alpha: 1)
    @IBInspectable var colorForLine: UIColor = UIColor(red: 120/255, green: 146/255, blue: 60/255, alpha: 1)
    @IBInspectable var colorForActualMonth: UIColor = UIColor(red: 244/255, green: 250/255, blue: 251/255, alpha: 1)
    @IBInspectable var colorForSelectedMonth: UIColor = UIColor(red: 218/255, green: 234/255, blue: 242/255, alpha: 1)
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let width = rect.width
        let height = rect.height
        
        checkForEqualityBetweenLabelsAndLine()
        checkForEqualityBetweenLabelsAndFirstBar()
        checkForEqualityBetweenLabelsAndSecondBar()
        
        
        let margin = rect.size.width/CGFloat(labelsForXAxis.count)
        self.margin = margin
        self.spacer = (width - margin * 2) / CGFloat((self.labelsForXAxis.count - 1))
        var columnXPoint = { (column:Int) -> CGFloat in
            //Calculate gap between points
            let spacer = (width - margin * 2) / CGFloat((self.labelsForXAxis.count - 1))
            var x:CGFloat = CGFloat(column) * spacer
            x += margin - margin / 4
            return x
        }
        
        // calculate the y point
        
        let topBorder:CGFloat = 0
        let bottomBorder:CGFloat = 40
        let graphHeight = height - topBorder - bottomBorder
        
        let maxValue = calculateMaxElement(valueForFirstBar, secondBar: self.valueForSecondBar, line: valueForLine)
        
        var columnYPoint = { (valueForLine:Double) -> CGFloat in
            var y:CGFloat = CGFloat(valueForLine) /
                CGFloat(maxValue) * graphHeight
            y = graphHeight + topBorder - y // Flip the graph
            return y
        }
        
        var heightForElement = { (value: CGFloat) -> CGFloat in
            var height: CGFloat = 0 - (value - topBorder - graphHeight)
            return height
        }
        
        var graphForActualMonth = UIBezierPath(rect: CGRect(x: columnXPoint(actualMonth), y: 0, width: margin/2, height: height))
        colorForActualMonth.setFill()
        graphForActualMonth.fill()
        
        var graphForSelectedMonth = UIBezierPath(rect: CGRect(x: columnXPoint(selectedMonth), y: 0, width: margin/2, height: height))
        colorForSelectedMonth.setFill()
        graphForSelectedMonth.fill()
        
        var sumBars = [Double]()
        for i in 0..<valueForFirstBar.count {
            sumBars.append(valueForFirstBar[i] + self.valueForSecondBar[i])
        }
        let valueForSecondBar = sumBars
        
        for i in 0..<labelsForXAxis.count {
            // backgroundGraph
            var yPositionForElement = columnYPoint(valueForSecondBar[i])
            var yPoint = CGPoint(x: columnXPoint(i), y: yPositionForElement)
            var elementSize = CGSize(width: margin/2, height: heightForElement(yPositionForElement))
            var graph = UIBezierPath(rect: CGRect(origin: yPoint, size: elementSize))
            colorForSecondBar.setFill()
            graph.fill()
            // topGraph
            yPositionForElement = columnYPoint(valueForFirstBar[i])
            yPoint = CGPoint(x: columnXPoint(i), y: yPositionForElement)
            elementSize = CGSize(width: margin/2, height: heightForElement(yPositionForElement))
            graph = UIBezierPath(rect: CGRect(origin: yPoint, size: elementSize))
            colorForFirstBar.setFill()
            graph.fill()
            
            let labelsRect = CGRect(x: columnXPoint(i), y: rect.height - 20, width: margin/2, height: 20)
            let label = UILabel(frame: labelsRect)
            label.text = labelsForXAxis[i]
            label.textColor = UIColor.blackColor()
            label.textAlignment = NSTextAlignment.Center
            addSubview(label)
        }
        
        // draw the line graph
        
        colorForLine.setFill()
        colorForLine.setStroke()
        
        //set up the points line
        var graphPath = UIBezierPath()
        //go to start of line
        graphPath.moveToPoint(CGPoint(x:columnXPoint(0)+margin/4,
            y:columnYPoint(valueForLine[0])))
        
        //add points for each item in the graphPoints array
        //at the correct (x, y) for the point
        for i in 1..<valueForLine.count {
            let nextPoint = CGPoint(x:columnXPoint(i)+margin/4,
                y:columnYPoint(valueForLine[i]))
            graphPath.addLineToPoint(nextPoint)
        }
        
        graphPath.stroke()
        
    }
    
    func checkForEqualityBetweenLabelsAndLine() {
        if valueForLine.count != labelsForXAxis.count {
            if valueForLine.count > labelsForXAxis.count {
                while valueForLine.count != labelsForXAxis.count {
                    valueForLine.removeAtIndex(valueForLine.count - 1)
                }
            } else {
                while valueForLine.count != labelsForXAxis.count {
                    valueForLine.append(0)
                }
            }
        }
    }
    
    func checkForEqualityBetweenLabelsAndFirstBar() {
        if valueForFirstBar.count != labelsForXAxis.count {
            if valueForFirstBar.count > labelsForXAxis.count {
                while valueForFirstBar.count != labelsForXAxis.count {
                    valueForFirstBar.removeAtIndex(valueForFirstBar.count - 1)
                }
            } else {
                while valueForFirstBar.count != labelsForXAxis.count {
                    valueForFirstBar.append(0)
                }
            }
        }
    }
    
    func checkForEqualityBetweenLabelsAndSecondBar() {
        if valueForSecondBar.count != labelsForXAxis.count {
            if valueForSecondBar.count > labelsForXAxis.count {
                while valueForSecondBar.count != labelsForXAxis.count {
                    valueForSecondBar.removeAtIndex(valueForSecondBar.count - 1)
                }
            } else {
                while valueForSecondBar.count != labelsForXAxis.count {
                    valueForSecondBar.append(0)
                }
            }
        }
    }
    
    func calculateMaxElement(firstBar: [Double],secondBar: [Double],line: [Double]) -> Double {
        var sumBars = [Double]()
        for i in 0..<firstBar.count {
            sumBars.append(firstBar[i] + secondBar[i])
        }
        var allArrays = sumBars
        for elementOfLine in line {
            allArrays.append(elementOfLine)
        }
        return maxElement(allArrays)
    }

}
