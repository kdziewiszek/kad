
import UIKit

class SimulationViewController: UIViewController {
    
    @IBOutlet weak var gridview: GridView!
    
    @IBOutlet weak var runBtn: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func notificationReceived(notification:NSNotification?){
        gridview.setNeedsDisplay()
        }
    
    @IBAction func RunBtn(sender: AnyObject) {
        StandardEngine.sharedInstance.step()
        let n = NSNotificationCenter.defaultCenter()
        n.addObserver(self, selector: #selector(notificationReceived), name: "EngineNotification", object: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

