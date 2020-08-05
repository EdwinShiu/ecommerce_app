// Temporary Storage of App Data

int favorite_item_number = 0;

const List<Map> newItemImages = [{'imagePath': 'assets/images/WM1Z_walkman.jpg', 'itemName': 'WM1Z Walkman'},
                      {'imagePath': 'assets/images/WM1A_walkman.jpg', 'itemName': 'WM1A Walkman'},
                      {'imagePath': 'assets/images/ZX500_walkman.jpg', 'itemName': 'ZX500 Walkman'},
                      {'imagePath': 'assets/images/ZX300_walkman.jpg', 'itemName': 'ZX300 Walkman'},
                      {'imagePath': 'assets/images/A100_walkman.jpg', 'itemName': 'A100 Walkman'}, 
                      ];

const List<List<Map>> categoryImage = [[{'imagePath': 'assets/images/Television_01.png', 'itemName': 'Televisions'},
                                        {'imagePath': 'assets/images/SoundBar_01.png', 'itemName': 'Home Theater & Sound Bars'},
                                        {'imagePath': 'assets/images/BluRay_01.png', 'itemName': 'Blu-Ray Disc & DVD Players'}],
                                       [{'imagePath': 'assets/images/Headphones_01.png', 'itemName': 'Headphones'},
                                        {'imagePath': 'assets/images/MP3Player_01.png', 'itemName': 'MP3 Players'},
                                        {'imagePath': 'assets/images/High-ResolutionAudio_01.png', 'itemName': 'High-Resolution Audio'},
                                        {'imagePath': 'assets/images/WirelessSpeakers_01.png', 'itemName': 'Wireless Speakers'},],
                                       [{'imagePath': 'assets/images/Interchangeable-lensCameras_01.png', 'itemName': 'Interchangable-lens Cameras'},
                                        {'imagePath': 'assets/images/Lenses_01.png', 'itemName': 'Lenses'},
                                        {'imagePath': 'assets/images/CompactCameras_01.png', 'itemName': 'Compact Cameras'},],
                                       [{'imagePath': 'assets/images/Smartphones_01.png', 'itemName': 'Smartphones'},
                                        {'imagePath': 'assets/images/SmartphonesAccessories_01.png', 'itemName': 'Accessories'},],
                                       [{'imagePath': 'assets/images/Camcorders_01.png', 'itemName': 'Camcorders'},
                                        {'imagePath': 'assets/images/ActionCamera_01.png', 'itemName': 'Action Cameras'},
                                        {'imagePath': 'assets/images/ProfessionalCamcorders_01.png', 'itemName': 'Professional Camcorders'},],
                                       [{'imagePath': 'assets/images/MemoryCardsSSD_01.png', 'itemName': 'Memory Cards & SSD'},
                                        {'imagePath': 'assets/images/Cables_01.png', 'itemName': 'Cables'},],
                                       [{'imagePath': 'assets/images/FashionEntertainments_01.png', 'itemName': 'Fashion Entertainments'},]
                                      ];


const List<List<String>> categories = [['Televisions & Home Cinema', 'Televisions', 'Home Theater & Sound Bar', 'Blu-ray Disc & DVD Player'],
                   ['Audio', 'Headphones', 'MP3 Players', 'High-Resolution Audio', 'Wireless Speakers'],
                   ['Cameras', 'Interchangable-lens Cameras', 'Lenses', 'Compact Cameras'],
                   ['Mobile', 'Smartphones', 'Accessories'],
                   ['Video Cameras', 'Camcorders', 'Action Cameras', 'Professional Camcorders'],
                   ['Storage & Cables', 'Memory Cards & SSD', 'Cables'],
                   ['New Categories', 'Fashion Entertainments'],
                   ]; 