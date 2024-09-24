//
//  ViewController.swift
//  ExampleApp
//
//  Created by brubru on 08.09.2024.
//

import UIKit

class ViewController: UIViewController {
	private let helper = Helper()
	private let textLabel = UILabel()
	private let raccoonImageView = UIImageView()
    private let hamsterImageView = UIImageView()
    private let racconImageContainerView = UIView()
    private let hamsterImageContainerView = UIView()

	override func viewDidLoad() {
		super.viewDidLoad()
		updateNumbers()
		
		setupLabel()
		setupRaccoonImageView()
        setupHamsterImageView()
		view.addSubview(textLabel)
        setupRaccoonImage()
        view.addSubview(racconImageContainerView)
        setupHamsterImage()
        view.addSubview(hamsterImageContainerView)
        setupLayout()
		setupView()
	}
	
	private func updateNumbers() {
		helper.addNumber(Int.random(in: 1...10))
	}
	
	private func setupLabel() {
		let firstNumber = helper.getNumbers().first
		textLabel.text = "\(firstNumber ?? 0)"
		textLabel.font = .systemFont(ofSize: 30, weight: .bold)
        textLabel.textColor = .white
	}
	
    //перенёс настройку imageView в отдельную функцию
	private func setupRaccoonImageView() {
        racconImageContainerView.layer.shadowColor = UIColor.black.cgColor
        racconImageContainerView.layer.shadowOffset = CGSize(width: 15, height: 15)
        racconImageContainerView.layer.shadowOpacity = 1
        racconImageContainerView.layer.shadowRadius = 10
	}
    
    private func setupRaccoonImage() {
        raccoonImageView.image = UIImage(named: "raccoon")
        raccoonImageView.translatesAutoresizingMaskIntoConstraints = false
        raccoonImageView.layer.cornerRadius = 20
        raccoonImageView.clipsToBounds = true
        
        // Добавляем imageView в контейнер
        racconImageContainerView.addSubview(raccoonImageView)
    }
    
    private func setupHamsterImageView() {
        hamsterImageContainerView.layer.shadowColor = UIColor.black.cgColor
        hamsterImageContainerView.layer.shadowOffset = CGSize(width: 15, height: 15)
        hamsterImageContainerView.layer.shadowOpacity = 1
        hamsterImageContainerView.layer.shadowRadius = 10
    }
    
    private func setupHamsterImage() {
        hamsterImageView.image = UIImage(named: "hamster")
        hamsterImageView.translatesAutoresizingMaskIntoConstraints = false
        hamsterImageView.layer.cornerRadius = 20
        hamsterImageView.clipsToBounds = true
        
        hamsterImageContainerView.addSubview(hamsterImageView)
    }
	
    //настройка слоя градиента родительского View
	private func setupView() {
		let gradient = CAGradientLayer()
		gradient.frame = view.bounds
        gradient.colors = [UIColor.blue.cgColor, UIColor.red.cgColor, UIColor.yellow.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
		
		// Добавляем подслой к супервью
		view.layer.insertSublayer(gradient, at: 0)  // Градиент на фоне супервью
	}
    
    //настройка констрейнтов для imageContainerView
    private func setupLayout() {
        racconImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        hamsterImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            racconImageContainerView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 50),
            racconImageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            racconImageContainerView.heightAnchor.constraint(equalToConstant: 200),
            racconImageContainerView.widthAnchor.constraint(equalToConstant: 200),
            
            hamsterImageContainerView.topAnchor.constraint(equalTo: racconImageContainerView.bottomAnchor, constant: 50),
            hamsterImageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hamsterImageContainerView.heightAnchor.constraint(equalToConstant: 200),
            hamsterImageContainerView.widthAnchor.constraint(equalToConstant: 200),
            
            raccoonImageView.topAnchor.constraint(equalTo: racconImageContainerView.topAnchor),
            raccoonImageView.rightAnchor.constraint(equalTo: racconImageContainerView.rightAnchor),
            raccoonImageView.bottomAnchor.constraint(equalTo: racconImageContainerView.bottomAnchor),
            raccoonImageView.leftAnchor.constraint(equalTo: racconImageContainerView.leftAnchor),
            
            hamsterImageView.topAnchor.constraint(equalTo: hamsterImageContainerView.topAnchor),
            hamsterImageView.rightAnchor.constraint(equalTo: hamsterImageContainerView.rightAnchor),
            hamsterImageView.bottomAnchor.constraint(equalTo: hamsterImageContainerView.bottomAnchor),
            hamsterImageView.leftAnchor.constraint(equalTo: hamsterImageContainerView.leftAnchor),
            ])
        
        //настройка режима отображения imageView
        raccoonImageView.contentMode = .scaleAspectFill
        hamsterImageView.contentMode = .scaleAspectFill
    }
}

