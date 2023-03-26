import UIKit

class RecallViewController: UIViewController {
    
    var currentMemory: Memory?
    var topView: UIView!
    var memoryView: UIView!
    var infoView: UIView!
    var topLabel: UILabel!
    var forgotButton: UIButton!
    var showBackButton: UIButton!
    var recalledButton: UIButton!
    
    var frontFacing: Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentMemory = Memory(id: 1, col_id: 1, type: .simple)
        currentMemory?.front_text = "Front text!!!!!!"
        currentMemory?.back_text = "Back text!!!!!!"
        frontFacing = true
        
        updateUI()
    }
    
    override func loadView() {
        super.loadView()
        
        topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topView)
        topLabel = UILabel()
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.text = "This is a long text that should auto resize"
        topLabel.numberOfLines = 0
        topLabel.lineBreakMode = .byWordWrapping
        topLabel.textAlignment = .center
        topLabel.adjustsFontSizeToFitWidth = true
        topLabel.minimumScaleFactor = 0.5
        topView.addSubview(topLabel)
                
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        view.addSubview(stackView)
        forgotButton = UIButton()
        forgotButton.setTitle("Forgot", for: .normal)
        forgotButton.backgroundColor = .red
        forgotButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        showBackButton = UIButton()
        showBackButton.setTitle("Show back", for: .normal)
        showBackButton.backgroundColor = .blue
        showBackButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        recalledButton = UIButton()
        recalledButton.setTitle("Recalled", for: .normal)
        recalledButton.backgroundColor = .green
        recalledButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        stackView.addArrangedSubview(forgotButton)
        stackView.addArrangedSubview(showBackButton)
        stackView.addArrangedSubview(recalledButton)
        view.bringSubviewToFront(stackView)
                
        infoView = UIView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoView)
        let infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.text = "This is a long text that should also auto resizeasoeufjblaiwefuygbalwiefuyvbalwiefyuvawlefiayuvewfliv awef"
        infoLabel.numberOfLines = 0
        infoLabel.lineBreakMode = .byWordWrapping
        infoLabel.textAlignment = .left
        infoLabel.adjustsFontSizeToFitWidth = true
        infoLabel.minimumScaleFactor = 0.5
        infoView.addSubview(infoLabel)
                
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: margins.topAnchor),
            topView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            topLabel.topAnchor.constraint(equalTo: topView.topAnchor),
            topLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            topLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
                    
            stackView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 50),
                    
            infoView.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            infoView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            infoView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            infoLabel.topAnchor.constraint(equalTo: infoView.topAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor),
            infoLabel.bottomAnchor.constraint(equalTo: infoView.bottomAnchor)
                ])
            
        
    }
    
    func updateUI() {
        if(frontFacing) {
            topLabel.text = currentMemory?.front_text
            showBackButton.setTitle("Show back", for: .normal)
        }
        else {
            topLabel.text = currentMemory?.back_text
            showBackButton.setTitle("Show front", for: .normal)
        }
    }
    
    @objc func buttonPressed(sender: UIButton!) {
        if sender == showBackButton {
            frontFacing.toggle()
        }
        
        updateUI()
    }
    
}
