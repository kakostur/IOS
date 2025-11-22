import UIKit

struct FavoriteData {

    // --- Movies 🎬 ---
    static let movies: [FavoriteItem] = [
        FavoriteItem(title: "Avengers: Endgame",
                     subtitle: "Russo Brothers, 2019",
                     descriptionText: "After the devastating events of Infinity War, the universe is in ruins. With the help of remaining allies, the Avengers assemble once more to reverse Thanos's actions. This film serves as the epic conclusion to the original 22 films of the Marvel Cinematic Universe, concluding several character arcs with great emotional weight and spectacle.",
                     review: "Epic conclusion to the Infinity Saga.",
                     image: UIImage(named: "avengers")!),

        FavoriteItem(title: "Haikyuu!! Movie",
                     subtitle: "Susumu Mitsunaka, 2024",
                     descriptionText: "This movie is the first part of a two-part final project for the Haikyu!! anime series, covering the highly anticipated match between Karasuno and Nekoma High. It is a powerful sports anime with intense action and emotion. The rivalry between the two teams is central to the plot, making it a must-watch for fans.",
                     review: "Powerful sports anime with emotion.",
                     image: UIImage(named: "haikyuu")!),

        FavoriteItem(title: "Avatar",
                     subtitle: "James Cameron, 2009",
                     descriptionText: "A paraplegic marine is dispatched to the moon Pandora on a unique mission, but becomes torn between following orders and protecting the world he feels is his home. The film is renowned for its groundbreaking visual effects and the creation of a rich, complex alien ecosystem. It explores powerful themes of environmentalism and cultural conflict.",
                     review: "Beautiful visuals and worldbuilding.",
                     image: UIImage(named: "avatar")!),

        FavoriteItem(title: "The Devil Wears Prada",
                     subtitle: "David Frankel, 2006",
                     descriptionText: "A young journalist, Andy Sachs, is hired as a junior assistant to Miranda Priestly, the ruthless and demanding editor-in-chief of a high fashion magazine. The movie details Andy's challenging journey as she tries to survive in the high-pressure, glamorous, but often toxic fashion world. It’s a sharp commentary on corporate culture and ambition.",
                     review: "Legendary performance from Meryl Streep.",
                     image: UIImage(named: "devilWearsPrada")!),

        FavoriteItem(title: "Pirates of the Caribbean",
                     subtitle: "Gore Verbinski, 2007",
                     descriptionText: "Captain Jack Sparrow sets out to retrieve the Black Pearl and confront the villainous Captain Barbossa. The film established a unique blend of supernatural adventure, swashbuckling action, and witty humor. It is celebrated for Johnny Depp's iconic portrayal of Sparrow, which earned him global recognition and praise.",
                     review: "Adventure, humor, and action done right.",
                     image: UIImage(named: "pirates")!),

        FavoriteItem(title: "Avengers: Remastered",
                     subtitle: "Marvel Studios",
                     descriptionText: "This is a special edition release of the famous conclusion to the Infinity Saga, featuring enhanced graphics and sound mixing. The remaster focuses on improving visual clarity for modern high-definition displays, providing fans with a renewed viewing experience of the climactic battle. It retains all the key emotional moments and plot points of the original.",
                     review: "Special edition version.",
                     image: UIImage(named: "avengers")!),

        FavoriteItem(title: "Haikyuu OVA",
                     subtitle: "Production I.G",
                     descriptionText: "This Original Video Animation provides additional story details and character development not fully covered in the main anime series. The OVA focuses on the rivals' perspective and provides deeper context for future match-ups. It is essential viewing for dedicated fans who want more background on the volleyball teams.",
                     review: "Extra story of rivals.",
                     image: UIImage(named: "haikyuu")!),

        FavoriteItem(title: "Avatar Extended",
                     subtitle: "James Cameron",
                     descriptionText: "The extended cut of Avatar includes several minutes of added footage, mostly focusing on the Na'vi culture and the relationship between Jake Sully and Neytiri. These added scenes enrich the world-building and provide a deeper understanding of the conflict on Pandora. It’s the definitive edition for exploring the full scope of the story.",
                     review: "Added scenes and details.",
                     image: UIImage(named: "avatar")!),

        FavoriteItem(title: "Devil Returns",
                     subtitle: "Fashion Drama",
                     descriptionText: "This spin-off explores an alternate perspective of the events in the original fashion drama, focusing on a minor character's rise to power. It delves into the internal politics and high stakes of the industry from a fresh angle. The narrative provides new insight into the motivation and struggles of those who seek success in the competitive environment.",
                     review: "Alternate perspective story.",
                     image: UIImage(named: "devilWearsPrada")!),

        FavoriteItem(title: "Pirates: Battle at Sea",
                     subtitle: "Gore Verbinski",
                     descriptionText: "This installment ramps up the pirate action with massive naval battles and increased supernatural elements. The plot centers on a desperate hunt for a new, powerful artifact hidden deep within the Caribbean. It maintains the signature humor while expanding the lore and peril faced by Captain Jack Sparrow and his crew.",
                     review: "More pirate action.",
                     image: UIImage(named: "pirates")!)
    ]


