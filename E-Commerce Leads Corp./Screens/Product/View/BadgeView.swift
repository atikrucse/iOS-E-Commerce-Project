//
//  BadgeView.swift
//  E-Commerce Leads Corp.
//
//  Created by Atik  on 26/9/23.
//

import UIKit

class BadgeView: UIView {
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var badgeValue: Int = 0 {
        didSet {
            label.text = badgeValue > 0 ? "\(badgeValue)" : nil
            isHidden = badgeValue <= 0
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true

        addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

