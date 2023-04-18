
import UIKit

enum SectionType : CaseIterable{
    case Card
    case Shopping
}

class CollectionViewController: UIViewController,UICollectionViewDataSource {
    var sectionType: [SectionType]?
    
    @IBOutlet weak var collectionView: UICollectionView!
    func fetchData() {
        Task{
            loaderSpinner.startAnimating()
            let products = await Requests.getProductRequest()
            collectionViewModel = products.products.map{ProductCollectionViewModel(with: $0)}
            loaderSpinner.stopAnimating()
            loaderSpinner.isHidden = true
            collectionView.dataSource = self
        }
        
    }
    
    @IBOutlet weak var loaderSpinner: UIActivityIndicatorView!

//    UICollectionView(
//        frame: .zero, collectionViewLayout: self().createLayout()
//    )
    private var collectionViewModel: Array<ProductCollectionViewModel> = []
  
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        loaderSpinner.isHidden = true
        sectionType = SectionType.allCases
//        sectionType = sectionType?.filter({
//            $0 != .Card
//        })
        collectionView.collectionViewLayout = createLayoutForAllSection()
        view.addSubview(collectionView)
//        fetchData()
        collectionView.register(
            UINib(
                nibName: MyCollectionViewCell.identifier,
                bundle: nil
            ),
            forCellWithReuseIdentifier: MyCollectionViewCell.identifier
        )
        
        collectionView.register(
            UINib(
                nibName: SecondCollectionViewCell.identifier,
                bundle: nil
            ),
            forCellWithReuseIdentifier: SecondCollectionViewCell.identifier
        )
        
        collectionView.register(FooterCollectionViewCell.nib(), forSupplementaryViewOfKind: "footer", withReuseIdentifier: FooterCollectionViewCell.identifier)
        collectionView.register(HeaderCollectionViewCell.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: HeaderCollectionViewCell.indentifier)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
    }
    
   
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionType?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        switch sectionType?[indexPath.section]{
        case .Card:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
            cell.configure(index: indexPath.row)
            cell.delegate = self
            return cell
        case .Shopping:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondCollectionViewCell.identifier, for: indexPath) as! SecondCollectionViewCell
            cell.productViewModel = collectionViewModel[indexPath.row]
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondCollectionViewCell.identifier, for: indexPath)
            return cell
        }
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section == 0){
            return 10
        }
        else{
            return collectionViewModel.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    switch kind{
    case "header":
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionViewCell.indentifier, for: indexPath)
        return header
    case "footer":
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionViewCell.identifier, for: indexPath) as! FooterCollectionViewCell
        footer.config(noOfPage: 10, currentPage: indexPath.row)
        return footer
    default:
        fatalError("supplementary error")
    }
        
    }
    
    
    
     func createLayoutForAllSection() -> UICollectionViewCompositionalLayout{
        let item1 = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        item1.contentInsets.leading = 10
        item1.contentInsets.trailing = 10
        
        let grp1 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5)), subitems: [item1])
        
        let section1 = NSCollectionLayoutSection(group: grp1)
        section1.orthogonalScrollingBehavior = .paging
         
         section1.boundarySupplementaryItems = [.init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/4)), elementKind: "header", alignment: .topLeading),.init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalWidth(1/4)), elementKind: "footer", alignment: .bottom)]
        
        
        let item2 = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        item2.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let grp2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(450)), subitem: item2   ,count: 2)
        
        let section2 = NSCollectionLayoutSection(group: grp2)
        
        return UICollectionViewCompositionalLayout{
            (sectionIndex,env) -> NSCollectionLayoutSection? in
            switch self.sectionType?[sectionIndex] {
            case .Card:
                return section1
            case .Shopping:
                return section2
            default:
                return section1
            }
        }
    }
    
    
    
}

extension CollectionViewController: AlertProtocol{
    func showAlert(alert: UIAlertController) {
        present(alert, animated: true)
    }
    
}
