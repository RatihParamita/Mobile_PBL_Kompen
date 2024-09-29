import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Menjalankan aplikasi Flutter kita
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner "Debug" di atas
      theme: ThemeData(
        fontFamily:
            'InstrumentSans-Bold', // Menetapkan font default menjadi Instrument Sans
      ),
      home:
          MhsHomepageHutang(), // Menyatakan bahwa halaman utama adalah MhsHomepageHutang
    );
  }
}

class MhsHomepageHutang extends StatefulWidget {
  @override
  _MhsHomepageHutangState createState() => _MhsHomepageHutangState();
}

class _MhsHomepageHutangState extends State<MhsHomepageHutang> {
  int _selectedIndex =
      0; // Variabel untuk menyimpan index dari item yang dipilih

  // Fungsi untuk mengupdate state saat item di bottom navigation dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 45, 27, 107), // Warna AppBar biru tua
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Warna teks default
            ),
            children: <TextSpan>[
              TextSpan(text: 'Sistem Kompensasi '), // Teks biasa
              TextSpan(
                  text: 'J',
                  style:
                      TextStyle(color: const Color.fromARGB(255, 153, 58, 54))),
              TextSpan(
                  text: 'T',
                  style:
                      TextStyle(color: const Color.fromARGB(255, 240, 85, 41))),
              TextSpan(
                  text: 'I',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 254, 192, 26))),
              TextSpan(text: ' Polinema'), // Teks biasa
            ],
          ),
        ), // Judul di AppBar
        centerTitle: true, // Membuat judul berada di tengah
        actions: [
          IconButton(
            icon:
                Icon(Icons.notifications_outlined, // Ikon lonceng di kanan atas
                    color: Colors.white), // warna ikon lonceng
            onPressed: () {
              // Aksi jika ikon notifikasi diklik (belum ada fungsi)
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Agar halaman bisa di-scroll
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Pusatkan elemen-elemen
          children: [
            SizedBox(height: 5), // Memberi jarak
            Text(
              'Selamat datang,', // Teks selamat datang
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 21,
                fontWeight: FontWeight.bold, // Teks lebih tebal
              ),
            ),
            Text(
              'NAMA MAHASISWA', // Nama mahasiswa
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 24,
                fontWeight: FontWeight.bold, // Teks lebih tebal
              ),
            ),
            SizedBox(height: 20), // Jarak antara elemen
            Image(
              image: AssetImage('assets/images/logo_polinema.png'),
              height: 150, // Tinggi gambar logo
              width: 149, // Lebar gambar logo
            ),
            SizedBox(height: 20),
            _buildTextField('Total Absensi Alfa',
                'Total jam'), // Menampilkan field total absen
            SizedBox(height: 5),
            _buildTextField('Jumlah Absensi Alfa Lunas',
                'Jumlah jam'), // Menampilkan field absen lunas
            SizedBox(height: 5),
            _buildTextField('Jumlah Absensi Alfa Belum Lunas',
                'Jumlah jam'), // Field absen belum lunas
            SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Status Ujian Akhir Semester (UAS)', // Teks status UAS
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: double.infinity, // Membuat lebar sesuai layar
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.red, // Warna kotak merah
                border:
                    Border.all(color: const Color.fromARGB(255, 144, 11, 9)),
                borderRadius:
                    BorderRadius.circular(8), // Sudut kotak melengkung
              ),
              child: Text(
                'Belum bisa mengikuti!', // Teks di dalam kotak merah
                style: TextStyle(
                  color:
                      const Color.fromARGB(255, 144, 11, 9), // Teks warna merah
                  fontSize: 16,
                  fontWeight: FontWeight.normal, // Teks normal
                ),
                textAlign: TextAlign.left, // Teks di kiri
              ),
            ),
          ],
        ),
      ),

      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Datar Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cases_outlined),
            label: 'Daftar Tugas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex, // Index yang sedang dipilih
        selectedItemColor: Colors.white, // Warna item terpilih
        unselectedItemColor: Colors.white, // Warna item tidak terpilih
        backgroundColor: Color.fromARGB(
            255, 45, 27, 107), // Warna latar belakang BottomNavigationBar
        onTap: _onItemTapped, // Aksi ketika item dipilih
        type: BottomNavigationBarType
            .fixed, // Menetapkan jenis BottomNavigationBar
      ),
    );
  }

  // Fungsi untuk membuat TextField dengan label dan hint
  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label, // Label yang muncul di atas kotak input
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: hint, // Teks yang muncul di dalam kotak
            hintStyle: TextStyle(
              color: Colors
                  .grey, // Warna teks abu-abu pada "Total jam" dan "Jumlah jam"
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), // Sudut kotak melengkung
              borderSide: BorderSide(
                color: Colors.grey
                    .withOpacity(0.1), // Warna border dengan opacity 50%
                width: 1, // Lebar garis border
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
          readOnly: true, // Membuat input hanya untuk dibaca, tidak bisa diubah
        ),
      ],
    );
  }
}
