import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MedAppointmentApp());
}

// ==================== THEME & APP ====================

class MedAppointmentApp extends StatelessWidget {
  const MedAppointmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedBook - Medical Appointment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
          primary: const Color(0xFF2563EB),
          secondary: const Color(0xFF10B981),
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

// ==================== DATA MODELS ====================

enum AppointmentStatus { pending, confirmed, completed, cancelled }

class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String imageUrl;
  final double rating;
  final int experienceYears;
  final String about;
  final List<String> availableDays;
  final List<String> availableTimeSlots;
  final double consultationFee;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.rating,
    required this.experienceYears,
    required this.about,
    required this.availableDays,
    required this.availableTimeSlots,
    required this.consultationFee,
  });
}

class Appointment {
  final String id;
  final Doctor doctor;
  final DateTime date;
  final String timeSlot;
  final AppointmentStatus status;
  final String? notes;

  Appointment({
    required this.id,
    required this.doctor,
    required this.date,
    required this.timeSlot,
    this.status = AppointmentStatus.pending,
    this.notes,
  });
}

class UserProfile {
  String name;
  String email;
  String phone;
  String bloodType;
  String age;
  String gender;

  UserProfile({
    this.name = 'John Doe',
    this.email = 'john.doe@email.com',
    this.phone = '+1 234 567 890',
    this.bloodType = 'O+',
    this.age = '28',
    this.gender = 'Male',
  });
}

// ==================== MOCK DATA ====================

final List<Doctor> mockDoctors = [
  Doctor(
    id: '1',
    name: 'Dr. Sarah Johnson',
    specialty: 'Cardiologist',
    imageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
    rating: 4.9,
    experienceYears: 12,
    about: 'Board-certified cardiologist specializing in preventive cardiology and heart failure management. Dr. Johnson has published over 30 research papers in peer-reviewed journals.',
    availableDays: ['Mon', 'Tue', 'Wed', 'Fri'],
    availableTimeSlots: ['09:00 AM', '10:00 AM', '11:00 AM', '02:00 PM', '03:00 PM', '04:00 PM'],
    consultationFee: 150.0,
  ),
  Doctor(
    id: '2',
    name: 'Dr. Michael Chen',
    specialty: 'Dermatologist',
    imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
    rating: 4.8,
    experienceYears: 8,
    about: 'Expert in cosmetic dermatology, acne treatment, and skin cancer screening. Dr. Chen uses the latest laser and minimally invasive techniques.',
    availableDays: ['Mon', 'Wed', 'Thu', 'Sat'],
    availableTimeSlots: ['09:30 AM', '10:30 AM', '11:30 AM', '01:00 PM', '02:30 PM', '04:00 PM'],
    consultationFee: 120.0,
  ),
  Doctor(
    id: '3',
    name: 'Dr. Emily Williams',
    specialty: 'Pediatrician',
    imageUrl: 'https://randomuser.me/api/portraits/women/68.jpg',
    rating: 4.9,
    experienceYears: 15,
    about: 'Dedicated pediatrician with a gentle approach. Specializes in childhood development, allergies, and adolescent medicine.',
    availableDays: ['Tue', 'Wed', 'Thu', 'Fri'],
    availableTimeSlots: ['08:00 AM', '09:00 AM', '10:00 AM', '11:00 AM', '01:00 PM', '02:00 PM'],
    consultationFee: 100.0,
  ),
  Doctor(
    id: '4',
    name: 'Dr. Robert Martinez',
    specialty: 'Orthopedic Surgeon',
    imageUrl: 'https://randomuser.me/api/portraits/men/85.jpg',
    rating: 4.7,
    experienceYears: 20,
    about: 'Specialist in sports medicine, joint replacement, and minimally invasive arthroscopic surgery. Former team physician for professional athletes.',
    availableDays: ['Mon', 'Tue', 'Thu', 'Fri'],
    availableTimeSlots: ['10:00 AM', '11:00 AM', '12:00 PM', '02:00 PM', '03:00 PM', '05:00 PM'],
    consultationFee: 200.0,
  ),
  Doctor(
    id: '5',
    name: 'Dr. Lisa Anderson',
    specialty: 'Neurologist',
    imageUrl: 'https://randomuser.me/api/portraits/women/33.jpg',
    rating: 4.8,
    experienceYears: 14,
    about: 'Neurologist specializing in headaches, epilepsy, and neurodegenerative disorders. Board-certified in neurology and clinical neurophysiology.',
    availableDays: ['Mon', 'Wed', 'Fri'],
    availableTimeSlots: ['09:00 AM', '11:00 AM', '01:00 PM', '03:00 PM', '04:00 PM'],
    consultationFee: 180.0,
  ),
  Doctor(
    id: '6',
    name: 'Dr. James Wilson',
    specialty: 'General Practitioner',
    imageUrl: 'https://randomuser.me/api/portraits/men/11.jpg',
    rating: 4.6,
    experienceYears: 10,
    about: 'Family medicine physician providing comprehensive primary care. Focuses on preventive medicine and chronic disease management.',
    availableDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
    availableTimeSlots: ['08:30 AM', '09:30 AM', '10:30 AM', '11:30 AM', '01:30 PM', '02:30 PM', '03:30 PM', '04:30 PM'],
    consultationFee: 80.0,
  ),
  Doctor(
    id: '7',
    name: 'Dr. Amanda Lee',
    specialty: 'Gynecologist',
    imageUrl: 'https://randomuser.me/api/portraits/women/22.jpg',
    rating: 4.9,
    experienceYears: 11,
    about: 'Board-certified OB/GYN with expertise in minimally invasive gynecologic surgery, fertility, and women\'s wellness.',
    availableDays: ['Tue', 'Wed', 'Thu', 'Sat'],
    availableTimeSlots: ['09:00 AM', '10:00 AM', '11:00 AM', '01:00 PM', '02:00 PM', '03:00 PM'],
    consultationFee: 160.0,
  ),
  Doctor(
    id: '8',
    name: 'Dr. David Kim',
    specialty: 'Psychiatrist',
    imageUrl: 'https://randomuser.me/api/portraits/men/55.jpg',
    rating: 4.8,
    experienceYears: 13,
    about: 'Psychiatrist specializing in anxiety disorders, depression, and ADHD. Provides both medication management and therapeutic interventions.',
    availableDays: ['Mon', 'Tue', 'Thu', 'Fri'],
    availableTimeSlots: ['10:00 AM', '11:00 AM', '01:00 PM', '02:00 PM', '03:00 PM', '04:00 PM'],
    consultationFee: 170.0,
  ),
];

