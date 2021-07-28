//
//  TaskTableViewCell.swift
//  Task-CD
//
//  Created by Natalie Hall on 7/27/21.
//

import UIKit

protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: TaskCompletionDelegate?
    
    @IBAction func completionButtonTapped(_ sender: Any) {
        if let delegate = delegate {
            delegate.taskCellButtonTapped(self)
        }
    }
    
    
    func updateViews() {
        guard let task = task else { return }
        taskNameLabel.text = task.name
    
        if task.isComplete {
            completionButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            completionButton.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
}  // End of Class
