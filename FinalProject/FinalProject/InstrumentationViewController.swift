
import UIKit

class InstrumentationViewController: UIViewController {

    
    var grid = StandardEngine.sharedInstance.grid
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var rows: UITextField!
    @IBOutlet weak var sRows: UIStepper!
    @IBAction func stepRows(sender: AnyObject) {
        rows.text = "\(Int(sRows.value))"
        StandardEngine.sharedInstance.rows = Int(sRows.value)

        
 
    }
    @IBOutlet weak var cols: UITextField!
    @IBOutlet weak var sCols: UIStepper!
    @IBAction func stepCols(sender: AnyObject) {
        cols.text = "\(Int(sCols.value))"
        StandardEngine.sharedInstance.cols = Int(sCols.value)

    }
    @IBOutlet weak var slide: UISlider!
    @IBAction func refreshChange(sender: AnyObject) {
        StandardEngine.sharedInstance.refreshRate = Double(slide.value)
    }
    @IBAction func time(switchy: UISwitch) {
        if switchy.on{
            StandardEngine.sharedInstance.timerisSet = true
        }
        

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

