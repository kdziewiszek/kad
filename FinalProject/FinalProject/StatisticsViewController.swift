
import UIKit

class StatisticsViewController: UIViewController {

    var statGrid: GridProtocol{
        get{
            return StandardEngine.sharedInstance.grid
        }
        set{
            StandardEngine.sharedInstance.grid = statGrid
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let n = NSNotificationCenter.defaultCenter()
        n.addObserver(self, selector: #selector(notificationReceived), name: "EngineNotification", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(resetNotification), name: "ResetNotification", object: nil)

    }
    func resetNotification(notification:NSNotification?){
        self.living.text = "0"
        self.dead.text = "0"
        self.alive.text = "0"
        self.born.text = "0"
        self.died.text = "0"
        self.empty.text = "\(statGrid.empty)"
    }
   
    func notificationReceived(notification:NSNotification?){
        self.living.text = "\(statGrid.living)"
        self.dead.text = "\(statGrid.dead)"
        self.alive.text = "\(statGrid.alive)"
        self.born.text = "\(statGrid.born)"
        self.died.text = "\(statGrid.died)"
        self.empty.text = "\(statGrid.empty)"
        
    }
    
    @IBOutlet weak var living: UILabel!
    @IBOutlet weak var dead: UILabel!
    @IBOutlet weak var alive: UILabel!
    @IBOutlet weak var born: UILabel!
    @IBOutlet weak var died: UILabel!
    @IBOutlet weak var empty: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