// ==================== STATE MANAGEMENT ====================

class AppState extends ChangeNotifier {
  static final AppState _instance = AppState._internal();
  factory AppState() => _instance;
  AppState._internal();

  final List<Appointment> _appointments = [];
  final UserProfile _userProfile = UserProfile();
  String _searchQuery = '';
  String _selectedSpecialty = 'All';

  List<Appointment> get appointments => List.unmodifiable(_appointments);
  UserProfile get userProfile => _userProfile;
  String get searchQuery => _searchQuery;
  String get selectedSpecialty => _selectedSpecialty;

  List<Appointment> get upcomingAppointments {
    final now = DateTime.now();
    return _appointments
        .where((a) => a.date.isAfter(now) && a.status != AppointmentStatus.cancelled)
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));
  }

  List<Appointment> get pastAppointments {
    final now = DateTime.now();
    return _appointments
        .where((a) => a.date.isBefore(now) || a.status == AppointmentStatus.completed)
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date));
  }

  List<Doctor> get filteredDoctors {
    return mockDoctors.where((doctor) {
      final matchesSearch = doctor.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          doctor.specialty.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesSpecialty = _selectedSpecialty == 'All' || doctor.specialty == _selectedSpecialty;
      return matchesSearch && matchesSpecialty;
    }).toList();
  }

  List<String> get specialties {
    final specs = mockDoctors.map((d) => d.specialty).toSet().toList();
    specs.sort();
    return ['All', ...specs];
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setSelectedSpecialty(String specialty) {
    _selectedSpecialty = specialty;
    notifyListeners();
  }

  void bookAppointment(Appointment appointment) {
    _appointments.add(appointment);
    notifyListeners();
  }

  void cancelAppointment(String id) {
    final index = _appointments.indexWhere((a) => a.id == id);
    if (index != -1) {
      final old = _appointments[index];
      _appointments[index] = Appointment(
        id: old.id,
        doctor: old.doctor,
        date: old.date,
        timeSlot: old.timeSlot,
        status: AppointmentStatus.cancelled,
        notes: old.notes,
      );
      notifyListeners();
    }
  }

  void updateProfile(UserProfile profile) {
    _userProfile.name = profile.name;
    _userProfile.email = profile.email;
    _userProfile.phone = profile.phone;
    _userProfile.bloodType = profile.bloodType;
    _userProfile.age = profile.age;
    _userProfile.gender = profile.gender;
    notifyListeners();
  }
}

