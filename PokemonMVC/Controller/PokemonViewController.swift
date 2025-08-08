//
//  ViewController.swift
//  PokemonMVC
//
//  Created by ISRAEL GARCIA on 07/08/25.
//

import UIKit

class PokemonViewController: UIViewController {
    
    @IBOutlet weak var pokemonTableView: UITableView!
    
    let dataManager = PokemonDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("🚀 viewDidLoad ejecutado")
            print("📱 TableView existe: \(pokemonTableView != nil)")
        
        setupTableView()
        loadData()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("📏 viewDidAppear - TableView frame: \(pokemonTableView.frame)")
        print("📏 viewDidAppear - TableView bounds: \(pokemonTableView.bounds)")
    }
    
    private func setupTableView() {
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
    }
    
    private func loadData() {
        dataManager.fetch()
        print("Cargados \(dataManager.count()) pokémons")
        pokemonTableView.reloadData()
    }
}

extension PokemonViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = dataManager.count()
        print("numberOfRowsInSection: \(count)")
        return count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let imageView = UIImageView(image: UIImage(named: "Pokemon"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        
        let pokemon = dataManager.getPokemon(at: indexPath.row)
        
        print("Configurando celda \(indexPath.row): \(pokemon.name)")
        
        cell.pokemonNameLabel.text = pokemon.name
        cell.pokemonImageView.image = UIImage(named: "\(pokemon.image)")
        
        return cell
    }
}
