import 'package:flutter/material.dart';

void main() {
  runApp(const RppApp());
}

class RppApp extends StatelessWidget {
  const RppApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital RPP Ko-Kurikuler',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const IdentitasScreen(),
    const AktivitasScreen(),
    const AsesmenScreen(),
    const LkpdScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Determine layout based on screen width
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text('RPP Ko-Kurikuler SLB (Fase B)'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: isDesktop
          ? Row(
              children: [
                NavigationRail(
                  selectedIndex: _currentIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.all,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.info_outline),
                      selectedIcon: Icon(Icons.info),
                      label: Text('Identitas'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.local_activity_outlined),
                      selectedIcon: Icon(Icons.local_activity),
                      label: Text('Aktivitas'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.assessment_outlined),
                      selectedIcon: Icon(Icons.assessment),
                      label: Text('Asesmen'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.assignment_outlined),
                      selectedIcon: Icon(Icons.assignment),
                      label: Text('LKPD'),
                    ),
                  ],
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(child: _pages[_currentIndex]),
              ],
            )
          : _pages[_currentIndex],
      bottomNavigationBar: isDesktop
          ? null
          : BottomNavigationBar(
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.info_outline),
                  activeIcon: Icon(Icons.info),
                  label: 'Identitas',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_activity_outlined),
                  activeIcon: Icon(Icons.local_activity),
                  label: 'Aktivitas',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assessment_outlined),
                  activeIcon: Icon(Icons.assessment),
                  label: 'Asesmen',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assignment_outlined),
                  activeIcon: Icon(Icons.assignment),
                  label: 'LKPD',
                ),
              ],
            ),
    );
  }
}

