import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sdm/widget/admin/custom_bottomappbar.dart';
import 'package:sdm/widget/admin/custom_horizontalcalendar.dart';
import 'package:sdm/admin/homeadmin_page.dart';

class DetailKegiatanPage extends StatefulWidget {
  const DetailKegiatanPage({Key? key}) : super(key: key);

  @override
  DetailKegiatanPageState createState() => DetailKegiatanPageState();
}

class DetailKegiatanPageState extends State<DetailKegiatanPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 103, 119, 239),
        title: Text(
          'Detail Kegiatan',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomHorizontalCalendar(
                focusedDay: _focusedDay,
                selectedDay: _selectedDay,
                onDaySelected: (date) {
                  setState(() {
                    _selectedDay = date;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 4,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16.0),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 5, 167, 170),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Detail Kegiatan',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildDetailField('Nama Kegiatan', 'Seminar Nasional', titleColor: Colors.black),
                              _buildDetailField('Jenis Kegiatan', 'Kegiatan JTI', titleColor: Colors.black),
                              _buildDetailField('Nama Ketua Pelaksana', 'Albani Rajata Malik', titleColor: Colors.black),
                              _buildDetailField('Nama Anggota 1', 'Almira S.Pd', titleColor: Colors.black),
                              _buildDetailField('Nama Anggota 2', 'Anita S.T.Tr', titleColor: Colors.black),
                              _buildDetailField('Nama Anggota 3', 'Sofyan Andani S.T.Tr M.Ti', titleColor: Colors.black),
                              _buildDetailField('Nama Anggota 4', 'Tasya Cantika Ristiyana', titleColor: Colors.black),
                              _buildDetailField('Nama Anggota 5', 'ALya Rafani Mikaila', titleColor: Colors.black),
                              _buildDetailField('Deskripsi Kegiatan', 'Seminar Nasional yang diadakan oleh Dishub', isDescription: true, titleColor: Colors.black),
                              _buildDetailField('Dokumen', 'Draft_surat_tugas_SemNas.pdf', titleColor: Colors.black),
                              const SizedBox(height: 16),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => const HomeadminPage()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      child: const Text(
                                        'Kembali',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomBottomAppBar().buildFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }

  Widget _buildDetailField(String title, String content, {bool isDescription = false, Color titleColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: titleColor,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          TextFormField(
            initialValue: content,
            readOnly: !isDescription,
            maxLines: isDescription ? 5 : 1, // Increase maxLines for description
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            ),
          ),
        ],
      ),
    );
  }
}