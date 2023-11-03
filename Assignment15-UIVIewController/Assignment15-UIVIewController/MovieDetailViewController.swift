
import UIKit

final class MovieDetailViewController: UIViewController {
    
    //MARK: - Properties
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let ratingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    private let imdbLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "IMDB"
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.389, green: 0.452, blue: 0.58, alpha: 1)
        return label
    }()

    private let descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = UIColor(red: 26/255, green: 34/255, blue: 50/255, alpha: 1)
        return stackView
    }()
    
    private let aboutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 4
        return label
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let certificateStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let certificateLabel: UILabel = {
        let label = UILabel()
        label.text = "Certificate"
        return label
    }()
    
    private let certificateInfoLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let runtimeStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let runtimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Runtime"
        return label
    }()
    
    private let runtimeInfoLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let releaseStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let releaseLabel: UILabel = {
        let label = UILabel()
        label.text = "Release"
        return label
    }()
    
    private let releaseInfoLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let genreStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.text = "Genre"
        return label
    }()
    
    private let genreInfoLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let directorStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let directorLabel: UILabel = {
        let label = UILabel()
        label.text = "Director"
        return label
    }()
    
    private let directorInfoLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let castStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let castLabel: UILabel = {
        let label = UILabel()
        label.text = "Cast"
        return label
    }()
    
    private let castInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        return label
    }()
    
    private let selectSessionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let selectSessionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 255/255, green: 128/255, blue: 54/255, alpha: 1)
        button.setTitle("Select Session", for: .normal)
        return button
    }()
    
    var movie: Movie?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 31/255, green: 41/255, blue: 61/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.white]
        
        view.addSubview(mainStackView)
        view.addSubview(selectSessionView)
        setupSelectSessionView()
        setupMainStackView()
        configureView()
    }
    
    //MARK: - Methods
    private func setupMainStackView() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.heightAnchor.constraint(equalToConstant: 600),
        ])
        
        mainStackView.addArrangedSubview(moviePosterImageView)
        mainStackView.addArrangedSubview(ratingStackView)
        mainStackView.addArrangedSubview(descriptionStackView)
        setupMoviePosterImageView()
        setupRatingStackView()
        setupDescriptionStackView()
    }
    
    private func configureView() {
        self.title = movie?.name
        moviePosterImageView.image = movie?.imageFromMovie
        ratingLabel.text = String(movie!.rating)
        aboutLabel.text = movie?.about
        certificateInfoLabel.text = movie?.certificate.rawValue
        runtimeInfoLabel.text = movie?.runtime
        releaseInfoLabel.text = movie?.release
        genreInfoLabel.text = movie?.genre.rawValue
        directorInfoLabel.text = movie?.director
        castInfoLabel.text = movie?.cast
    }
    
    private func setupMoviePosterImageView() {
        NSLayoutConstraint.activate([
            moviePosterImageView.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            moviePosterImageView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            moviePosterImageView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 210)
        ])
    }
    
    private func setupRatingStackView() {
        NSLayoutConstraint.activate([
            ratingStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            ratingStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            ratingStackView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        ratingStackView.addArrangedSubview(ratingLabel)
        ratingStackView.addArrangedSubview(imdbLabel)
    }
    
    private func setupDescriptionStackView() {
        NSLayoutConstraint.activate([
            descriptionStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            descriptionStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            descriptionStackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor),
            descriptionStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
        ])
        
        descriptionStackView.addArrangedSubview(aboutLabel)
        descriptionStackView.addArrangedSubview(infoStackView)
        setupAboutLabel()
        setupInfoStackView()
    }
    
    private func setupAboutLabel() {
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: descriptionStackView.topAnchor),
            aboutLabel.leadingAnchor.constraint(equalTo: descriptionStackView.leadingAnchor, constant: 16),
            aboutLabel.trailingAnchor.constraint(equalTo: descriptionStackView.trailingAnchor, constant: -16),
            aboutLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 80),
        ])
    }
    
    private func setupInfoStackView() {
        NSLayoutConstraint.activate([
            infoStackView.bottomAnchor.constraint(equalTo: descriptionStackView.bottomAnchor, constant: -16),
            infoStackView.leadingAnchor.constraint(equalTo: descriptionStackView.leadingAnchor),
            infoStackView.trailingAnchor.constraint(equalTo: descriptionStackView.trailingAnchor),
            infoStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 150),
        ])
        
        setupDescriptionInfoStackViews()
        setupDescriptionInfoLabels()
    }
    
    private func setupDescriptionInfoStackViews() {
        [certificateStackView, runtimeStackView, releaseStackView, genreStackView, directorStackView, castStackView].forEach { stackView in
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.spacing = 16
            stackView.alignment = .center
            stackView.distribution = .fillProportionally
            infoStackView.addArrangedSubview(stackView)
            stackView.leadingAnchor.constraint(equalTo: infoStackView.leadingAnchor, constant: 16).isActive = true
            stackView.trailingAnchor.constraint(equalTo: infoStackView.trailingAnchor, constant: -16).isActive = true
            stackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        }
        
        setupCertificateStackView()
        setupRuntimeStackView()
        setupReleaseStackView()
        setupGenreStackView()
        setupDirectorStackView()
        setupCastStackView()
    }
    
    private func setupDescriptionInfoLabels() {
        [certificateLabel, certificateInfoLabel, runtimeLabel, runtimeInfoLabel, releaseLabel, releaseInfoLabel, genreLabel, genreInfoLabel, directorLabel, directorInfoLabel, castLabel, castInfoLabel].forEach { label in
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .white
            label.font = .systemFont(ofSize: 14)
            label.textAlignment = .left
        }
        
        [certificateLabel, runtimeLabel, releaseLabel, genreLabel, directorLabel, castLabel].forEach { label in
            label.textColor = UIColor(red: 0.389, green: 0.452, blue: 0.58, alpha: 1)
            label.widthAnchor.constraint(equalToConstant: 74).isActive = true
        }
    }
    
    private func setupCertificateStackView() {
        certificateStackView.addArrangedSubview(certificateLabel)
        certificateStackView.addArrangedSubview(certificateInfoLabel)
        
        NSLayoutConstraint.activate([
            certificateLabel.topAnchor.constraint(equalTo: certificateStackView.topAnchor),
            certificateLabel.leadingAnchor.constraint(equalTo: certificateStackView.leadingAnchor),
            certificateLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 74),
        ])
        
        NSLayoutConstraint.activate([
            certificateInfoLabel.topAnchor.constraint(equalTo: certificateStackView.topAnchor),
            certificateInfoLabel.trailingAnchor.constraint(equalTo: certificateStackView.trailingAnchor),
            certificateInfoLabel.bottomAnchor.constraint(equalTo: certificateStackView.bottomAnchor),
            certificateInfoLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 253),
        ])
    }
    
    private func setupRuntimeStackView() {
        runtimeStackView.addArrangedSubview(runtimeLabel)
        runtimeStackView.addArrangedSubview(runtimeInfoLabel)
        
        NSLayoutConstraint.activate([
            runtimeLabel.topAnchor.constraint(equalTo: runtimeStackView.topAnchor),
            runtimeLabel.leadingAnchor.constraint(equalTo: runtimeStackView.leadingAnchor),
            runtimeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 74),
        ])
        
        NSLayoutConstraint.activate([
            runtimeInfoLabel.topAnchor.constraint(equalTo: runtimeStackView.topAnchor),
            runtimeInfoLabel.trailingAnchor.constraint(equalTo: runtimeStackView.trailingAnchor),
            runtimeInfoLabel.bottomAnchor.constraint(equalTo: runtimeStackView.bottomAnchor),
            runtimeInfoLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 253),
        ])
    }
    
    private func setupReleaseStackView() {
        releaseStackView.addArrangedSubview(releaseLabel)
        releaseStackView.addArrangedSubview(releaseInfoLabel)
        
        NSLayoutConstraint.activate([
            releaseLabel.topAnchor.constraint(equalTo: releaseStackView.topAnchor),
            releaseLabel.leadingAnchor.constraint(equalTo: releaseStackView.leadingAnchor),
            releaseLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 74),
        ])
        
        NSLayoutConstraint.activate([
            releaseInfoLabel.topAnchor.constraint(equalTo: releaseStackView.topAnchor),
            releaseInfoLabel.trailingAnchor.constraint(equalTo: releaseStackView.trailingAnchor),
            releaseInfoLabel.bottomAnchor.constraint(equalTo: releaseStackView.bottomAnchor),
            releaseInfoLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 253),
        ])
    }
    
    private func setupGenreStackView() {
        genreStackView.addArrangedSubview(genreLabel)
        genreStackView.addArrangedSubview(genreInfoLabel)
        
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: genreStackView.topAnchor),
            genreLabel.leadingAnchor.constraint(equalTo: genreStackView.leadingAnchor),
            genreLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 74),
        ])
        
        NSLayoutConstraint.activate([
            genreInfoLabel.topAnchor.constraint(equalTo: genreStackView.topAnchor),
            genreInfoLabel.trailingAnchor.constraint(equalTo: genreStackView.trailingAnchor),
            genreInfoLabel.bottomAnchor.constraint(equalTo: genreStackView.bottomAnchor),
            genreInfoLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 253),
        ])
    }
    
    private func setupDirectorStackView() {
        directorStackView.addArrangedSubview(directorLabel)
        directorStackView.addArrangedSubview(directorInfoLabel)
        
        NSLayoutConstraint.activate([
            directorLabel.topAnchor.constraint(equalTo: directorStackView.topAnchor),
            directorLabel.leadingAnchor.constraint(equalTo: directorStackView.leadingAnchor),
            directorLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 74),
        ])
        
        NSLayoutConstraint.activate([
            directorInfoLabel.topAnchor.constraint(equalTo: directorStackView.topAnchor),
            directorInfoLabel.trailingAnchor.constraint(equalTo: directorStackView.trailingAnchor),
            directorInfoLabel.bottomAnchor.constraint(equalTo: directorStackView.bottomAnchor),
            directorInfoLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 253),
        ])
    }
    
    private func setupCastStackView() {
        castStackView.addArrangedSubview(castLabel)
        castStackView.addArrangedSubview(castInfoLabel)
        
        NSLayoutConstraint.activate([
            castLabel.topAnchor.constraint(equalTo: castStackView.topAnchor),
            castLabel.leadingAnchor.constraint(equalTo: castStackView.leadingAnchor),
            castLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 74),
        ])
        
        NSLayoutConstraint.activate([
            castInfoLabel.topAnchor.constraint(equalTo: castStackView.topAnchor),
            castInfoLabel.trailingAnchor.constraint(equalTo: castStackView.trailingAnchor),
            castInfoLabel.bottomAnchor.constraint(equalTo: castStackView.bottomAnchor),
            castInfoLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 253),
        ])
    }
    
    private func setupSelectSessionView() {
        NSLayoutConstraint.activate([
            selectSessionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectSessionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectSessionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            selectSessionView.heightAnchor.constraint(equalToConstant: 88),
        ])
        
        selectSessionView.addSubview(selectSessionButton)
        setupSelectSessionButton()
    }
    
    private func setupSelectSessionButton() {
        NSLayoutConstraint.activate([
            selectSessionButton.leadingAnchor.constraint(equalTo: selectSessionView.leadingAnchor, constant: 16),
            selectSessionButton.trailingAnchor.constraint(equalTo: selectSessionView.trailingAnchor, constant: -16),
            selectSessionButton.bottomAnchor.constraint(equalTo: selectSessionView.bottomAnchor, constant: -16),
            selectSessionButton.topAnchor.constraint(equalTo: selectSessionView.topAnchor, constant: 16),
        ])
    }
}
