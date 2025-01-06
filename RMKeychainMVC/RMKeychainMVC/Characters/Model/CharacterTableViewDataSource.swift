//
//  CharacterTableViewDataSource.swift
//  RMKeychainMVC
//
//  Created by Ибрагим Габибли on 06.01.2025.
//

import Foundation
import UIKit

class CharacterTableViewDataSource: NSObject, UITableViewDataSource {
    var characters = [Character]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CharacterTableViewCell.id,
            for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }

        let character = characters[indexPath.row]
        let imageURL = character.image

        ImageLoader.shared.loadImage(from: imageURL) { loadedImage in
            DispatchQueue.main.async {
                guard let cell = tableView.cellForRow(at: indexPath) as? CharacterTableViewCell  else {
                    return
                }
                cell.configure(with: character, image: loadedImage)
            }
        }

        return cell
    }
}
