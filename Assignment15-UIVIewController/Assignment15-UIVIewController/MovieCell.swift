
import UIKit

protocol MovieCellDelegate: AnyObject {
    func favouriteStatusChanged(for cell: MovieCell?)
}

final class MovieCell: UICollectionViewCell {
    
    //MARK: - Properties
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImage(named: "heart.fill")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let ratingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 255/255, green: 128/255, blue: 54/255, alpha: 1)
        view.layer.cornerRadius = 4
        return view
    }()
    
    var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let movieGenreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.389, green: 0.452, blue: 0.58, alpha: 1)
        return label
    }()
    
    weak var delegate: MovieCellDelegate?
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(mainStackView)
        contentView.addSubview(favoriteButton)
        contentView.addSubview(ratingView)
        setupMainStackView()
        setupFavouriteButton()
        setupRatingView()
        addActions()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        moviePosterImageView.image = nil
        movieNameLabel.text = nil
        movieGenreLabel.text = nil
        ratingLabel.text = nil
        favoriteButton.tintColor = nil
    }
    
    //MARK: - Methods
    private func setupMainStackView() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        mainStackView.addArrangedSubview(moviePosterImageView)
        mainStackView.addArrangedSubview(descriptionStackView)
        setupMoviePosterImageView()
        setupDescriptionStackView()
    }
    
    private func setupMoviePosterImageView() {
        NSLayoutConstraint.activate([
            moviePosterImageView.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            moviePosterImageView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            moviePosterImageView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 164),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 230),
        ])
    }
    
    private func setupFavouriteButton() {
        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            favoriteButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            favoriteButton.heightAnchor.constraint(equalToConstant: 20),
            favoriteButton.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    private func setupRatingView() {
        NSLayoutConstraint.activate([
            ratingView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            ratingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            ratingView.heightAnchor.constraint(equalToConstant: 23),
            ratingView.widthAnchor.constraint(equalToConstant: 33),
        ])
        
        ratingView.addSubview(ratingLabel)
        setupRatingLabel()
    }
    
    private func setupRatingLabel() {
        NSLayoutConstraint.activate([
            ratingLabel.centerXAnchor.constraint(equalTo: ratingView.centerXAnchor),
            ratingLabel.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor),
        ])
    }
    
    private func setupDescriptionStackView() {
        NSLayoutConstraint.activate([
            descriptionStackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor),
            descriptionStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            descriptionStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            descriptionStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 40)
        ])
        
        descriptionStackView.addArrangedSubview(movieNameLabel)
        descriptionStackView.addArrangedSubview(movieGenreLabel)
        setupMovieNameLabel()
        setupMovieGenreLabel()
    }
    
    private func setupMovieNameLabel() {
        NSLayoutConstraint.activate([
            movieNameLabel.leadingAnchor.constraint(equalTo: descriptionStackView.leadingAnchor),
            movieNameLabel.trailingAnchor.constraint(equalTo: descriptionStackView.trailingAnchor),
            movieNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 39),
        ])
    }
    
    private func setupMovieGenreLabel() {
        NSLayoutConstraint.activate([
            movieGenreLabel.bottomAnchor.constraint(equalTo: descriptionStackView.bottomAnchor),
            movieGenreLabel.leadingAnchor.constraint(equalTo: descriptionStackView.leadingAnchor),
            movieGenreLabel.trailingAnchor.constraint(equalTo: descriptionStackView.trailingAnchor),
            movieGenreLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 17),
        ])
    }
    
    func addActions() {
        favoriteButton.addAction(UIAction(title: "", handler: { [weak self] action in
            self?.delegate?.favouriteStatusChanged(for: self)
        }), for: .touchUpInside)
    }
}
