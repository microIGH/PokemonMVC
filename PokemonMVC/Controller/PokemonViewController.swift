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
        setupColors()
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
    
    private func setupColors() {
        // Usar colores adaptativos
        view.backgroundColor = UIColor(named: "PokemonHeaderBackground")
        pokemonTableView.backgroundColor = UIColor.systemBackground
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
        //create container view
          let containerView = UIView()

          //Create image view
          let imgHeader = UIImageView.init(image: UIImage(named: "Pokemon"))
          imgHeader.translatesAutoresizingMaskIntoConstraints = false

          // Create view for blur effect
          let bgView = UIVisualEffectView()
          bgView.translatesAutoresizingMaskIntoConstraints = false

          // Create blur effect
          let blurEffect = UIBlurEffect(style: .light)
          bgView.effect = blurEffect
          containerView.addSubview(bgView)
          containerView.addSubview(imgHeader)

          //Set contraints
          containerView.heightAnchor.constraint(
              equalToConstant: imgHeader.frame.height
          ).isActive = true

          imgHeader.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
              .isActive = true

          NSLayoutConstraint.activate(
              [
                  bgView.topAnchor.constraint(equalTo: containerView.topAnchor)
                  ,
                  bgView.bottomAnchor.constraint(
                      equalTo: containerView.bottomAnchor
                  )
                  ,
                  bgView.leadingAnchor.constraint(
                      equalTo: containerView.leadingAnchor
                  )
                  ,
                  bgView.trailingAnchor.constraint(
                      equalTo: containerView.trailingAnchor
                  ),
              ]
          )

          return containerView
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let pokemon = dataManager.getPokemon(at: indexPath.row)
        
        // Crear el modal
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let modalVC = storyboard.instantiateViewController(withIdentifier: "PokemonModalViewController") as! PokemonModalViewController
        modalVC.pokemon = pokemon
        
        // Presentar como modal
        modalVC.modalPresentationStyle = .pageSheet
        present(modalVC, animated: true)
    }
    
    
}
