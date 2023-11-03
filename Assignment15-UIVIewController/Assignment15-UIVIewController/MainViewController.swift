
import UIKit

final class MainViewController: UIViewController {
    
    //MARK: - Properties
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = UIColor(red: 26/255, green: 34/255, blue: 50/255, alpha: 1)
        return stackView
    }()

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Logo")
        return imageView
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Profile", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 255/255, green: 128/255, blue: 54/255, alpha: 1)
        return button
    }()
    
    private let nowLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Now in cinemas"
        label.textColor = .white
        return label
    }()
    
    private let movieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(red: 0.12, green: 0.16, blue: 0.24, alpha: 1)
        
        return collectionView
    }()
    
    private var movies = Movie.dummyData

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.12, green: 0.16, blue: 0.24, alpha: 1)
        
        let logo = UIBarButtonItem(customView: logoImageView)
        logo.customView?.heightAnchor.constraint(equalToConstant: 48).isActive = true
        logo.customView?.widthAnchor.constraint(equalToConstant: 48).isActive = true
        navigationItem.leftBarButtonItem = logo
        let profile = UIBarButtonItem(customView: profileButton)
        profile.customView?.heightAnchor.constraint(equalToConstant: 40).isActive = true
        profile.customView?.widthAnchor.constraint(equalToConstant: 77).isActive = true
        navigationItem.rightBarButtonItem = profile
        
        view.addSubview(mainStackView)
        setupMainStackView()
    }

    //MARK: - Private Methods
    private func setupMainStackView() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        mainStackView.addArrangedSubview(nowLabel)
        mainStackView.addArrangedSubview(movieCollectionView)
        setupNowLabel()
        setupMovieCollectionView()
    }

    private func setupNowLabel() {
        NSLayoutConstraint.activate([
            nowLabel.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 16),
            nowLabel.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 16),
            nowLabel.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -16),
            nowLabel.heightAnchor.constraint(equalToConstant: 29),
        ])
    }
    
    private func setupMovieCollectionView() {
        movieCollectionView.backgroundColor = UIColor(red: 26/255, green: 34/255, blue: 50/255, alpha: 1)
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        movieCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: "movieCell")
        NSLayoutConstraint.activate([
            movieCollectionView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 16),
            movieCollectionView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -16),
            movieCollectionView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor),
            movieCollectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
    }
}

//MARK: - Extensions
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCell
        let currentMovie = movies[indexPath.row]
        
        if currentMovie.isFavourite == nil {
            cell.favoriteButton.tintColor = .white
        } else if !currentMovie.isFavourite!{
            cell.favoriteButton.tintColor = .darkGray
        } else {
            cell.favoriteButton.tintColor = .red
        }
        cell.moviePosterImageView.image = currentMovie.image
        cell.ratingLabel.text = String(currentMovie.rating)
        cell.movieNameLabel.text = currentMovie.name
        cell.movieGenreLabel.text = currentMovie.genre.rawValue
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetailViewController = MovieDetailViewController()
        movieDetailViewController.movie = movies[indexPath.row]
        self.navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
}

extension MainViewController: MovieCellDelegate {
    func favouriteStatusChanged(for cell: MovieCell?) {
        guard
            let cell,
            let indexPath = movieCollectionView.indexPath(for: cell)
        else { return }
        
        let movieToChange = movies[indexPath.row]
        if movieToChange.isFavourite == nil || !movieToChange.isFavourite! {
            cell.favoriteButton.tintColor = .red
            movieToChange.isFavourite = true
        } else {
            cell.favoriteButton.tintColor = .darkGray
            movieToChange.isFavourite = false
        }
    }
}

