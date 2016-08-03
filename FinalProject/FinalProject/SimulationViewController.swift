
import UIKit

class SimulationViewController: UIViewController, EngineDelegate{
    
    @IBOutlet weak var gridview: GridView!

    @IBAction func save(sender: AnyObject) {
        notifyTable()
        
    }
    @IBAction func reset(sender: AnyObject) {
        let emptyGrid = Grid(20, 20)
        StandardEngine.sharedInstance.grid = emptyGrid
        gridview.setNeedsDisplay()
        NSNotificationCenter.defaultCenter().postNotificationName("ResetNotification",
                                                                  
                                                                  object: nil,
                                                                  userInfo: ["grid": emptyGrid ])
    }

    var grid: EngineProtocol!
    
    @IBOutlet weak var runBtn: UIButton!
    
    func notifyTable() {
        let saveGrid = StandardEngine.sharedInstance.grid
        NSNotificationCenter.defaultCenter().postNotificationName("TableNotification",
                                                                  
                                                                  object: nil,
                                                                  userInfo: ["grid": saveGrid as! Grid])
    }
    
    
    func timerNotification(notification:NSNotification?){
        StandardEngine.sharedInstance.step()
        //gridview.setNeedsDisplay()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        grid = StandardEngine.sharedInstance
        grid.delegate = self
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(timerNotification), name: "timeNotification", object: nil)
        
    }
    
    func engineDidUpdate(withGrid: GridProtocol) {
        gridview.setNeedsDisplay()
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

