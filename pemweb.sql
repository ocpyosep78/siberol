/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : pemweb

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2012-01-21 12:50:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` enum('Direktur','Wartawan') NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('admin', 'admin', 'Admin', 'Direktur');
INSERT INTO `account` VALUES ('user1', 'user', 'Neki Arismi', 'Wartawan');
INSERT INTO `account` VALUES ('user2', 'user', 'Nurvina Ahdiani', 'Wartawan');

-- ----------------------------
-- Table structure for `berita`
-- ----------------------------
DROP TABLE IF EXISTS `berita`;
CREATE TABLE `berita` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `kategori` enum('Hidup Sehat','Umum','Diabetes','Hipertensi') NOT NULL,
  `id_wartawan` varchar(16) NOT NULL,
  `tanggal_tayang_dari` date DEFAULT NULL,
  `tanggal_tayang_sampai` date DEFAULT NULL,
  `status_tayang` enum('0','1','2') DEFAULT '0',
  `gambar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idx`,`id_wartawan`),
  KEY `fk_id_wartawan` (`id_wartawan`),
  CONSTRAINT `fk_id_wartawan` FOREIGN KEY (`id_wartawan`) REFERENCES `account` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of berita
-- ----------------------------
INSERT INTO `berita` VALUES ('1', 'Yang Keliru Soal Diabetes Tapi Masih Dipercaya', '<p>Diabetes bisa menyerang siapa saja tanpa memandang jenis kelamin atau usia. Tapi sayangnya masih ada mitos-mitos yang dipercaya oleh masyarakat mengenai diabetes.<br /><br />Mitos yang berkembang bisa memicu kesalahpahaman mengenai penyakit diabetes. Kondisi ini tidak hanya meningkatkan jumlah penderita diabetes tapi juga membuat hidup penderita diabetes menjadi lebih sulit.<br /><br />Berikut ini 6 mitos seputar diabetes yang masih banyak dipercaya oleh masyarakat, seperti dikutip dari&nbsp;<em>health24</em>, Kamis (24/11/2011) yaitu:<br /><br /><strong>1. Makan terlalu banyak gula bisa menyebabkan diabetes</strong><br />Keyakinan ini merupakan kesalahpahaman yang paling umum di masyarakat, padahal diabetes disebabkan oleh pankreas yang tidak bekerja sebagaimana mestinya.&nbsp;<br /><br />Normalnya pankreas memproduksi hormon insulin yang membantu membawa glukosa ke sel sebagai sumber energi, tapi saat diabetes pankreas berhenti atau kurang memproduksi insulin yang membuat glukosa tidak bisa masuk ke dalam sel.<br /><br />Sebagian besar penyebab diabetes dipengaruhi oleh faktor genetik serta gaya hidup seperti jarang melakukan aktivitas fisik dan pola makan yang buruk. Terlalu banyak mengonsumsi gula memang bisa menjadi pemicu, tapi ia bukan penyebab utama diabetes.<br /><br /><strong>2. Orang dengan diabetes harus mengikuti diet khusus</strong><br />Banyak orang percaya penderita diabetes harus mengonsumsi makanan hambar dan tidak bisa menikmati makanan lezat karena harus diet khusus.&nbsp;<br /><br />Padahal ia bisa melakukan diet sehat yang sama seperti non-diabetes yaitu makan diet seimbang, banyak serat, membatasi gula dan karbohidrat, sedikit garam dan minum cukup air.&nbsp;<br /><br />Tapi sayangnya, banyak orang yang tidak melakukan pola seperti ini, sehingga ketika didiagnosis diabetes ia merasa harus melakukan diet khusus.<br /><br /><strong>3. Orang dengan diabetes tidak bisa mengonsumsi karbohidrat</strong><br />Karbohidrat bukanlah musuh bagi pasien diabetes karena tubuh membutuhkannya agar bisa berfungsi optimal dan menjadi sumber bahan bakar. Namun hal yang harus dipahami adalah memilih jenis karbohidrat yang tepat (nasi merah, roti gandum, sereal tinggi serat) serta porsi yang tidak berlebihan.<br /><br /><strong>4. Orang dengan diabetes harus menghindari buah-buah tertentu</strong><br />Buah-buah tertentu memang ada yang memiliki nilai GI (glucose index) tinggi sehingga cepat menaikkan kadar gula darah (pisang, anggur) yang bisa dikonsumsi saat berolahraga.&nbsp;<br /><br />Serta ada pula yang lambat dicerna karena kadar GI rendah (apel, pir dan golongan berri) yang bisa menjadi cemilan sehat untuk penderita diabetes. Jadi waktu konsumsi buah yang harus diperhatikan.<br /><br /><strong>5. Hanya orang gemuk yang bisa terkena diabetes</strong><br />Banyak orang yang mempercayai kabar ini. Meski kelebihan berat badan dan obesitas bisa meningkatakn risiko diabetes tipe 2, tapi bertubuh kurus tidak menjadi jaminan perlindungan dari diabetes karena ada banyak faktor lain yang berpengaruh seperti riwayat keluarga, usia, etnis dan pola hidup.<br /><br /><strong>6. Penggunaan insulin menunjukkan kondisi diabetes yang buruk</strong><br />Diabetes merupakan penyakit yang membutuhkan manajemen tepat dalam mengelolanya. Seperti halnya dengan diabetes tipe 1 yang mana pankreas tidak memproduksi insulin, maka suntikan injeksi merupakan perawatan yang tepat.&nbsp;<br /><br />Insulin sendiri membantu memperlambat atau mencegah kompliaksi diabetes dan menajdi salah satu obat yang paling aman bagi penderita diabetes.</p>', 'Diabetes', 'admin', '2012-01-15', '2012-02-15', '1', '');
INSERT INTO `berita` VALUES ('2', 'Kurang Minum Air Meningkatkan Gula Darah?', '<p>Kurang mengonsumsi air putih bukan hanya menyebabkan dehidrasi tapi juga kadar gula darah menjadi tinggi. Karena itu selain menjaga pola makan, konsumsi air yang cukup disarankan untuk mencegah kadar gula darah meningkat.</p>\r\n<p>Ketika kadar gula darah di atas normal, tetapi belum terlalu tinggi untuk disebut diabetes, dokter menyebutnya sebgai pra-diabetes. Mereka yang didiagnosis mengalami pra-diabetes beresiko tinggi menjadi diabetes jika kadar gula darahnya tidak dijaga.</p>\r\n<p>Dalam studi terbaru, orang dewasa yang hanya mengonsumsi setengah liter air setiap hari (sekitar dua gelas), cenderung mengalami kenaikan gula darah hingga level pra-diabetes, dibandingkan dengan orang yang minum lebih banyak air.</p>\r\n<p>Walau penelitian ini menemukan kaitan antara asupan air dengan gula darah, tetapi tidak menunjukkan adanya hubungan sebab akibat. Diduga hal ini bisa dijelaskan secara biologi.</p>\r\n<p>Menurut Lise Bankir, peneliti dari French National Research Institute, hormon yang disebut vasopressin, mungkin menjelaskan. Vasopressin, yang disebut juga dengan hormon antidiuretik, membantu mengatur penyimpanan air dalam tubuh.</p>\r\n<p>Saat kita dehidrasi, kadar vasopressin meningkat sehingga ginjal berusaha menghemat persediaan air. Selain itu peningkatan kadar vasopressin ini juga akan meningkatkan kadar gula darah.</p>\r\n<p>Menurut Bankir, di dalam liver terdapat reseptor vasopressin, organ yang bertanggung jawab pada produksi gula darah di tubuh. Sebuah penelitian menunjukkan menyuntikkan vasopressin pada orang sehat akan menyebabkan kadar gula darah meningkat sementara.</p>\r\n<p>Penelitian itu dilakukan terhadap 3.615 orang Perancis berusia 35-65 tahun dan memiliki kadar gula darah normal pada awalnya. Sekitar 19 persen mengatakan mereka hanya minum kurang dari setengah liter air setiap hari, sementara sisanya minum seliter air atau lebih.</p>\r\n<p>Setelah 9 tahun, sebanyak 565 partisipan studi menderita ketidaknormalan kadar gula darah dan 202 orang didiagnosis diabetes tipe 2. Ketika para peneliti mengamati kebiasaan partisipan mengonsumsi air, mereka menemukan orang yang minum air kurang dari setengah liter setiap hari, beresiko 28 persen menderita kenaikan gula darah.</p>\r\n<p>Selama ini belum ada data statistik yang menyebutkan kaitan antara asupan air dengan terjadinya diabetes. Namun, orang yang minum air hanya sedikit pada umumnya menyukai minuman yang mengandung gula sehingga bisa memicu kenaikan berat badan dan gangguan kontrol gula darah.</p>', 'Diabetes', 'admin', '2012-01-15', '2012-02-15', '1', 'uploads/1147363p.jpg');
INSERT INTO `berita` VALUES ('3', 'Berkeringat Adalah Kunci Menurunkan Gula Darah Tinggi', '<p>Kadar gula darah yang tidak terkontrol sudah menjadi masalah banyak orang karena pola makan yang tidak proporsional. Padahal gula darah yang tinggi menyebabkan sindrom metabolik yang meningkatkan risiko obesitas, hipertensi, diabetes dan penyakit jantung.</p>\r\n<p>Gula darah diperlukan tubuh sebagai sumber energi. Namun jika berlebih maka kemampuan tubuh tidak maksimal mengolah gula darah sehingga gula atau glokosa akan tetap berada dalam darah yang menyebabkan kadar gula tinggi.</p>\r\n<p>Gula di dalam darah menyebabkan pankreas melepaskan insulin (insulin dibutuhkan untuk mengubah gula menjadi energi). Jika kadar gula yang dikonsumsi tinggi maka lebih banyak insulin dilepaskan. Semakin banyak gula di dalam darah maka lebih banyak insulin yang diproduksi. Akibatnya, semakin besar kemungkinan orang akan mengalami kenaikan berat badan. Selain menyebabkan obesitas (kegemukan) kadar gula tinggi dikaitkan dengan kondisi kesehatan yang lebih serius, termasuk perubahan suasana hati, penurunan sistem kekebalan dan diabetes. \"Berkeringat adalah kunci dalam menurunkan gula darah, bahkan olahraga ringan dapat menyebabkan otot untuk menyedot glukosa pada 20 kali tingkat normal,\" kata B Hatipoglu, MD, seorang ahli endokrinologi di Klinik Cleveland seperti dilansir dari MSNHealth, Minggu (13/11/2011). Keringat yang dimaksud adalah dengan menerapkan gaya hidup banyak gerak atau rutin berolahraga. Rajin bergerak dapat membakar kalori dan semakin banyak kalori yang terbakar bisa menurunkan kadar gula darah yang tinggi. Tidak perlu menyisihkan banyak waktu untuk berolahraga. Olahraga dapat digantikan dengan melakukan aktivitas fisik yang lebih aktif sepanjang hari dengan cara sederhana misalnya dengan menaiki tangga bukan dengan menggunakan lift. Lakukan setidaknya 30 menit latihan fisik setiap hari. Selain rajin bergerak cara mengontrol gula darah tetap normal adalah: Mengurangi jumlah asupan kalori. Makan dengan porsi kecil setiap 4-5 jam sekali. Pilih makanan tinggi serat, seperti sayuran, buah-buahan, biji-bijian dan kacang-kacangan. Tidur yang cukup Mengontrol berat badan Kurangi lemak pada organ dalam seperti di seputar perut Minum teh hijau tanpa gula Pemeriksaan gula darah secara rutin perlu dilakukan oleh siapapun yang memiliki faktor risiko untuk terkena diabetes. Idealnya pemeriksaan dilakukan di laboratorium sebanyak 2 kali yakni setelah berpuasa 8 jam dan sesudah makan. Namun pemeriksaan juga bisa dilakukan sendiri di rumah dengan alat-alat yang banyak dijual, dengan diambil kadar rata-rata.</p>\r\n<p>Kadar gula darah dikatakan normal jika angkanya 70-99 mg/dL, dengan catatan diukur setelah puasa atau tidak makan selama 8 jam. Kadar gula darah yang diukur 2 jam setelah makan dikatakan normal jika berkisar antara 70-145 mg/dL, sedangkan jika mengabaikan jadwal makan maka rentang normalnya adalah 70-125 mg/</p>', 'Diabetes', 'admin', '2012-01-15', '2012-02-15', '1', 'uploads/keringat-ts-dlm.jpg');
INSERT INTO `berita` VALUES ('8', 'Anak yang Kekurangan Vitamin D Rentan Diabetes', '<p>Selama ini, kekurangan vitamin D lebih banyak dikaitkan dengan risiko pengeroposan tulang dan sakit jantung. Penelitian terbaru menunjukkan, kekurangan vitamin D juga berhubungan dengan risiko kegemukan dan diabetes atau kencing manis.<br /><br />Penelitian yang dimuat di<em>Journal of Clinical Endocrinology and Metabolism</em>&nbsp;ini mengatakan, anak yang gemuk cenderung kekurangan vitamin D. Sebaliknya, kurang vitamin D juga membuat anak lebih rentan diabetes tipe 2 yang berhubungan dengan kegemukan.<br /><br />Dalam penelitian tersebut, Micah Olson, MD dari Phoenix Children Hospital mengamati 411 anak dengan masalah obesitas lalu membandingkannya dengan 89 anak yang tidak terlalu gemuk. Seluruh partisipan yang terlibat berusia antara 6 hingga 11 tahun.<br /><br />Selain mengukur berat dan tinggi badan, Dr Olson juga melakukan wawancara terkait diet dan pola makan para partisipan. Selain itu, ia juga melakukan tes darah untuk melihat secara pasti kadar vitamin D di dalam darah para partisipan yang diamati.<br /><br />Hasilnya seperti yang diduga, partisipan yang obesitas punya risiko 3 kali lebih besar untuk mengalami kekurangan vitamin D. Demikian juga yang memiliki kadar vitamin D lebih rendah, insulin atau hormon pengatur gula darahnya lebih resisten sehingga lebih rentan diabetes.<br /><br />Ketika dibandingkan dengan diet dan pola makan, Dr Olson kembali melihat adanya hubungan yang erat. Partisipan yang obesitas cenderung tidak pernah sarapan bergizi, namun sepanjang hari banyak ngemil makanan manis dan minum minuman bersoda yang kandungan gulanya sangat tinggi.<br /><br />Dr Olson juga melihat kemungkinan lain dalam kaitannya dengan aktivitas fisik. Dikutip dari&nbsp;<em>Menshealth.com,</em>&nbsp;Selasa (6/12/2011), sinar matahari sangat membantu pembentukan vitamin D sehingga jika anak kurang olahraga di luar maka anak itu cenderung gemuk dan kekurangan vitamin D.</p>', 'Diabetes', 'admin', '2012-01-15', '2012-02-15', '1', 'uploads/kidiabetes-ts-dalam.jpg');
INSERT INTO `berita` VALUES ('40', 'Cara Mudah Tangkal Stres', '<p>Stres memang seringkali mengacaukan pikiran. Bahkan jika terlalu lama terjadi, hal ini bisa menyebabkan kelelahan secara terus menerus, pertambahan berat badan, menurunkan tingkat kekebalan tubuh, dan mengurangi angka harapan hidup. Menyedihkan.<br /><br />Oleh karena itu, kita harus segera menangani stres yang terjadi sesegera mungkin. Inilah beberapa hal yang bisa kita lakukan saat stres datang melanda:</p>\r\n<p><strong><span style=\"color: #ff0000;\">Telat datang ke kantor</span><br /></strong><br /><br /><em>Oops!&nbsp;</em>Karena lupa menyetel alarm, bangun menjadi kesiangan. Kita lantas terburu-buru mandi dan berganti pakaian. Sarapan pun jadi terabaikan. Padahal&nbsp;<strong><a title=\"Pentingnya Sarapan bagi Tubuh\" href=\"http://www.preventionindonesia.com/article.php?name=/pentingnya-sarapan-bagi-tubuh&amp;channel=pilihan\" target=\"_blank\">tidak sarapan</a></strong>&nbsp;akan mengacaukan sistem pencernaan dan tingkat gula darah. Kondisi serba terburu-buru seperti ini sering membuat kita lupa di sana-sini, seperti meninggalkan dompet atau kunci di rumah. Hari pun akan terasa berjalan sangat kacau.<br /><br /><span style=\"color: #ff6600;\"><em><strong>How to relax:</strong></em>&nbsp;</span>Malam sebelumnya, siapkan segala sesuatu yang kita butuhkan untuk keesokan paginya. Letakkan di dekat tas. Pastikan kita duduk manis untuk sarapan. Berikan setidaknya 30 menit untuk menyantapnya.<br /><br /><strong><span style=\"color: #ff0000;\">Berpikir negatif</span><br /></strong><br /><br />Terkadang pikiran negatif bisa membuat dunia kita seakan-akan menjadi sangat buruk dan penuh dengan tekanan. Terlalu banyak hal yang menumpuk di pikiran akan mempersulit kita untuk berpikir jernih.<br /><br /><span style=\"color: #ff6600;\"><em><strong>How to relax:</strong></em></span>&nbsp;Ketika kita mulai melakukan hal ini, perhatikan raut wajah dan cara bernapas. Relaksasikan wajah, tutup mata, dan tarik napas dalam-dalam. Lalu, kembalilah pada kenyataan, buatlah rencana, sekaligus langkah-langkah dan waktu yang dibutuhkan untuk melaksanakannya.<br /><br /><span style=\"color: #ff0000;\"><strong>Rumah berantakan<br /></strong></span><br /><br />Bangun atau berada di dalam rumah yang tak rapi bisa membuat kita merasa sumpek dan lelah. Sebenarnya, hal ini disebabkan oleh pikiran (sadar atau tidak sadar) yang dijejali dengan keinginan untuk membersihkan dan merapikannya.<br /><span style=\"color: #ff6600;\"><em><strong>How to relax</strong></em>:&nbsp;</span>Rapikan rumah segera. Hal ini akan membuat kita lebih tenang dan nyaman. Sikap menunda hanya akan membuat kondisi rumah menjadi semakin berantakan.<a title=\"http://www.preventionindonesia.com/article.php?name=/lebih-nyaman-dan-betah-di-rumah&amp;channel=health%2Fhealthy_home\" href=\"http://paseban.gramediamajalah.com/ngatimin3/Lebih%20Nyaman%20dan%20Betah%20di%20Rumah\" target=\"_blank\">&nbsp;<strong>KLIK</strong></a>&nbsp;untuk tip bebenah rumah yang praktis.<br /><br /><strong><span style=\"color: #ff0000;\">Tidak olahraga</span><br /></strong><br /><br />Terkadang olahraga dan beberapa hal lain bisa membuat kita merasa tertekan. Beberapa kali tidak pergi ke&nbsp;<em>gym</em>kadang membuat kita merasa bersalah dan stres karena tidak bisa menjaga tubuh. Apalagi jika hal ini menyebabkan kita sakit.<br /><span style=\"color: #ff9900;\"><em><strong>How to relax:</strong></em>&nbsp;</span>Temukan waktu dalam sehari di mana kita yakin bisa melakukan olahraga. Walaupun itu berarti meluangkan 20 menit waktu istirahat makan siang untuk sesi latihan. Mereka yang berolahraga 5 kali dalam seminggu memiliki<a title=\"Langkah Penangkal Flu\" href=\"http://www.preventionindonesia.com/article.php?name=/langkah-penangkal-flu&amp;channel=fitness\" target=\"_blank\">&nbsp;<strong>risiko lebih rendah terkena flu</strong></a><strong>.</strong><br /><br /><strong><span style=\"color: #ff0000;\">Kurang tidur</span><br /></strong><br /><br />Seringkali mereka yang stres mencoba untuk menenangkan diri dengan menyesap segelas anggur dan duduk di depan TV sepanjang malam. Alkohol dan&nbsp;<strong><a title=\"Hati-Hati, Elektronik Insomnia Mengintai\" href=\"http://www.preventionindonesia.com/article.php?name=/hatihati-elektronik-insomnia-mengintai&amp;channel=pilihan\" target=\"_blank\">cahaya yang keluar dari layar</a></strong>&nbsp;sebenarnya akan mengganggu kemampuan tubuh untuk beristirahat dan tidur. Dengan melakukan ini, kita pun harus menghadapi beberapa jam memikirkan persoalan yang sedang kita hadapi saat ini.<br /><br /><span style=\"color: #ff6600;\"><em><strong>How to relax:</strong></em>&nbsp;</span>Berhentilah&nbsp;<em>online</em>, matikan televisi, dan ambillah waktu untuk melakukan relaksasi demi menurunkan tensi stres. Kita bisa meluangkan beberapa waktu untuk berendam di air hangat, membaca buku, atau menuliskan perasaan kita melalui tulisan. Habiskan setidaknya 30 menit untuk menyiapkan tubuh rileks sebelum akhirnya tertidur.&nbsp;<strong>(Grace Natali)</strong></p>', 'Hidup Sehat', 'admin', '2012-01-15', '2012-02-15', '1', 'uploads/66262_42-19162687 overwhelmed.jpg');
INSERT INTO `berita` VALUES ('43', 'Bahaya! Asap Rokok dalam Mobil', '<p>Mobil pribadi merupakan area privasi yang harus dijaga kebersihannya dengan baik. Namun, apa jadinya jika kita mengangkut anak-anak di dalamnya dan mulut tak henti-hentinya mengeluarkan asap bak lokomotif kereta api? Kita harus mulai waspada!<br /><br />Penelitian yang dilakukan British Medical Association (BMA) menyatakan merokok dalam ruangan kecil dan tertutup 23 kali lebih beracun dibandingkan dalam restoran penuh asap rokok. Asap terperangkap di ruangan tanpa bisa disalurkan ke tempat lain.<br /><br />Hal ini lebih berbahaya bagi anak-anak. Karena sistem imunitas si kecil belum terbentuk dengan baik, maka mereka akan menyerap polusi lebih banyak ke dalam tubuh. Anak-anak menjadi lebih rentan terkena penyakit dan bisa berdampak buruk bagi kesehatannya.</p>\r\n<p>&nbsp;</p>\r\n<p>&ldquo;Di Inggris, setiap tahun ditemukan lebih dari 80 ribu kematian yang diakibatkan oleh rokok. Kasus ini meningkat menjadi 6 juta di dunia. Namun, di balik angka statistik ini, dokter meneliti kasus per individu yang disebabkan oleh karena mereka merokok atau hanya menjadi perokok pasif. Karena alasan inilah dokter berkomitmen untuk mengurangi dampak yang diakibatkan oleh tembakau&rdquo; ungkap Dr Vivienne Nathanson dari BMA.<br /><br />Jika dokter saja memperhatikan hal ini, mengapa kita tidak turut menjaga kesehatan diri serta anak-anak? Mari berhenti merokok dari sekarang untuk kehidupan yang lebih baik.&nbsp;<strong>(Grace Natali)</strong></p>', 'Hidup Sehat', 'admin', '2012-01-15', '2012-02-15', '1', '');
INSERT INTO `berita` VALUES ('49', 'Olahraga Pintar Pembasmi Stres', '<p>Lemaskan otot-otot yang tegang dan pikiran yang membeludak lewat nikmatnya&nbsp;<em>tai chi</em>.</p>\r\n<p>Olahraga asal negeri tirai bambu ini seringkali diidentikkan sebagai olahraga orang tua. Sebabnya,&nbsp;<em>tai chi&nbsp;</em>diwarnai dengan berbagai kombinasi gerakan lambat dan posisi yang cenderung stabil. Namun, siapa sangka justru olahraga ini bisa menjadi sahabat di kala stres.<br /><br />Hal ini diungkapkan dalam 2 studi yang dipublikasikan dalam 2 jurnal,&nbsp;<em>British Journal Sports Medicine</em>&nbsp;dan&nbsp;<em>Journal of American College Health</em>. Keduanya menyimpulkan rangkaian gerakan dalam&nbsp;<em>tai chi</em>&nbsp;yang menyebabkan efek relaksasi itu terjadi.<br /><br /><em>Tai chi</em>&nbsp;merupakan olahraga yang biasanya dilakukan dalam posisi berdiri. Saat berlatih, kita berulang kali menggerakkan badan, melibatkan otot-otot yang ada di bagian atas dan bawah tubuh. Hal ini dilakukan selaras dengan irama napas.<br /><br />Pergesaran tubuh yang lambat dan mengalir inilah yang membuat otot menjadi rileks dan pikiran tenang. Di sisi lain, pergerakan ini juga meningkatkan keseimbangan, kekuatan, dan fleksibilitas tubuh.<br /><br />Untuk mendapatkan hasil yang maksimal, berlatihlah tai chi setiap pagi selama 20 menit. Selain mengurangi stres, kita juga bisa menjadi&nbsp;<a title=\"Olahraga Kuno untuk Awet Muda\" href=\"http://preventionindonesia.com/article.php?name=/olahraga-kuno-untuk-awet-muda&amp;channel=fitness%2Fcardio\" target=\"_blank\">lebih muda</a>&nbsp;berkat olahraga dari Cina ini.&nbsp;(Grace Natali)</p>', 'Umum', 'admin', '2012-01-15', '2012-02-15', '1', '');
INSERT INTO `berita` VALUES ('50', 'Mari Jadi Green Traveler', '<p>Jika ditanyakan soal destinasi utama untuk menghabiskan liburan, mungkin kita akan menyebutkan beberapa tempat seperti Bali, Lombok, Singapura, Malaysia, Jepang, atau bahkan Perancis. Padahal, di Indonesia sendiri masih banyak tempat-tempat wisata yang belum banyak diekspos.<br /><br />Dalam bukunya,&nbsp;<em>The Green Traveler</em>&nbsp;yang diluncurkan 30 November 2011 di Plaza Senayan, Jakarta, Wiwik Mahdayani ingin menceritakan keindahan 18 tempat wisata di Indonesia. Sebut saja Nias, kampong Gayo, suaka gunung Leuser, serta daerah Wae Rebo di Flores.<br />Namun, keindahan tempat-tempat tersebut tidak dituturkan begitu saja oleh Wiwik. Lulusan&nbsp;<em>Tourism Destination Management</em>&nbsp;Universitas Bordeaux, Perancis ini turut mengajak pembacanya menjadi seorang&nbsp;<em>green traveler</em>.<br /><br />Menjadi seorang&nbsp;<em>green traveler</em>&nbsp;ternyata tak sesulit yang kita bayangkan. Tak perlu membawa tas ransel besar dan melakukan perjalanan sulit untuk menikmati alam. Istilah ini sebenarnya mengacu pada perjalanan yang selain mejaga kelestarian alam serta budaya tempat tersebut namum juga memberi manfaat bagi masyarakat sekitar. Jadi, selain mendapatkan kenikmatan berekreasi, kita juga memberi sumbangsih untuk kemajuan daerah tersebut.</p>\r\n<p>Buku ini cocok untuk dijadikan panduan wisata bagi kita yang ingin datang ke 18 spot wisata tersebut. Karena selain disuguhi foto-foto dan cerita menarik mengenai lokasi-lokasi tersebut,&nbsp;<em>The Green Traveler</em>&nbsp;juga dilengkapi dengan informasi praktis serta pengetahuan mengenai tempat wisata ini. Jadi, tidak ada kata bengong dan bingung karena kurang paham mengenai tempat-tempat tersebut.<br /><br />Jadi tunggu apalagi? Segera berkemas dan bergabunglah menjadi pasukan&nbsp;<em>green traveler</em>&nbsp;Indonesia.&nbsp;<strong>(Grace Natali)</strong></p>', 'Umum', 'admin', '2012-01-15', '2012-02-15', '1', '');
INSERT INTO `berita` VALUES ('51', 'Kiwi Turunkan Hipertensi', '<p>Meski pada umumnya tekanan darah tinggi atau hipertensi tidak bergejala, namun bukan berarti kondisi ini tidak berbahaya. Jika tidak dirawat, tekanan darah tinggi yang berlebihan bisa merusak banyak organ dan jaringan.&nbsp;<br /><br />Salah satu upaya untuk menurunkan tekanan darah tinggi adalah mengonsumsi variasi makanan dengan kombinasi berbagai gizi yang tepat. Hasil penelitian yang disampaikan dalam pertemuan American Heart Association di Orlando, Amerika Serikat, disebutkan konsumsi kiwi tiga kali dalam sehari cukup efektif menurunkan hipertensi.<br /><br />Penelitian dilakukan oleh Mette Svendsen dari Oslo University Hospital, Norwegia, selama 8 minggu terhadap 118 orang berusia 55 tahun dan menderita hipertensi sedang.&nbsp;<br /><br />Para responden dibagi ke dalam dua kelompok, pertama adalah yang mengonsumsi tiga buah kiwi setiap hari dan sisanya mengonsumsi makanan yang mengandung apel satu kali dalam sehari.&nbsp;<br /><br />Setelah 8 minggu, para peneliti menemukan nilai tekanan sistolik (angka tekanan darah sebelah atas) para partisipan lebih rendah 3,6 milimeter dibanding dengan partisipan yang mengonsumsi apel.&nbsp;<br /><br />Walau kelompok pemakan kiwi memiliki tekanan darah lebih rendah, namun para peneliti belum mengetahui apakah penyebab utamanya. Hal ini baru bisa dikonfirmasi dengan penelitian yang lebih luas.</p>', 'Hipertensi', 'admin', '2012-01-15', '2012-02-15', '1', 'uploads/kiwi.jpg');
INSERT INTO `berita` VALUES ('52', '4 Superfood Pengusir Depresi', '<p>Tak ada salahnya menyesap secangkir kopi ketika stres datang.&nbsp;<span style=\"color: #800080;\"><strong><a title=\"Kurangi Depresi dengan Kopi\" href=\"http://www.preventionindonesia.com/article.php?name=/kurangi-depresi-dengan-kopi&amp;channel=pilihan\" target=\"_blank\">Penelitian</a></strong></span>&nbsp;membuktikan wanita yang biasa meminum kopi tinggi kafein memiliki risiko mengalami depresi 20% lebih rendah. Namun, tak selamanya minuman hitam ini bisa jadi penyelamat di kala tekanan datang bertubi-tubi.<br /><br />Dalam kondisi seperti ini, masih ada 4 sahabat kopi lain yang akan jadi penyelamat. Berkenalanlah dengan mereka dan dapatkan efek menenangkan yang tiada duanya.<br /><br /><strong><span style=\"color: #008000;\">Salmon</span><br /></strong><br /><br />Asam lemak omega-3 yang dikandungnya akan membantu sel otak untuk meningkatkan konsentrasi dompamin dan serotonin. Keduanya merupakan&nbsp;<em>neurotransmitter&nbsp;</em>yang meregulasi perubahan&nbsp;<em>mood&nbsp;</em>menjadi bahagia.&nbsp;<em>Seafood</em>, seperti salmon dan sarden merupakan makanan kaya omega-3. Dalam sebuah studi yang dilansir dalam&nbsp;<em>Journal of Clinical Psychiatry</em>, mereka yang memiliki kadar asam lemak omega 3 yang rendah dilaporkan memiliki gejala depresi yang ringan hingga moderat.<br /><br /><span style=\"color: #008000;\"><strong>Kunyit</strong></span><br /><br />Kunyit sering digunakan bangsa Persia tradisional sebagai obat untuk meningkatkan&nbsp;<em>mood</em>. Biasanya rempah ini digunakan dalam teh herbal atau saat menanak nasi. Peneliti asal Tehran University of Medical Sciences, Shahin Akhondzadeh, Ph.D., menemukan kunyit memiliki efek antidepresi yang lebih baik ketimbang kandungan&nbsp;<em>fluoxentine&nbsp;</em>yang ada dalam obat penenang Prozac. Kunyit membuat otak melepaskan lebih banyak hormon serotonin. Tak heran&nbsp;<em>mood&nbsp;</em>pun membaik setelah mengonsumsinya.</p>\r\n<p><span style=\"color: #008000;\"><strong>Cokelat</strong></span><br /><br />Cokelat memang mujarab. Antioksidan yang dikandungnya membantu menurunkan level kortisol yang biasa dikenal sebagai hormon pembuat stres. Orang stres yang terbiasa mengonsumsi 40 gram<em>&nbsp;dark chocolate</em>&nbsp;setiap harinya selama 2 minggu terbukti mengalami pengurangan hormon stres. Studi ini dilakukan oleh Nestl&eacute; Research Center di Swiss.<br /><br />Pilihlah&nbsp;<em>dark chocolate</em>&nbsp;yang mengandung kakao tinggi untuk mendapatkan antioksidan terbanyak. Dan hati-hatilah, dalam 40 gram cokelat tersebut terkandung 230 kalori.<br /><br /><strong><span style=\"color: #008000;\">Karbohidrat</span><br /></strong><br /><br />Menghilangkan karbohidrat dalam menu makanan bisa menyebabkan konsekuensi tidak terduga,&nbsp;<em>mood&nbsp;</em>yang berantakan. Peneliti menduga hal ini disebabkan karena karbohidrat meningkatkan produksi serotonin. Dalam sebuah studi yang dimuat dalam<em>&nbsp;Archives of Internal Medicine</em>, mereka yang mengikuti diet<em>&nbsp;low carb</em>&nbsp;selama setahun yang hanya memperbolehkan asupan karbohidrat 20-40 gram, mengalami lebih banyak depresi, kegelisahan, dan kemarahan lebih banyak.<br /><br />Jangan salah pilih. Ceriakan hari dengan menambahkan 4 makanan di atas ke dalam menu favorit. Dan dapatkan senyum mengembang setiap hari.&nbsp;<strong>(Grace Natali)</strong></p>', 'Hidup Sehat', 'admin', '0000-00-00', '0000-00-00', '0', 'uploads/66281_depresi - rz.jpg');
INSERT INTO `berita` VALUES ('53', 'Kita Perlu Konsumsi 5 Makanan ?Jahat? Ini', '<p>Makanan yang sering kali dihindari ini ternyata punya sisi baik tersendiri untuk kesehatan tubuh kita.</p>\r\n<p><br />Bisa dibilang 5 makanan ini merupakan big enemy bagi mereka yang sedang menjalani diet. Alasannya, makanan ini terlalu tinggi lemak, karbohidrat, dan kalori. Tapi tahukah, kalau kelimanya memiliki sisi baik sendiri yang membuatnya patut untuk didekati. Bahkan, diam-diam mereka juga punya khasiat tambahan yang menyehatkan.</p>\r\n<p>Inilah sisi baik kelima makanan yang kerap dianggap &ldquo;jahat&rdquo; itu.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Selai kacang</strong></p>\r\n<p>Bad side: Siapa sangka di balik kenikmatan selai ini, tersembunyi lemak yang tinggi, sekitar 180-210 kalori per sajian. Angka yang cukup untuk menjadikannya musuh dalam selimut bagi para pediet.<br />Good side: Makanan ini terkenal sebagai sumber kalori. Namun, jangan salah. Selai kacang menyediakan protein dan folat yang penting untuk membentuk kesehatan dari sel-sel baru.<br />Don&rsquo;t over do it: Jika tak ingin diet rusak, konsumsilah selai kacang dalam batas-batas tertentu. Puaskan lidah dengan satu atau dua sendok makan setiap hari. Satu sendok selai kacang mengandung sekitar 90 kalori.</p>\r\n<p><strong>Telur</strong></p>\r\n<p>Bad side: Merupakan sumber utama kolesterol, terutama lemak yang terkandung dalam kuning telur. Lemak inilah yang biasa dihindari oleh mereka yang memiliki gangguan kesehatan jantung. Apalagi fakta yang membuktikan dalam satu butir telur terkandung 212 mg kolesterol.<br />Good side: Ahli medis membuktikan lemak yang terkandung dalam telur tidaklah sejahat lemak jenuh dan lemak trans. Kedua lemak inilah yang sebenarnya merupakan penjahat utama dalam menaikkan kolesterol dalam darah.<br />Selain itu, kuning telur mengandung lutein dan zeaxanthin yang bisa mengurangi risiko kebutaan pada orang berusia di atas 50 tahun.<br />Don&rsquo;t over do it: Jangan ragu untuk menyantap telur di pagi hari. Satu butir telur hanya mengandung 71 kalori. Jumlah ini cukup baik bagi mereka yang sedang menjalani diet. Bahkan penelitian mengatakan sarapan dengan telur membakar kalori lebih banyak ketimbang sarapan roti bakar dengan selai.</p>\r\n<p><strong>Daging Sapi</strong></p>\r\n<p>Bad side: Daging sapi termasuk ke dalam daftar daging merah yang dihindari. Alasannya karena penuh dengan lemak jenuh dan kolesterol. Dua hal ini harus dijauhi oleh mereka yang peduli akan kesehatan jantung.<br />Good side: Daging sapi tanpa lemak merupakan sumber protein yang rendah lemak dan kaya akan zat besi. Zat ini merupakan mineral penting yang dibutuhkan untuk membawa oksigen dari paru-paru ke sel-sel di seluruh tubuh. Hal ini terutama dibutuhkan oleh wanita yang sedang mengandung.<br />Don&rsquo;t over do it: Dibandingkan menghindari semua jenis daging sapi, ada baiknya kita memilih untuk mengonsumsi daging sapi tanpa lemak. Misalnya, filet mignon dan sirloin. Dengan demikian, kita akan terhindar dari lemak jenuh sambil tetap mendapatkan asupan protein dan zat besi yang dibutuhkan tubuh.</p>\r\n<p><strong>Cokelat</strong></p>\r\n<p>Bad side: Camilan ini identik dengan kandungan lemak dan gula yang sangat tinggi.<br />Good side: Jangan keburu mengernyitkan dahi ketika disuguhi cokelat, terutama jika itu adalah dark chocolate. Cokelat yang satu ini mengandung flavanoid, antioksidan yang berfungsi menurunkan tekanan gula dalam darah. Tentu saja hal ini baik untuk kesehatan kardiovaskular.<br />Don&rsquo;t over do it: Penelitian dari Swiss menemukan mengonsumsi dark chocolate sebanyak 40 gram setiap hari selama dua minggu bisa mengurangi kadar hormon stres, yaitu kortisol. Namun, jangan kebablasan dalam mengonsumsinya. Dalam 40 gram dark chocolates terkandung 235 kalori.</p>\r\n<p><strong>Kentang</strong></p>\r\n<p>Bad side: Kentang menduduki peringkat yang cukup tinggi dalam tingkat angka glikemik indeks (GI). Semakin tinggi angka glikemik indeks suatu makaan, semakin cepat pula makanan tersebut menaikkan gula darah kita. Kentang juga terbukti mengganggu produksi insulin yang menjadi problem besar untuk para penderita diabetes.<br />Good side: Kentang diam-diam merupakan sumber serat, potassium, dan vitamin C yang cukup menggiurkan. Jika kita tidak mengonsumsinya teralalu banyak, angka GI kentang tak akan cukup besar pengaruhnya dalam tubuh.<br />Don&rsquo;t over do it: Makanlah kentang dengan sedikit menambahkan minyak zaitun ke atasnya. Dengan demikian kentang akan berubah menjadi menu yang memiliki GI yang rendah. Minyak zaitun akan menambahkan lemak yang berfungsi menyerap karbohidrat yang dihasilkan oleh kentang itu sendiri.</p>\r\n<p>So, let&rsquo;s enjoy the &ldquo;bad&rdquo; foods from now. (Grace Natali)</p>', 'Hidup Sehat', 'user1', '0000-00-00', '0000-00-00', '0', 'uploads/66241_istk - HL.jpg');
INSERT INTO `berita` VALUES ('54', 'Dilarang Makan Cepat-Cepat!', '<p>Kesibukan seringkali menjadi alasan kita harus menyelesaikan waktu makan secepatnya. Tugas yang menumpuk di meja masih harus diselesaikan. Namun, ternyata penelitian menemukan dengan memelihara kebiasaan itu risko tubuh kita&nbsp; melar menjadi lebih cepat.<br /><br />Universitas Osaka memperhatikan kebiasaan makan 3 ribu orang. Hasilnya? 84% pria yang makan dengan cepat mengalami obesitas. Sedangkan, wanita dengan perilaku ini cenderung berisiko 2 kali lebih besar mengalami kegemukan dibandingkan yang makan secara normal.<br /><br />Makan terlalu cepat membuat kita tidak mengindahkan \'pesan\' otak yang menyatakan bahwa perut sudah kenyang. Padahal sinyal kenyang tersebut membutuhkan waktu selama 20 menit untuk sampai ke otak. &ldquo;Saraf mengirimkan sinyal kepada otak bahwa perut sudah penuh. Di saat yang sama, kadar hormon<em>ghrelin</em>&nbsp;yang keluar saat kita lapar berkurang. Dengan makan terlalu cepat, pesan kenyang tersebut tidak akan sampai tepat waktu ke otak. Akibatnya, kita kekenyangan karena terlalu banyak makan,&rdquo; papar Profesor Ian McDonald dari Universitas Nottingham.<br /><br />Selain menggemukkan, Dr David Forecast, konsultan<em>gastroenterologist&nbsp;</em>dari London Clinic dan St. Mark&rsquo;s Hospital, mengatakan makan terlalu cepat membuat angin masuk ke dalam tubuh dan menyebabkan ketidaknyamanan. &ldquo;Dengan makan terlalu cepat, kita menelan udara yang cukup banyak sehingga menyebabkan ketidaknyamanan pada saluran pencernaan,&rdquo; jelas Dr Forecast.&nbsp;<strong>(Grace Natali)</strong></p>', 'Umum', 'user1', '0000-00-00', '0000-00-00', '0', 'uploads/66116_eating women rz.jpg');
INSERT INTO `berita` VALUES ('55', 'Cegah Diabetes dalam 3 Menit', '<p>Siapa bilang mencegah penyakit diabetes itu sulit? Ternyata kuncinya terletak pada intensitas dan frekuensi kita berolahraga. Hanya dengan meluangkan sedikit waktu bersepeda, kita bisa mengurangi risiko terkena penyakit gula.<br /><br />Para partisipan dalam penelitian yang dilakukan oleh University of Bath diwajibkan untuk bersepeda cepat 3 kali 20 detik selama 3 kali dalam seminggu. Setelah 6 minggu, peneliti menemukan partisipan mengalami peningkatan fungsi insulin sebanyak 28%. Penelitian ini dipublikasikan dalam&nbsp;<em>European Journal of Applied Physiology</em>.<br /><br />&ldquo;Untuk mengisi bahan bakar setelah berlatih, otot butuh mengambil gula yang berasal dalam darah. Orang yang tidak aktif hanya memiliki sedikit otot untuk melakukan pembakaran gula darah. Hal ini membuat tubuh tidak sensitif terhadap insulin, memiliki tingkat gula darah yang tinggi, dan mungkin menyebabkan diabetes tipe 2,&rdquo; papar Dr Niels Vollaard, pemimpin studi ini.<br /><br />Tak perlu waktu lama untuk menurunkan gula dalam darah. Cukup sediakan 3 menit mulai dari sekarang dan nikmati hidup sehat setelahnya.&nbsp;<strong>(Grace Natali)</strong></p>', 'Diabetes', 'user1', '0000-00-00', '0000-00-00', '0', 'uploads/66295_sepeda statis - rz.jpg');

-- ----------------------------
-- Table structure for `captcha`
-- ----------------------------
DROP TABLE IF EXISTS `captcha`;
CREATE TABLE `captcha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insertdate` datetime NOT NULL,
  `referenceid` varchar(100) NOT NULL DEFAULT '',
  `hiddentext` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of captcha
-- ----------------------------
INSERT INTO `captcha` VALUES ('85', '2012-01-21 12:48:48', '40920570029952', '8wm');
INSERT INTO `captcha` VALUES ('86', '2012-01-21 12:48:56', '22685873655984', '4jt');
INSERT INTO `captcha` VALUES ('87', '2012-01-21 12:49:07', '2104820165942', 'r9y');
INSERT INTO `captcha` VALUES ('88', '2012-01-21 12:49:24', '5270013232044', 'gyh');
INSERT INTO `captcha` VALUES ('89', '2012-01-21 12:49:36', '22159005724272', 'zdh');

-- ----------------------------
-- Table structure for `komentar`
-- ----------------------------
DROP TABLE IF EXISTS `komentar`;
CREATE TABLE `komentar` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(16) NOT NULL,
  `email` varchar(32) NOT NULL,
  `website` varchar(64) DEFAULT NULL,
  `komentar` text NOT NULL,
  `id_berita` int(11) NOT NULL,
  PRIMARY KEY (`idx`,`id_berita`),
  KEY `komentar_id_berita` (`id_berita`),
  CONSTRAINT `komentar_id_berita` FOREIGN KEY (`id_berita`) REFERENCES `berita` (`idx`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of komentar
-- ----------------------------
INSERT INTO `komentar` VALUES ('1', 'Neki Arismi', 'neki@neki.com', 'belajarbersama-neki.blogspot.com', 'nice ^^b', '1');
INSERT INTO `komentar` VALUES ('2', 'Nurvina Ahdiani', 'vina@vina.com', 'belajarbersama-neki.blogspot.com', 'nice ^^b', '1');
INSERT INTO `komentar` VALUES ('139', 'gilang', '', '', 'test test ^^v', '3');
INSERT INTO `komentar` VALUES ('140', 'tiwi', '', '', 'love kiwiiiiii', '51');
INSERT INTO `komentar` VALUES ('141', 'ANDRY', 'andry@and-inside.com', 'http://and-inside.com', 'mantap', '2');
INSERT INTO `komentar` VALUES ('142', 'topan', 'topanpakketu@gmail.com', 'topan.com', 'I hate ciggarette', '43');
INSERT INTO `komentar` VALUES ('143', 'Windu', 'windu@ndu.com', '', 'penting banget air tuh', '2');
INSERT INTO `komentar` VALUES ('144', 'Samudra', 'dra@indro.com', '', 'betul ga semua org gemuk itu pasti ada diabetesnya -_-', '1');
INSERT INTO `komentar` VALUES ('145', 'swan', 'wan@di.com', '', 'kiwi mahal booo... murah pisang ato smangka deh manfaatnya juga sama ;)', '51');
