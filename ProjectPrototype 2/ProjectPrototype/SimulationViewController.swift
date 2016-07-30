
import UIKit

class SimulationViewController: UIViewController {
    
    
    @IBOutlet weak var runBtn: UIButton!
    
    
    @IBOutlet weak var gv: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //view.addSubview(gv)
        
        
    }
    
    func notificationReceived(notification:NSNotification?){
        gv.setNeedsDisplay()
        }
    
    @IBAction func runBtn(sender: AnyObject) {
        StandardEngine.sharedInstance.step()
        let n = NSNotificationCenter.defaultCenter()
        n.addObserver(self, selector: #selector(notificationReceived), name: "EngineNotification", object: nil)
        //print(StandardEngine.sharedInstance.grid.cells)
        
        
        //        var stepG = StandardEngine.sharedInstance.grid
        //        var se = StandardEngine._sharedInstance
        //        var g = se.step()
        
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

