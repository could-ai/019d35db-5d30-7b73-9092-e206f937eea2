import 'package:flutter/material.dart';

void main() {
  runApp(const CVApp());
}

class CVApp extends StatelessWidget {
  const CVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My CV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto', // Default clean font
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CVScreen(),
      },
    );
  }
}

class CVScreen extends StatelessWidget {
  const CVScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
            children: [
              _buildHeader(context),
              const SizedBox(height: 32),
              _buildSectionTitle(context, 'Professional Summary'),
              const SizedBox(height: 12),
              _buildSummary(),
              const SizedBox(height: 32),
              _buildSectionTitle(context, 'Experience'),
              const SizedBox(height: 16),
              _buildExperienceItem(
                context,
                role: 'Senior Flutter Developer',
                company: 'Tech Solutions Inc.',
                period: 'Jan 2021 - Present',
                description:
                    'Lead the development of cross-platform mobile applications using Flutter. Architected scalable state management solutions and mentored junior developers. Improved app performance by 40%.',
              ),
              const SizedBox(height: 16),
              _buildExperienceItem(
                context,
                role: 'Mobile App Developer',
                company: 'Creative App Studio',
                period: 'Jun 2018 - Dec 2020',
                description:
                    'Developed and maintained multiple iOS and Android applications. Collaborated with UI/UX designers to implement pixel-perfect designs. Integrated RESTful APIs and third-party services.',
              ),
              const SizedBox(height: 32),
              _buildSectionTitle(context, 'Education'),
              const SizedBox(height: 16),
              _buildEducationItem(
                context,
                degree: 'Bachelor of Science in Computer Science',
                institution: 'University of Technology',
                period: '2014 - 2018',
              ),
              const SizedBox(height: 32),
              _buildSectionTitle(context, 'Skills'),
              const SizedBox(height: 16),
              _buildSkills(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundColor: Colors.blueGrey,
          child: Icon(
            Icons.person,
            size: 80,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Alex Johnson',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Software Engineer & Mobile Developer',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 8,
          children: [
            _buildContactInfo(Icons.email, 'alex.johnson@example.com'),
            _buildContactInfo(Icons.phone, '+1 (555) 123-4567'),
            _buildContactInfo(Icons.location_on, 'San Francisco, CA'),
            _buildContactInfo(Icons.link, 'linkedin.com/in/alexjohnson'),
          ],
        ),
      ],
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        const SizedBox(height: 8),
        Divider(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          thickness: 2,
        ),
      ],
    );
  }

  Widget _buildSummary() {
    return const Text(
      'Passionate and results-driven Software Engineer with over 5 years of experience in mobile application development. Specialized in Flutter and Dart, with a strong background in native Android and iOS development. Adept at building scalable, high-performance applications and collaborating with cross-functional teams to deliver exceptional user experiences.',
      style: TextStyle(fontSize: 16, height: 1.5),
    );
  }

  Widget _buildExperienceItem(
    BuildContext context, {
    required String role,
    required String company,
    required String period,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline dot and line could go here, keeping it simple for now
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        role,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      period,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  company,
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 15, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationItem(
    BuildContext context, {
    required String degree,
    required String institution,
    required String period,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                degree,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              period,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          institution,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildSkills() {
    final skills = [
      'Flutter',
      'Dart',
      'Swift',
      'Kotlin',
      'Firebase',
      'REST APIs',
      'Git',
      'Agile/Scrum',
      'UI/UX Design',
      'State Management (Provider, Bloc)',
    ];

    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: skills.map((skill) {
        return Chip(
          label: Text(skill),
          backgroundColor: Colors.blueGrey.withOpacity(0.1),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }).toList(),
    );
  }
}