// ==================== MAIN NAVIGATION ====================

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const DoctorsScreen(),
    const AppointmentsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search_outlined), selectedIcon: Icon(Icons.search), label: 'Doctors'),
          NavigationDestination(icon: Icon(Icons.calendar_today_outlined), selectedIcon: Icon(Icons.calendar_today), label: 'Appointments'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// ==================== HOME SCREEN ====================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppState();
    final upcoming = state.upcomingAppointments;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, ${state.userProfile.name.split(' ').first}!',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'How are you feeling today?',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.grey[600],
                                ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                        child: Icon(
                          Icons.person,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Quick Stats
                  Row(
                    children: [
                      _buildStatCard(
                        context,
                        icon: Icons.favorite,
                        color: Colors.red,
                        label: 'Heart Rate',
                        value: '72 bpm',
                      ),
                      const SizedBox(width: 12),
                      _buildStatCard(
                        context,
                        icon: Icons.water_drop,
                        color: Colors.blue,
                        label: 'Blood Type',
                        value: state.userProfile.bloodType,
                      ),
                      const SizedBox(width: 12),
                      _buildStatCard(
                        context,
                        icon: Icons.local_fire_department,
                        color: Colors.orange,
                        label: 'Age',
                        value: state.userProfile.age,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Upcoming Appointment Card
                  if (upcoming.isNotEmpty) ...[
                    Text(
                      'Upcoming Appointment',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12),
                    _buildUpcomingAppointmentCard(context, upcoming.first),
                    const SizedBox(height: 24),
                  ],

                  // Find Doctor Section
                  Text(
                    'Find a Doctor',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),

          // Specialties Horizontal List
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildSpecialtyChip(context, Icons.favorite, 'Cardiologist', Colors.red),
                  _buildSpecialtyChip(context, Icons.face, 'Dermatologist', Colors.purple),
                  _buildSpecialtyChip(context, Icons.child_care, 'Pediatrician', Colors.orange),
                  _buildSpecialtyChip(context, Icons.sports, 'Orthopedic', Colors.green),
                  _buildSpecialtyChip(context, Icons.psychology, 'Neurologist', Colors.indigo),
                  _buildSpecialtyChip(context, Icons.local_hospital, 'General', Colors.teal),
                  _buildSpecialtyChip(context, Icons.pregnant_woman, 'Gynecologist', Colors.pink),
                  _buildSpecialtyChip(context, Icons.psychology_alt, 'Psychiatrist', Colors.deepPurple),
                ],
              ),
            ),
          ),

          // Top Doctors
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Doctors',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to doctors tab
                    },
                    child: const Text('See All'),
                  ),
                ],
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final doctor = mockDoctors[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: DoctorListCard(doctor: doctor),
                );
              },
              childCount: mockDoctors.length,
            ),
          ),

          const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, {
    required IconData icon,
    required Color color,
    required String label,
    required String value,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialtyChip(BuildContext context, IconData icon, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: () {
          // Could navigate to filtered doctors
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 80,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingAppointmentCard(BuildContext context, Appointment appointment) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary.withBlue(200),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(appointment.doctor.imageUrl),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.doctor.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      appointment.doctor.specialty,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  appointment.status.name.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.white.withOpacity(0.9), size: 20),
                const SizedBox(width: 8),
                Text(
                  DateFormat('EEEE, MMM d').format(appointment.date),
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                ),
                const SizedBox(width: 20),
                Icon(Icons.access_time, color: Colors.white.withOpacity(0.9), size: 20),
                const SizedBox(width: 8),
                Text(
                  appointment.timeSlot,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== DOCTORS SCREEN ====================

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = AppState();
    final doctors = state.filteredDoctors;
    final specialties = state.specialties;

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Find Your Doctor',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _searchController,
                  onChanged: state.setSearchQuery,
                  decoration: InputDecoration(
                    hintText: 'Search doctors, specialties...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              state.setSearchQuery('');
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: specialties.length,
                    itemBuilder: (context, index) {
                      final specialty = specialties[index];
                      final isSelected = state.selectedSpecialty == specialty;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          selected: isSelected,
                          label: Text(specialty),
                          onSelected: (_) => state.setSelectedSpecialty(specialty),
                          selectedColor: Theme.of(context).colorScheme.primaryContainer,
                          checkmarkColor: Theme.of(context).colorScheme.primary,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: doctors.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          'No doctors found',
                          style: TextStyle(color: Colors.grey[600], fontSize: 16),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: DoctorListCard(doctor: doctors[index]),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// ==================== DOCTOR LIST CARD ====================

class DoctorListCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorListCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoctorDetailScreen(doctor: doctor),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Hero(
                tag: 'doctor-${doctor.id}',
                child: CircleAvatar(
                  radius: 36,
                  backgroundImage: NetworkImage(doctor.imageUrl),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      doctor.specialty,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber[600]),
                        const SizedBox(width: 4),
                        Text(
                          '${doctor.rating}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(Icons.work_outline, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          '${doctor.experienceYears} yrs',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${doctor.consultationFee.toInt()}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorDetailScreen(doctor: doctor),
                        ),
                      );
                    },
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(80, 36),
                    ),
                    child: const Text('Book'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== DOCTOR DETAIL SCREEN ====================

class DoctorDetailScreen extends StatelessWidget {
  final Doctor doctor;

  const DoctorDetailScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primary.withOpacity(0.8),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'doctor-${doctor.id}',
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(doctor.imageUrl),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      doctor.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      doctor.specialty,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDetailChip(Icons.star, '${doctor.rating}', Colors.amber),
                        const SizedBox(width: 12),
                        _buildDetailChip(Icons.work, '${doctor.experienceYears} yrs exp', Colors.white70),
                        const SizedBox(width: 12),
                        _buildDetailChip(Icons.attach_money, '${doctor.consultationFee}', Colors.greenAccent),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    doctor.about,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Available Days',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children: doctor.availableDays.map((day) {
                      return Chip(
                        label: Text(day),
                        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingScreen(doctor: doctor),
                          ),
                        );
                      },
                      icon: const Icon(Icons.calendar_today),
                      label: const Text('Book Appointment'),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

// ==================== BOOKING SCREEN ====================

class BookingScreen extends StatefulWidget {
  final Doctor doctor;

  const BookingScreen({super.key, required this.doctor});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? _selectedDate;
  String? _selectedTimeSlot;
  final TextEditingController _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Doctor Summary
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(widget.doctor.imageUrl),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.doctor.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(widget.doctor.specialty),
                                const SizedBox(height: 4),
                                Text(
                                  '\$${widget.doctor.consultationFee.toInt()} per visit',
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Date Selection
                  Text(
                    'Select Date',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 14,
                      itemBuilder: (context, index) {
                        final date = now.add(Duration(days: index));
                        final isSelected = _selectedDate != null &&
                            _selectedDate!.year == date.year &&
                            _selectedDate!.month == date.month &&
                            _selectedDate!.day == date.day;

                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () => setState(() => _selectedDate = date),
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              width: 70,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.grey[100],
                                borderRadius: BorderRadius.circular(16),
                                border: isSelected
                                    ? null
                                    : Border.all(color: Colors.grey[300]!),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat('EEE').format(date),
                                    style: TextStyle(
                                      color: isSelected ? Colors.white70 : Colors.grey[600],
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${date.day}',
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    DateFormat('MMM').format(date),
                                    style: TextStyle(
                                      color: isSelected ? Colors.white70 : Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Time Slot Selection
                  Text(
                    'Select Time',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: widget.doctor.availableTimeSlots.map((slot) {
                      final isSelected = _selectedTimeSlot == slot;
                      return ChoiceChip(
                        label: Text(slot),
                        selected: isSelected,
                        onSelected: (_) => setState(() => _selectedTimeSlot = slot),
                        selectedColor: Theme.of(context).colorScheme.primary,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),

                  // Notes
                  Text(
                    'Additional Notes (Optional)',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _notesController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Describe your symptoms or reason for visit...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Confirm Button
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: FilledButton(
                onPressed: (_selectedDate != null && _selectedTimeSlot != null)
                    ? () {
                        final appointment = Appointment(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          doctor: widget.doctor,
                          date: _selectedDate!,
                          timeSlot: _selectedTimeSlot!,
                          status: AppointmentStatus.confirmed,
                          notes: _notesController.text.isEmpty ? null : _notesController.text,
                        );
                        AppState().bookAppointment(appointment);

                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => AlertDialog(
                            icon: Icon(
                              Icons.check_circle,
                              color: Theme.of(context).colorScheme.primary,
                              size: 64,
                            ),
                            title: const Text('Appointment Booked!'),
                            content: Text(
                              'Your appointment with ${widget.doctor.name} on ${DateFormat('EEEE, MMM d').format(_selectedDate!)} at $_selectedTimeSlot has been confirmed.',
                            ),
                            actions: [
                              FilledButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: const Text('Done'),
                              ),
                            ],
                          ),
                        );
                      }
                    : null,
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 54),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: const Text('Confirm Booking'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== APPOINTMENTS SCREEN ====================

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppState();
    final upcoming = state.upcomingAppointments;
    final past = state.pastAppointments;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Appointments'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildAppointmentList(context, upcoming, isUpcoming: true),
            _buildAppointmentList(context, past, isUpcoming: false),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentList(BuildContext context, List<Appointment> appointments, {required bool isUpcoming}) {
    if (appointments.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isUpcoming ? Icons.calendar_today : Icons.history,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              isUpcoming ? 'No upcoming appointments' : 'No appointment history',
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
            if (isUpcoming) ...[
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () {
                  // Navigate to doctors tab
                },
                icon: const Icon(Icons.search),
                label: const Text('Find a Doctor'),
              ),
            ],
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return AppointmentCard(appointment: appointment, isUpcoming: isUpcoming);
      },
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  final bool isUpcoming;

  const AppointmentCard({super.key, required this.appointment, required this.isUpcoming});

  Color _getStatusColor() {
    switch (appointment.status) {
      case AppointmentStatus.confirmed:
        return Colors.green;
      case AppointmentStatus.pending:
        return Colors.orange;
      case AppointmentStatus.completed:
        return Colors.blue;
      case AppointmentStatus.cancelled:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(appointment.doctor.imageUrl),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment.doctor.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        appointment.doctor.specialty,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor().withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    appointment.status.name.toUpperCase(),
                    style: TextStyle(
                      color: _getStatusColor(),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 18, color: Colors.grey[600]),
                const SizedBox(width: 8),
                Text(DateFormat('MMM d, yyyy').format(appointment.date)),
                const SizedBox(width: 20),
                Icon(Icons.access_time, size: 18, color: Colors.grey[600]),
                const SizedBox(width: 8),
                Text(appointment.timeSlot),
              ],
            ),
            if (appointment.notes != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.notes, size: 18, color: Colors.grey[600]),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        appointment.notes!,
                        style: TextStyle(color: Colors.grey[700], fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            if (isUpcoming && appointment.status != AppointmentStatus.cancelled) ...[
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Cancel Appointment'),
                            content: const Text('Are you sure you want to cancel this appointment?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Keep'),
                              ),
                              FilledButton(
                                onPressed: () {
                                  AppState().cancelAppointment(appointment.id);
                                  Navigator.pop(context);
                                },
                                style: FilledButton.styleFrom(backgroundColor: Colors.red),
                                child: const Text('Cancel'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.cancel_outlined, size: 18),
                      label: const Text('Cancel'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () {
                        // Reschedule
                      },
                      icon: const Icon(Icons.schedule, size: 18),
                      label: const Text('Reschedule'),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ==================== PROFILE SCREEN ====================

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _ageController;
  String _selectedBloodType = 'O+';
  String _selectedGender = 'Male';

  @override
  void initState() {
    super.initState();
    final profile = AppState().userProfile;
    _nameController = TextEditingController(text: profile.name);
    _emailController = TextEditingController(text: profile.email);
    _phoneController = TextEditingController(text: profile.phone);
    _ageController = TextEditingController(text: profile.age);
    _selectedBloodType = profile.bloodType;
    _selectedGender = profile.gender;
  }

  @override
  Widget build(BuildContext context) {
    final state = AppState();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          TextButton(
            onPressed: () {
              state.updateProfile(UserProfile(
                name: _nameController.text,
                email: _emailController.text,
                phone: _phoneController.text,
                age: _ageController.text,
                bloodType: _selectedBloodType,
                gender: _selectedGender,
              ));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile updated successfully')),
              );
            },
            child: const Text('Save'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildTextField('Full Name', _nameController, Icons.person),
            const SizedBox(height: 16),
            _buildTextField('Email', _emailController, Icons.email),
            const SizedBox(height: 16),
            _buildTextField('Phone', _phoneController, Icons.phone),
            const SizedBox(height: 16),
            _buildTextField('Age', _ageController, Icons.cake),
            const SizedBox(height: 16),
            _buildDropdown('Blood Type', _selectedBloodType, ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'], (val) {
              setState(() => _selectedBloodType = val!);
            }),
            const SizedBox(height: 16),
            _buildDropdown('Gender', _selectedGender, ['Male', 'Female', 'Other'], (val) {
              setState(() => _selectedGender = val!);
            }),
            const SizedBox(height: 32),
            _buildInfoTile(context, Icons.calendar_today, 'Total Appointments', '${state.appointments.length}'),
            _buildInfoTile(context, Icons.check_circle, 'Completed', '${state.pastAppointments.where((a) => a.status == AppointmentStatus.completed).length}'),
            _buildInfoTile(context, Icons.pending, 'Upcoming', '${state.upcomingAppointments.length}'),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildDropdown(String label, String value, List<String> items, ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildInfoTile(BuildContext context, IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title),
      trailing: Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