    // --- Books 📚 ---
    static let books: [FavoriteItem] = [
        FavoriteItem(title: "Little Women",
                     subtitle: "Louisa May Alcott, 1868",
                     descriptionText: "A timeless novel that follows the lives of the four March sisters—Meg, Jo, Beth, and Amy—detailing their passage from childhood to womanhood. Set in Civil War-era America, the story explores themes of family, sacrifice, gender roles, and the pursuit of individual dreams. It remains a beloved classic worldwide and a staple of American literature.",
                     review: "Timeless story of sisterhood, family, and growing up.",
                     image: UIImage(named: "littleWomen") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "And Then There Were None",
            subtitle: "Agatha Christie, 1939",
            descriptionText: "Ten strangers, all with something to hide, are lured to a remote island mansion off the coast of Devon. They are mysteriously killed one by one, leading the remaining guests to realize that the killer is among them. This suspenseful novel is considered one of Christie's masterpieces and a cornerstone of the murder mystery genre.",
            review: "Renowned mystery novel about ten strangers with guilty secrets.",
            image: UIImage(named: "agatha") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "The Secret Garden",
            subtitle: "Frances Hodgson Burnett, 1911",
            descriptionText: "After Mary Lennox is orphaned, she is sent to live with her reclusive uncle in a large manor in England. She soon discovers a long-abandoned, mysterious secret garden on the grounds. Through her efforts to restore the garden, Mary also begins to heal emotionally and forms a bond with her sickly cousin. The novel beautifully connects physical health with emotional well-being.",
            review: "Beautiful tale of healing and transformation through nature.",
            image: UIImage(named: "theSecretGarden") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Flowers for Algernon",
            subtitle: "Daniel Keyes, 1966",
            descriptionText: "Charlie Gordon, a man with a low IQ, undergoes experimental surgery that dramatically increases his intelligence, mirroring the success seen in a lab mouse named Algernon. The narrative is presented as a series of progress reports detailing Charlie's transformation and his subsequent tragic realization about the nature of intelligence and humanity. It is a deeply moving and philosophical science fiction story.",
            review: "Heartbreaking story about intelligence, humanity, and growth.",
            image: UIImage(named: "flowersForAlgernon") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Me Before You",
            subtitle: "Jojo Moyes, 2012",
            descriptionText: "Louisa Clark is hired as a caregiver for Will Traynor, a wealthy young man who was paralyzed in an accident and has become cynical and depressed. Lou takes on the challenge of showing Will that life is still worth living, leading to an unexpected and emotional bond between them. The book explores complex themes surrounding quality of life, personal choices, and profound love.",
            review: "Emotional story about love and life choices.",
            image: UIImage(named: "meBeforeYou") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(title: "Little Women",
                     subtitle: "Louisa May Alcott, 1868",
                     descriptionText: "A timeless novel that follows the lives of the four March sisters—Meg, Jo, Beth, and Amy—detailing their passage from childhood to womanhood. Set in Civil War-era America, the story explores themes of family, sacrifice, gender roles, and the pursuit of individual dreams. It remains a beloved classic worldwide and a staple of American literature.",
                     review: "Timeless story of sisterhood, family, and growing up.",
                     image: UIImage(named: "littleWomen") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "And Then There Were None",
            subtitle: "Agatha Christie, 1939",
            descriptionText: "Ten strangers, all with something to hide, are lured to a remote island mansion off the coast of Devon. They are mysteriously killed one by one, leading the remaining guests to realize that the killer is among them. This suspenseful novel is considered one of Christie's masterpieces and a cornerstone of the murder mystery genre.",
            review: "Renowned mystery novel about ten strangers with guilty secrets.",
            image: UIImage(named: "agatha") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "The Secret Garden",
            subtitle: "Frances Hodgson Burnett, 1911",
            descriptionText: "After Mary Lennox is orphaned, she is sent to live with her reclusive uncle in a large manor in England. She soon discovers a long-abandoned, mysterious secret garden on the grounds. Through her efforts to restore the garden, Mary also begins to heal emotionally and forms a bond with her sickly cousin. The novel beautifully connects physical health with emotional well-being.",
            review: "Beautiful tale of healing and transformation through nature.",
            image: UIImage(named: "theSecretGarden") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Flowers for Algernon",
            subtitle: "Daniel Keyes, 1966",
            descriptionText: "Charlie Gordon, a man with a low IQ, undergoes experimental surgery that dramatically increases his intelligence, mirroring the success seen in a lab mouse named Algernon. The narrative is presented as a series of progress reports detailing Charlie's transformation and his subsequent tragic realization about the nature of intelligence and humanity. It is a deeply moving and philosophical science fiction story.",
            review: "Heartbreaking story about intelligence, humanity, and growth.",
            image: UIImage(named: "flowersForAlgernon") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Me Before You",
            subtitle: "Jojo Moyes, 2012",
            descriptionText: "Louisa Clark is hired as a caregiver for Will Traynor, a wealthy young man who was paralyzed in an accident and has become cynical and depressed. Lou takes on the challenge of showing Will that life is still worth living, leading to an unexpected and emotional bond between them. The book explores complex themes surrounding quality of life, personal choices, and profound love.",
            review: "Emotional story about love and life choices.",
            image: UIImage(named: "meBeforeYou") ?? UIImage(systemName: "photo")!
        )
    ]


    // --- Music 🎵 ---
    static let music: [FavoriteItem] = [
        FavoriteItem(
            title: "Woke Up",
            subtitle: "XG, 2025",
            descriptionText: "Woke Up is a 2024 single by Japanese girl group XG that features a unique blend of hip-hop and electronic elements. The song is known for its high-energy, confident lyrics and complex choreography showcased in the music video. It marks an evolution in the group's sound, pushing their global appeal with its powerful beat and delivery.",
            review: "Woke Up is a 2024 single by Japanese girl group XG. Catchy and energetic.",
            image: UIImage(named: "wokeUp") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Aiyptama",
            subtitle: "Ninety One, 2015",
            descriptionText: "This track is featured on the debut mini-album by the trailblazing Kazakh Q-pop group Ninety One, often cited as the song that defined the genre. The music video was known for its high production quality and polarizing fashion choices, establishing the group's bold identity. Lyrically, it addresses public criticism while maintaining self-confidence and artistry.",
            review: "Debut mini-album by Kazakh Q-pop group Ninety One.",
            image: UIImage(named: "aiyptama") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "One of your girls",
            subtitle: "The Weeknd, JENNIE, Lily-Rose Depp, 2023",
            descriptionText: "A popular hit song featured on the HBO series The Idol soundtrack, blending The Weeknd's signature R&B style with modern pop sensibilities. The song gained attention for its sensual production and the star-studded collaboration with JENNIE and Lily-Rose Depp. It quickly became one of the most recognizable tracks from the controversial series.",
            review: "Hit song featured on HBO series The Idol soundtrack.",
            image: UIImage(named: "oneOfYourGirls") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Can't Hold Us",
            subtitle: "Macklemore & Ryan Lewis, 2011",
            descriptionText: "This track is known for its infectious, high-energy beat and an optimistic 'us against the world' vibe, making it a popular anthem for motivation. The lyrics chronicle the duo's humble beginnings and rise to fame, celebrating independent success and community support. The accompanying music video is famous for its elaborate, adventurous, and globetrotting production.",
            review: "High-energy song with optimistic 'us against the world' vibe.",
            image: UIImage(named: "cantHoldUs") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Altynym",
            subtitle: "Aikyn Tolepbergen, 2013",
            descriptionText: "A widely popular Kazakh song characterized by its heartfelt melody and romantic, soulful vocal delivery. The lyrics center on themes of pure first love and adoration, resonating strongly with audiences across the region. It remains a staple slow dance track at many cultural celebrations and events in Kazakhstan.",
            review: "Popular Kazakh song about first love.",
            image: UIImage(named: "altynym") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Woke Up",
            subtitle: "XG, 2025",
            descriptionText: "Woke Up is a 2024 single by Japanese girl group XG that features a unique blend of hip-hop and electronic elements. The song is known for its high-energy, confident lyrics and complex choreography showcased in the music video. It marks an evolution in the group's sound, pushing their global appeal with its powerful beat and delivery.",
            review: "Woke Up is a 2024 single by Japanese girl group XG. Catchy and energetic.",
            image: UIImage(named: "wokeUp") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Aiyptama",
            subtitle: "Ninety One, 2015",
            descriptionText: "This track is featured on the debut mini-album by the trailblazing Kazakh Q-pop group Ninety One, often cited as the song that defined the genre. The music video was known for its high production quality and polarizing fashion choices, establishing the group's bold identity. Lyrically, it addresses public criticism while maintaining self-confidence and artistry.",
            review: "Debut mini-album by Kazakh Q-pop group Ninety One.",
            image: UIImage(named: "aiyptama") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "One of your girls",
            subtitle: "The Weeknd, JENNIE, Lily-Rose Depp, 2023",
            descriptionText: "A popular hit song featured on the HBO series The Idol soundtrack, blending The Weeknd's signature R&B style with modern pop sensibilities. The song gained attention for its sensual production and the star-studded collaboration with JENNIE and Lily-Rose Depp. It quickly became one of the most recognizable tracks from the controversial series.",
            review: "Hit song featured on HBO series The Idol soundtrack.",
            image: UIImage(named: "oneOfYourGirls") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Can't Hold Us",
            subtitle: "Macklemore & Ryan Lewis, 2011",
            descriptionText: "This track is known for its infectious, high-energy beat and an optimistic 'us against the world' vibe, making it a popular anthem for motivation. The lyrics chronicle the duo's humble beginnings and rise to fame, celebrating independent success and community support. The accompanying music video is famous for its elaborate, adventurous, and globetrotting production.",
            review: "High-energy song with optimistic 'us against the world' vibe.",
            image: UIImage(named: "cantHoldUs") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Altynym",
            subtitle: "Aikyn Tolepbergen, 2013",
            descriptionText: "A widely popular Kazakh song characterized by its heartfelt melody and romantic, soulful vocal delivery. The lyrics center on themes of pure first love and adoration, resonating strongly with audiences across the region. It remains a staple slow dance track at many cultural celebrations and events in Kazakhstan.",
            review: "Popular Kazakh song about first love.",
            image: UIImage(named: "altynym") ?? UIImage(systemName: "photo")!
        )
    ]


    // --- Courses 🎓 ---
    static let courses: [FavoriteItem] = [
        FavoriteItem(
            title: "iOS Development",
            subtitle: "KBTU, 2025",
            descriptionText: "This comprehensive course covers fundamental iOS development concepts using Swift and the UIKit framework. Students learn to implement core UI components, master Auto Layout for adaptive interfaces, and integrate essential features like navigation and data persistence. The main goal is for students to build several fully functional, real-world applications.",
            review: "Learned UIKit, Auto Layout, and built working apps.",
            image: UIImage(named: "ios") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Calculus",
            subtitle: "KBTU, 2023",
            descriptionText: "Calculus is a fundamental course focusing on the concepts of limits, derivatives, integrals, and infinite series. It provides the essential mathematical framework for understanding change and motion in science and engineering. While challenging, mastering these principles is crucial for advanced studies in any technical field and for problem-solving.",
            review: "Challenging but rewarding course in mathematics.",
            image: UIImage(named: "calculus") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Linear Algebra",
            subtitle: "KBTU, 2024",
            descriptionText: "Linear Algebra explores vector spaces, matrices, and linear transformations, forming the bedrock of modern computing, graphics, and data science. Students learn techniques for solving systems of linear equations and understanding the geometry of high-dimensional space. The course emphasizes both theoretical understanding and practical application in algorithms.",
            review: "Vectors, matrices, and transformations explained clearly.",
            image: UIImage(named: "linearAlgebra") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Algorithms and Data Structures",
            subtitle: "KBTU, 2025",
            descriptionText: "This critical course focuses on designing efficient methods for organizing and processing data, covering topics like arrays, linked lists, trees, graphs, and sorting algorithms. Emphasis is placed on analyzing time complexity (Big O notation) and selecting the optimal structure for different problem-solving scenarios. It is fundamental for improving code performance and effectiveness.",
            review: "Fundamental course teaching efficient coding and problem-solving.",
            image: UIImage(named: "algorithms") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Web Development",
            subtitle: "KBTU, 2025",
            descriptionText: "An introductory course providing a solid foundation in front-end web technologies, including HTML, CSS, and JavaScript. Students learn to build responsive, visually appealing websites and are introduced to modern frameworks like React or Vue. The curriculum covers the entire process from conceptual design to deployment, preparing students for practical web projects.",
            review: "Introduction to HTML, CSS, JS, and modern frameworks.",
            image: UIImage(named: "WebDev") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "iOS Development",
            subtitle: "KBTU, 2025",
            descriptionText: "This comprehensive course covers fundamental iOS development concepts using Swift and the UIKit framework. Students learn to implement core UI components, master Auto Layout for adaptive interfaces, and integrate essential features like navigation and data persistence. The main goal is for students to build several fully functional, real-world applications.",
            review: "Learned UIKit, Auto Layout, and built working apps.",
            image: UIImage(named: "ios") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Calculus",
            subtitle: "KBTU, 2023",
            descriptionText: "Calculus is a fundamental course focusing on the concepts of limits, derivatives, integrals, and infinite series. It provides the essential mathematical framework for understanding change and motion in science and engineering. While challenging, mastering these principles is crucial for advanced studies in any technical field and for problem-solving.",
            review: "Challenging but rewarding course in mathematics.",
            image: UIImage(named: "calculus") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Linear Algebra",
            subtitle: "KBTU, 2024",
            descriptionText: "Linear Algebra explores vector spaces, matrices, and linear transformations, forming the bedrock of modern computing, graphics, and data science. Students learn techniques for solving systems of linear equations and understanding the geometry of high-dimensional space. The course emphasizes both theoretical understanding and practical application in algorithms.",
            review: "Vectors, matrices, and transformations explained clearly.",
            image: UIImage(named: "linearAlgebra") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Algorithms and Data Structures",
            subtitle: "KBTU, 2025",
            descriptionText: "This critical course focuses on designing efficient methods for organizing and processing data, covering topics like arrays, linked lists, trees, graphs, and sorting algorithms. Emphasis is placed on analyzing time complexity (Big O notation) and selecting the optimal structure for different problem-solving scenarios. It is fundamental for improving code performance and effectiveness.",
            review: "Fundamental course teaching efficient coding and problem-solving.",
            image: UIImage(named: "algorithms") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Web Development",
            subtitle: "KBTU, 2025",
            descriptionText: "An introductory course providing a solid foundation in front-end web technologies, including HTML, CSS, and JavaScript. Students learn to build responsive, visually appealing websites and are introduced to modern frameworks like React or Vue. The curriculum covers the entire process from conceptual design to deployment, preparing students for practical web projects.",
            review: "Introduction to HTML, CSS, JS, and modern frameworks.",
            image: UIImage(named: "WebDev") ?? UIImage(systemName: "photo")!
        )
    ]
}
