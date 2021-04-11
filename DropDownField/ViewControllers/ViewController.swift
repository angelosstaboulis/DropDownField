//
//  ViewController.swift
//  DropDownField
//
//  Created by Angelos Staboulis on 6/4/21.
//

import UIKit
protocol DropDownFieldProtocol{
    func setupView()
    func hideTableView()
    func selectRow(indexPath:IndexPath)
    func deselectRow(indexPath:IndexPath)
    func setupCell(tableView:UITableView,indexPath:IndexPath)->UITableViewCell
}
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let names = ["Angelos","Angeliki","Kostas","George"]
    @IBOutlet var txtDropDown: UITextField!
    @IBOutlet var txtDropDownHeight: NSLayoutConstraint!
    var tableView:UITableView!
    var selected:Bool!
    @IBOutlet var txtDropDownTop: NSLayoutConstraint!
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func txtDropDown(_ sender: Any) {
        let textfield:UITextField = sender as! UITextField
        if textfield.text?.count == 0 {
            hideTableView()
        }
        else{
            setupView()
        }
    }
    
    
    
}
extension ViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setupCell(tableView:tableView,indexPath:indexPath)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        deselectRow(indexPath:indexPath)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectRow(indexPath:indexPath)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
extension ViewController:DropDownFieldProtocol{
    func setupView(){
        txtDropDown.becomeFirstResponder()
        tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.borderWidth = 1
        tableView.separatorStyle = .none
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.tag = 1
        tableView.translatesAutoresizingMaskIntoConstraints = false
        debugPrint("height=",UIScreen.main.bounds.height,UIScreen.main.bounds.width)
        if UIScreen.main.bounds.height == 667 {
            let top = ((txtDropDown.frame.maxY+txtDropDown.frame.midY) + txtDropDownTop.constant) + (txtDropDownHeight.constant*2)
            let height = (UIScreen.main.bounds.height) - (txtDropDown.frame.maxY*2)
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant:top-20).isActive = true
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(58)).isActive = true
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: CGFloat(-105)).isActive = true
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: CGFloat(-height)  ).isActive = true
        }
        else if UIScreen.main.bounds.height == 736{
            let top = ((txtDropDown.frame.maxY+txtDropDown.frame.midY) + txtDropDownTop.constant) + (txtDropDownHeight.constant*2)
            let height = (UIScreen.main.bounds.height) - (txtDropDown.frame.maxY*2)
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant:top-20).isActive = true
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(58)).isActive = true
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: CGFloat(-105)).isActive = true
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: CGFloat(-height)  ).isActive = true
            
        }
        else if UIScreen.main.bounds.height == 812{
            let top = ((txtDropDown.frame.maxY+txtDropDown.frame.midY) + txtDropDownTop.constant) + (txtDropDownHeight.constant*2)
            let height = (UIScreen.main.bounds.height) - (txtDropDown.frame.maxY*2)
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant:top+6).isActive = true
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(58)).isActive = true
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: CGFloat(-105)).isActive = true
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: CGFloat(-height)  ).isActive = true
            
        }
        else if UIScreen.main.bounds.height == 896{
            let top = ((txtDropDown.frame.maxY+txtDropDown.frame.midY) + txtDropDownTop.constant) + (txtDropDownHeight.constant*2)
            let height = (UIScreen.main.bounds.height) - (txtDropDown.frame.maxY*2)
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant:top+6).isActive = true
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(58)).isActive = true
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: CGFloat(-105)).isActive = true
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: CGFloat(-height)  ).isActive = true
            
        }
        else{
            let top = ((txtDropDown.frame.maxY+txtDropDown.frame.midY) + txtDropDownTop.constant) + (txtDropDownHeight.constant*2)
            let height = (UIScreen.main.bounds.height) - (txtDropDown.frame.maxY*2)
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant:top+7).isActive = true
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(58)).isActive = true
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: CGFloat(-105)).isActive = true
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: CGFloat(-height)  ).isActive = true
        }
    }
    func hideTableView(){
        for subView in view.subviews{
            if subView.tag == 1 {
                subView.isHidden = true
            }
        }
    }
    func selectRow(indexPath:IndexPath){
        let cell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        cell.accessoryType = .checkmark
        txtDropDown.text  = cell.textLabel?.text
        DispatchQueue.main.asyncAfter(deadline: .now()+0.9) {
            self.hideTableView()
        }
    }
    func deselectRow(indexPath:IndexPath){
        let cell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        cell.accessoryType = .none
    }
    func setupCell(tableView:UITableView,indexPath:IndexPath)->UITableViewCell{
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row < names.count {
            cell.textLabel?.text = names[indexPath.row]
            
        }
        return cell
    }
}
