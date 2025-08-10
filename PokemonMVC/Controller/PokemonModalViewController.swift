//
//  PokemonModalViewController.swift
//  PokemonMVC
//
//  Created by ISRAEL GARCIA on 08/08/25.
//

import UIKit

class PokemonModalViewController: UIViewController {
    
    @IBOutlet weak var pokemonImageView: UIImageView!

    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    @IBOutlet weak var movementLabel: UILabel!
    
    @IBOutlet weak var abilityLabel: UILabel!
    
    
    @IBOutlet weak var closeButton: UIButton!
    

    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureWithPokemon()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.systemBackground
        
        updateButtonStyle()
    }
    
    private func updateButtonStyle() {
        if traitCollection.userInterfaceStyle == .dark {
            // Modo oscuro: filled con texto blanco
            closeButton.configuration = UIButton.Configuration.filled()
            closeButton.configuration?.baseForegroundColor = .white
        } else {
            // Modo claro: plain con texto rojo
            closeButton.configuration = UIButton.Configuration.plain()
            closeButton.configuration?.baseForegroundColor = .systemRed
        }
        
        closeButton.configuration?.title = "✕"
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            updateButtonStyle()
        }
    }
    
    private func configureWithPokemon() {
        guard let pokemon = pokemon else { return }
        
        pokemonNameLabel.text = pokemon.name
        movementLabel.text = "Movimiento: \(pokemon.movement)"
        abilityLabel.text = "Habilidad: \(pokemon.ability)"
        pokemonImageView.image = UIImage(named: "\(pokemon.image)")
    }
    
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
