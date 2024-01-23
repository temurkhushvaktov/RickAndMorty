//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Temur Khushvaktov on 23/01/24.
//

import Kingfisher
import SnapKit
import UIKit

final class CharacterCell: UITableViewCell {

    // MARK: - Private Properties

    private let characterImageView = UIImageView()
    private let characterNameLabel = UILabel()

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureAppearance()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureAppearance()
    }

    // MARK: - Methods

    func update(with model: CharacterDetails) {
        characterImageView.kf.setImage(with: URL(string: model.image))
        characterImageView.contentMode = .scaleAspectFill
        characterNameLabel.text = model.name
    }

}

// MARK: - Appearance

private extension CharacterCell {

    func configureAppearance() {
        selectionStyle = .none
        configureImageViewLayout()
        configureLabelLayout()
    }

    func configureImageViewLayout() {
        contentView.addSubview(characterImageView)
        
        characterImageView.snp.makeConstraints { make in
            make.height.width.equalTo(100)
            make.top.bottom.leading.equalToSuperview().inset(16)
        }
    }

    func configureLabelLayout() {
        contentView.addSubview(characterNameLabel)

        characterNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.characterImageView.snp.trailing).inset(-8)
            make.trailing.equalToSuperview().inset(16)
        }
    }
}
