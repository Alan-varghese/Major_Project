import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LawyerListScreen(),
    );
  }
}

class LawyerListScreen extends StatelessWidget {
  LawyerListScreen({super.key});

  // Sample list of lawyers with more details
  final List<Map<String, String>> lawyers = [
    {
      'name': 'Advocate Archana K Chandran',
      'specialization': 'General Law',
      'location': 'Kasaragod, Kerala',
      'contact': '+917907452174',
      'education': 'L.L.B (3 year)',
      'experience':
          '7+ years of experience in Civil, Criminal, Family, Banking, Consumer.',
      'bio':
          'Adv. Archana is a practicing lawyer at Hosdurg Court since 2018. She is enrolled with the Bar Council of Kerala. She has done her LLB and LLM in 2018 and 2021 respectively. Apart from that she has completed her diploma course in Criminology and Forensic Sciences. She has also done Certificate Course on Cyber law in 2016. She deals with all sorts of legal matters may it be Civil, Criminal, Family, Banking, and service matters.',
      'imageUrl': 'assets/images/archana.png', // Path to image in assets
    },
    {
      'name': 'Advocate Raju Abraham',
      'specialization': 'General Law, Consumer Law, Real State Law',
      'location': 'Kottayam, Kerala',
      'contact': '+919947805231',
      'education': 'L.L.B,L.L.M ',
      'experience': '8+ years of experience in civil disputes and contracts.',
      'bio':
          'Advocate Raju Abraham is an experienced lawyer practicing in various courts of Kottayam District, specifically in family, civil, criminal, banking, motor accident claims, labor law areas. He has experience with more than 300 sessions cases. He was also a former secretary of Bar Association, Kottayam and is now the State Executive member of Kerala Bar Federation. He is also the legal advisor of Regional Farmers Service Cooperative Bank Ltd. Anikkadu, Service Cooperative Bank Kanjiramattam and Service Cooperative Bank Akalakkunnam. He has been a Council for Kerala Khadi and Village Industries Board and Kerala Bank.',
      'imageUrl': 'assets/images/raju.png', // URL to online image
    },
    {
      'name': 'Advocate Sreelekha P Sreeniwas',
      'specialization': 'Civil, Criminal',
      'location': 'Kochi, Kerala',
      'contact': '+919567830689',
      'education': 'L.L.B (3 year)',
      'experience': '5+ years of experience in civil, criminal legal matters.',
      'bio':
          'Sreelekha is a practicing Advocate at Kerala High Court. Her core expertise is in matters related to Civil Law. She also deals with Criminal matters. She is enrolled with the Bar Council of Kerala since 2019.',
      'imageUrl': 'assets/images/sreelekha.png', // URL to online image
    },
    {
      'name': 'Advocate Anupama Sibi',
      'specialization': 'Civil, Criminal, Family, Corporate, Property',
      'location': 'Ernakulam, Kerala',
      'contact': '+916238219658',
      'education': 'L.L.B (3 year),L.L.M',
      'experience': '6+ years of experience in Criminal Law.',
      'bio':
          'Anupama Sibi is a Practicing Lawyer in High Court Ernakulam. She is enrolled with the Bar Council of Kerala since 2019. Her specialization areas are Civil, Criminal, Family, Real Estate, Corporate, Service and High Court matters.',
      'imageUrl': 'assets/images/anupama.png', // URL to online image
    },
    // Add more lawyers here with updated details
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Lawyers'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search by name, location, or specialization',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                // Implement search functionality here
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: lawyers.length,
                itemBuilder: (context, index) {
                  return LawyerCard(
                    name: lawyers[index]['name']!,
                    specialization: lawyers[index]['specialization']!,
                    location: lawyers[index]['location']!,
                    contact: lawyers[index]['contact']!,
                    education: lawyers[index]['education']!,
                    experience: lawyers[index]['experience']!,
                    bio: lawyers[index]['bio']!,
                    imageUrl: lawyers[index]['imageUrl']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LawyerCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String location;
  final String contact;
  final String education;
  final String experience;
  final String bio;
  final String imageUrl;

  const LawyerCard({
    super.key,
    required this.name,
    required this.specialization,
    required this.location,
    required this.contact,
    required this.education,
    required this.experience,
    required this.bio,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 6,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LawyerProfileScreen(
                name: name,
                contact: contact,
                education: education,
                experience: experience,
                bio: bio,
                imageUrl: imageUrl,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: imageUrl.startsWith('http')
                    ? NetworkImage(imageUrl) // Load image from network
                    : AssetImage(imageUrl)
                        as ImageProvider, // Load image from assets
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(specialization,
                        style: const TextStyle(color: Colors.grey)),
                    Text(location,
                        style: const TextStyle(color: Colors.blueAccent)),
                    const SizedBox(height: 5),
                    Text('Education: $education',
                        style: const TextStyle(fontSize: 12)),
                    Text('Experience: $experience',
                        style: const TextStyle(fontSize: 12)),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LawyerProfileScreen(
                              name: name,
                              contact: contact,
                              education: education,
                              experience: experience,
                              bio: bio,
                              imageUrl: imageUrl,
                            ),
                          ),
                        );
                      },
                      child: const Text('Contact Lawyer'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class LawyerProfileScreen extends StatelessWidget {
  final String name;
  final String contact;
  final String education;
  final String experience;
  final String bio;
  final String imageUrl;

  const LawyerProfileScreen({
    super.key,
    required this.name,
    required this.contact,
    required this.education,
    required this.experience,
    required this.bio,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Lawyer's image
              CircleAvatar(
                radius: 60,
                backgroundImage: imageUrl.startsWith('http')
                    ? NetworkImage(imageUrl)
                    : AssetImage(imageUrl) as ImageProvider,
              ),
              const SizedBox(height: 20),

              // Name
              Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),

              // Contact
              Text(
                contact,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 20),

              // Information container
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Education
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.school, color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Education: $education',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Experience
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.work, color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Experience: $experience',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Bio
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.info, color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Bio: $bio',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