// ==========================================
// 1. IDENTITAS & PROFIL
// ==========================================
class IdentitasScreen extends StatelessWidget {
  const IdentitasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildSectionCard(
          title: 'Identitas Awal',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Nama Satuan Pendidikan: SLBN 1 AMPEK ANGKEK'),
              Text('Kelas: Kelas 3 Tunagrahita (C1)'),
              Text('Fase: B kelas IV'),
              Text('Tema Kegiatan: "Peduli dan Berbagi di Sekolahku"'),
              Text('Alokasi Waktu: 252 JP'),
              Text('Lokasi Kegiatan: Lingkungan satuan pendidikan'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildSectionCard(
          title: 'Profil Peserta Didik (Kesiapan Belajar)',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('1. Raffa:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                  'Motorik kasar dan halus mulai berkembang; pendengaran, perabaan, pengamatan, koordinasi mata-tangan, koordinasi mata-kaki, sosialisasi, komunikasi nonverbal, dan perkembangan emosi mulai berkembang; kemampuan bicara dan komunikasi lisan belum berkembang.\n'),
              Text('2. Wildan Aprialdi:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                  'Motorik kasar, pengamatan, dan perkembangan emosi berkembang; motorik halus, pendengaran, perabaan, koordinasi mata-tangan, koordinasi mata-kaki, sosialisasi, kemampuan mendengarkan, komunikasi nonverbal, dan komunikasi lisan sangat berkembang; kemampuan bicara mulai berkembang.\n'),
              Text('3. Suryadi:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                  'Motorik kasar, halus, pendengaran, perabaan, pengamatan, koordinasi mata-tangan, koordinasi mata-kaki, sosialisasi, komunikasi nonverbal, perkembangan emosi, kemampuan bicara, dan komunikasi lisan belum berkembang.'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildSectionCard(
          title: 'Dimensi Profil Lulusan & Tujuan',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Dimensi:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Kolaborasi dan Kewargaan yang sesuai tema "Peduli dan Berbagi di Sekolahku".'),
              SizedBox(height: 8),
              Text('Tujuan Pembelajaran Utama:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('- Menunjukkan perilaku menghormati sesama.'),
              Text('- Membiasakan berdoa dalam kegiatan sehari-hari.'),
              Text('- Melakukan gerakan dasar sederhana dengan bantuan teman.'),
              Text('- Menunjukkan empati, kerja sama, dan tanggung jawab.'),
              Text('- Membuat karya visual sederhana dan menceritakan kembali isi cerita.'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildSectionCard(
          title: 'Pendekatan Pembelajaran',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Praktek Pedagogik: Project Based Learning (PjBL)'),
              Text('Lingkungan: Berdiferensiasi sesuai karakteristik Raffa, Wildan, dan Suryadi.'),
              Text('Pemanfaatan Digital: Menggunakan media visual/audio sederhana adaptif untuk peserta didik.'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionCard({required String title, required Widget content}) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            const Divider(),
            content,
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 2. AKTIVITAS
// ==========================================
class AktivitasScreen extends StatelessWidget {
  const AktivitasScreen({super.key});

  final List<Map<String, String>> activities = const [
    {
      'no': '1',
      'kebiasaan': 'Bangun Pagi',
      'aktivitas': 'Salam dan Sapa Pagi',
      'deskripsi': 'Siswa datang tepat waktu, memberi salam, menyapa guru dan teman',
      'capaian': 'PAIBP, B. Indonesia',
      'waktu': 'Minggu 1',
    },
    {
      'no': '2',
      'kebiasaan': 'Beribadah',
      'aktivitas': 'Doa Bersama Sebelum Belajar',
      'deskripsi': 'Membiasakan doa bersama sesuai keyakinan masing-masing',
      'capaian': 'PAIBP, B. Indonesia',
      'waktu': 'Minggu 2',
    },
    {
      'no': '3',
      'kebiasaan': 'Berolahraga',
      'aktivitas': 'Senam Ceria Peduli Teman',
      'deskripsi': 'Melakukan gerak senam berpasangan dengan saling bantu',
      'capaian': 'PJOK, SBDP',
      'waktu': 'Minggu 3',
    },
    {
      'no': '4',
      'kebiasaan': 'Makan Sehat dan Bergizi',
      'aktivitas': 'Sarapan Sehat Bersama',
      'deskripsi': 'Membawa bekal sehat, saling berbagi makanan sehat',
      'capaian': 'IPA/PJOK, PAIBP',
      'waktu': 'Minggu 4',
    },
    {
      'no': '5',
      'kebiasaan': 'Gemar Belajar',
      'aktivitas': 'Cerita Temanku Baik Hati',
      'deskripsi': 'Mendengarkan dan menceritakan ulang kisah teman yang suka berbagi',
      'capaian': 'B. Indonesia, P5 Karakter',
      'waktu': 'Minggu 5',
    },
    {
      'no': '6',
      'kebiasaan': 'Bermasyarakat',
      'aktivitas': 'Gotong Royong Membersihkan Kelas',
      'deskripsi': 'Bekerja sama membersihkan kelas dan taman',
      'capaian': 'PPKn, Matematika',
      'waktu': 'Minggu 6',
    },
    {
      'no': '7',
      'kebiasaan': 'Tidur Cepat',
      'aktivitas': 'Poster Kebiasaan Sehat',
      'deskripsi': 'Membuat poster bergambar waktu tidur dan bangun pagi',
      'capaian': 'SBDP, PJOK',
      'waktu': 'Minggu 7',
    },
    {
      'no': '8',
      'kebiasaan': 'Bangun Pagi & Gemar Belajar',
      'aktivitas': 'Jurnal Kegiatan Pagi',
      'deskripsi': 'Menulis kegiatan pagi secara sederhana dengan bantuan guru',
      'capaian': 'B. Indonesia, PAIBP',
      'waktu': 'Minggu 8',
    },
    {
      'no': '9',
      'kebiasaan': 'Bermasyarakat & Beribadah',
      'aktivitas': 'Berbagi dengan Teman',
      'deskripsi': 'Mengumpulkan barang bekas layak pakai untuk teman yang membutuhkan',
      'capaian': 'PPKn, PAIBP',
      'waktu': 'Minggu 9',
    },
    {
      'no': '10',
      'kebiasaan': 'Refleksi 7 KAIH',
      'aktivitas': 'Panggung Anak Hebat',
      'deskripsi': 'Menampilkan lagu/puisi pendek tentang peduli dan berbagi',
      'capaian': 'SBDP, B. Indonesia',
      'waktu': 'Minggu 10',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // Table view for desktop/tablet
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Minggu')),
                    DataColumn(label: Text('Kebiasaan')),
                    DataColumn(label: Text('Aktivitas')),
                    DataColumn(label: Text('Deskripsi')),
                    DataColumn(label: Text('Capaian Terkait')),
                  ],
                  rows: activities.map((act) {
                    return DataRow(cells: [
                      DataCell(Text(act['waktu']!)),
                      DataCell(Text(act['kebiasaan']!)),
                      DataCell(Text(act['aktivitas']!)),
                      DataCell(Text(act['deskripsi']!)),
                      DataCell(Text(act['capaian']!)),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          );
        } else {
          // List view for mobile
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: activities.length,
            itemBuilder: (context, index) {
              final act = activities[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(act['waktu']!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal)),
                          Chip(label: Text(act['kebiasaan']!, style: const TextStyle(fontSize: 10)), padding: EdgeInsets.zero),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(act['aktivitas']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(act['deskripsi']!),
                      const SizedBox(height: 8),
                      Text('Capaian: ${act['capaian']}', style: TextStyle(color: Colors.grey[700], fontStyle: FontStyle.italic)),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}

// ==========================================
// 3. ASESMEN
// ==========================================
class AsesmenScreen extends StatelessWidget {
  const AsesmenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text('Instrumen Asesmen Pembelajaran', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildAssesmentCard(
          title: 'Asesmen Awal Pembelajaran (Observasi)',
          description: 'Observasi kesiapan belajar murid (Raffa, Wildan, Suryadi) terhadap tema "Peduli dan Berbagi".',
          table: DataTable(
            columnSpacing: 16,
            columns: const [
              DataColumn(label: Text('Aspek Observasi')),
              DataColumn(label: Text('Mulai Berkembang')),
              DataColumn(label: Text('Berkembang')),
              DataColumn(label: Text('Sangat Berkembang')),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('Sosialisasi awal')),
                DataCell(Text('Butuh bantuan penuh')),
                DataCell(Text('Merespon dengan arahan')),
                DataCell(Text('Merespon mandiri')),
              ]),
              DataRow(cells: [
                DataCell(Text('Kemampuan Komunikasi')),
                DataCell(Text('Non verbal (isyarat)')),
                DataCell(Text('Lisan terbatas')),
                DataCell(Text('Lisan aktif')),
              ]),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildAssesmentCard(
          title: 'Asesmen Proses Pembelajaran (Unjuk Kerja)',
          description: 'Penilaian proses selama aktivitas proyek.',
          table: DataTable(
            columnSpacing: 16,
            columns: const [
              DataColumn(label: Text('Kriteria Unjuk Kerja')),
              DataColumn(label: Text('Raffa')),
              DataColumn(label: Text('Wildan')),
              DataColumn(label: Text('Suryadi')),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('Partisipasi dalam kelompok')),
                DataCell(Text('Bantuan fisik/verbal')),
                DataCell(Text('Aktif membantu')),
                DataCell(Text('Bantuan penuh')),
              ]),
              DataRow(cells: [
                DataCell(Text('Penyelesaian tugas sederhana')),
                DataCell(Text('Bertahap dibantu')),
                DataCell(Text('Cukup mandiri')),
                DataCell(Text('Dibantu penuh')),
              ]),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildAssesmentCard(
          title: 'Asesmen Akhir Pembelajaran (Sumatif)',
          description: 'Rubrik profil lulusan "Peduli dan Berbagi di Sekolahku".',
          table: DataTable(
            columnSpacing: 16,
            columns: const [
              DataColumn(label: Text('Profil / Kriteria')),
              DataColumn(label: Text('Belum Terlihat')),
              DataColumn(label: Text('Mulai Terlihat')),
              DataColumn(label: Text('Membudaya')),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('Kolaborasi (Kerjasama)')),
                DataCell(Text('Pasif/Menolak')),
                DataCell(Text('Ikut serta jika diajak')),
                DataCell(Text('Inisiatif mengajak')),
              ]),
              DataRow(cells: [
                DataCell(Text('Kewargaan (Peduli Lingkungan/Teman)')),
                DataCell(Text('Acuh')),
                DataCell(Text('Merespon jika diminta')),
                DataCell(Text('Membantu tanpa diminta')),
              ]),
            ],
          ),
        ),
        const SizedBox(height: 32),
        // Signatures
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: const [
                Text('Mengetahui,'),
                Text('Kepala Sekolah'),
                SizedBox(height: 60),
                Text('( ................................. )'),
              ],
            ),
            Column(
              children: const [
                Text(''),
                Text('Guru Kelas / Tim Ko-Kurikuler'),
                SizedBox(height: 60),
                Text('( ................................. )'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildAssesmentCard({required String title, required String description, required Widget table}) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal)),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 16),
            SingleChildScrollView(scrollDirection: Axis.horizontal, child: table),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 4. LKPD (Lembar Kerja Peserta Didik)
// ==========================================
class LkpdScreen extends StatelessWidget {
  const LkpdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text('Lembar Kerja Peserta Didik (LKPD)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('LKPD Berdiferensiasi Tema "Peduli dan Berbagi di Sekolahku"'),
        const SizedBox(height: 16),
        _buildLkpdCard(
          title: 'LKPD 1: Menjodohkan Gambar (Untuk Suryadi & Raffa)',
          content: 'Instruksi: Tarik garis untuk memasangkan gambar alat kebersihan (sapu, pel) dengan tempat yang tepat.\n\n(Area ini disediakan untuk gambar visual yang dicetak. Bantuan penuh dari guru/pendamping).',
          icon: Icons.gesture,
        ),
        const SizedBox(height: 16),
        _buildLkpdCard(
          title: 'LKPD 2: Mewarnai dan Menebalkan Huruf (Untuk Raffa)',
          content: 'Instruksi: Warnai gambar "Anak Berbagi Makanan". Kemudian tebalkan kata "B - E - R - B - A - G - I".\n\n(Fokus pada motorik halus dan koordinasi mata-tangan).',
          icon: Icons.format_paint,
        ),
        const SizedBox(height: 16),
        _buildLkpdCard(
          title: 'LKPD 3: Menyalin Kata dan Menceritakan (Untuk Wildan)',
          content: 'Instruksi: Salinlah kalimat sederhana di bawah ini:\n"Saya suka menolong teman."\n\nSetelah disalin, ceritakan di depan guru siapa teman yang kamu tolong hari ini.',
          icon: Icons.edit,
        ),
        const SizedBox(height: 16),
        _buildLkpdCard(
          title: 'LKPD 4: Jurnal Pagi Bersama',
          content: 'Kegiatan: Checklist mandiri (dengan bantuan guru).\n- Apakah saya sudah sarapan? [ ]\n- Apakah saya sudah menyapa teman? [ ]\n- Apakah saya sudah membuang sampah? [ ]',
          icon: Icons.checklist,
        ),
      ],
    );
  }

  Widget _buildLkpdCard({required String title, required String content, required IconData icon}) {
    return Card(
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: CircleAvatar(
          backgroundColor: Colors.teal.shade100,
          child: Icon(icon, color: Colors.teal),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(content),
        ),
      ),
    );
  }
}
