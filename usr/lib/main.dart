import 'package:flutter/material.dart';

void main() {
  runApp(const CVApp());
}

class CVApp extends StatelessWidget {
  const CVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pragya Parashar - CV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
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
              _buildSectionTitle(context, 'Education'),
              const SizedBox(height: 16),
              _buildEducationItem(
                context,
                degree: 'MSc Mathematics',
                institution: 'Completed',
                period: '2022',
              ),
              const SizedBox(height: 16),
              _buildEducationItem(
                context,
                degree: 'BSc Computer Application',
                institution: 'Completed',
                period: '2020',
              ),
              const SizedBox(height: 32),
              _buildSectionTitle(context, 'Internship & Experience'),
              const SizedBox(height: 16),
              _buildExperienceItem(
                context,
                role: 'Intern',
                company: 'Govt Polytechnic College, Sagar',
                period: 'Internship',
                description:
                    'Gained practical exposure and applied technical and analytical skills in an educational and institutional environment. Demonstrated strong teamwork and time management capabilities.',
              ),
              const SizedBox(height: 32),
              _buildSectionTitle(context, 'Academic Projects'),
              const SizedBox(height: 16),
              _buildExperienceItem(
                context,
                role: 'Mathematical Modeling & Analysis',
                company: 'Project: Laplace Equation',
                period: 'Academic',
                description:
                    'Conducted in-depth study and problem-solving focused on the Laplace equation. Utilized advanced quantitative and analytical skills to explore mathematical applications relevant to science and engineering.',
              ),
              const SizedBox(height: 32),
              _buildSectionTitle(context, 'Certifications'),
              const SizedBox(height: 16),
              _buildCertificationItem(
                context,
                title: 'Certification in Digital Banking',
                issuer: 'Upgrade',
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
          backgroundColor: Colors.teal,
          child: Text(
            'PP',
            style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Pragya Parashar',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Aspiring IT & Banking Professional',
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
            _buildContactInfo(Icons.email, 'pragya@example.com'),
            _buildContactInfo(Icons.phone, '+91 XXXXX XXXXX'),
            _buildContactInfo(Icons.location_on, 'India'),
            _buildContactInfo(Icons.link, 'linkedin.com/in/pragyaparashar'),
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
      'Highly motivated and hardworking fresher with a strong science and mathematics background. Holding an MSc in Mathematics and a BSc in Computer Applications. Eager to leverage my quantitative, data analysis, and problem-solving skills in a dynamic role within a Private Bank or IT Company. Known for excellent relationship building, time management, and a collaborative team-player mindset.',
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

  Widget _buildCertificationItem(
    BuildContext context, {
    required String title,
    required String issuer,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.verified, color: Theme.of(context).colorScheme.primary, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                issuer,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSkills() {
    final skills = [
      'Quantitative & Analytical Skills',
      'Data Analysis',
      'Problem Solving',
      'Relationship Building',
      'Time Management',
      'Teamwork',
      'Hardworking',
      'Mathematics & Computing',
    ];

    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: skills.map((skill) {
        return Chip(
          label: Text(skill),
          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }).toList(),
    );
  }
}
