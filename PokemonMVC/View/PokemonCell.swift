//
//  PokemonCell.swift
//  PokemonMVC
//
//  Created by ISRAEL GARCIA on 07/08/25.
//

import UIKit

class PokemonCell: UITableViewCell {
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    private func setupCell() {
        // Configurar imagen
        pokemonImageView.contentMode = .scaleAspectFit
        pokemonImageView.layer.cornerRadius = 8
        
        // Configurar label
        pokemonNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    }
}
