import UIKit


@IBDesignable final class CustomRangeSeekSlider: RangeSeekSlider {

    fileprivate let prices: [Int] = [
        .min, 1948,1949,1950,1951,2019,2020, .max,
        ]

    override func setupStyle() {
        let pink: UIColor = #colorLiteral(red: 0.0000000000, green: 0.5019607843, blue: 0.0000000000, alpha: 1) // greenCSS3 #008000
        let gray: UIColor = #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1) // gray #808080
        minValue = 0.0
        maxValue = CGFloat(prices.count - 1)
        selectedMinValue = 0
        selectedMaxValue = CGFloat(prices.count - 1)
        minDistance = 1.0
        handleColor = pink
        minLabelColor = pink
        maxLabelColor = pink
        colorBetweenHandles = pink
        tintColor = gray
        numberFormatter.locale = Locale(identifier: "ja_JP")
        numberFormatter.numberStyle = .currency
        labelsFixed = true
        initialColor = gray

        delegate = self
    }

    fileprivate func priceString(value: CGFloat) -> String {
        let index: Int = Int(roundf(Float(value)))
        let price: Int = prices[index]
        if price == .min {
            return "Min"
        } else if price == .max {
            return "Max"
        } else {
            let priceString: String? = String(price) //numberFormatter.string(from: price as NSNumber)
            return priceString ?? ""
        }
    }
}


// MARK: - RangeSeekSliderDelegate
extension CustomRangeSeekSlider: RangeSeekSliderDelegate {

    func rangeSeekSlider(_ slider: RangeSeekSlider, stringForMinValue minValue: CGFloat) -> String? {
        return priceString(value: minValue)
    }

    func rangeSeekSlider(_ slider: RangeSeekSlider, stringForMaxValue maxValue: CGFloat) -> String? {
        return priceString(value: maxValue)
    }
}
