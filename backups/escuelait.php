<?php
/**
 * Export to PHP Array plugin for PHPMyAdmin
 * @version 5.2.1
 */

/**
 * Database `escuelait`
 */

/* `escuelait`.`accounting` */
$accounting = array(
  array('id' => '1','Ticket' => '1','debit' => '0','credit' => '1','payment_type' => '5','payment_number' => '1','user' => '14','total' => '51755.97','detail' => NULL,'date' => '2023-09-12 21:49:21'),
  array('id' => '2','Ticket' => '2','debit' => '0','credit' => '1','payment_type' => '6','payment_number' => '1','user' => '10','total' => '6715.19','detail' => NULL,'date' => '2023-09-12 21:49:21'),
  array('id' => '3','Ticket' => '3','debit' => '0','credit' => '1','payment_type' => '2','payment_number' => '1','user' => '14','total' => NULL,'detail' => NULL,'date' => '2023-09-12 21:49:21')
);

/* `escuelait`.`accounting_details` */
$accounting_details = array(
  array('id' => '1','ticket' => '1','product' => '2','quantity' => '3','price' => '2999.99'),
  array('id' => '2','ticket' => '1','product' => '4','quantity' => '9','price' => '2392.00'),
  array('id' => '3','ticket' => '1','product' => '3','quantity' => '8','price' => '2216.00'),
  array('id' => '4','ticket' => '1','product' => '1','quantity' => '1','price' => '3500.00'),
  array('id' => '5','ticket' => '2','product' => '5','quantity' => '2','price' => '1557.60'),
  array('id' => '6','ticket' => '2','product' => '3','quantity' => '0','price' => '2659.20'),
  array('id' => '7','ticket' => '2','product' => '2','quantity' => '1','price' => '3599.99')
);

/* `escuelait`.`authors` */
$authors = array(
  array('id' => '1','name' => 'MIGUEL DE CERVANTES','birthdate' => '1547-01-01'),
  array('id' => '2','name' => 'MARQUÉS DE SADE','birthdate' => '1740-01-01'),
  array('id' => '3','name' => 'GOETHE','birthdate' => '1749-01-01'),
  array('id' => '4','name' => 'JANE AUSTEN','birthdate' => '1775-01-01'),
  array('id' => '5','name' => 'MARY SHELLEY','birthdate' => '1797-01-01'),
  array('id' => '6','name' => 'VICTOR HUGO','birthdate' => '1802-01-01'),
  array('id' => '7','name' => 'CHARLES DICKENS','birthdate' => '1812-01-01'),
  array('id' => '8','name' => 'HERMAN MELVILLE','birthdate' => '1819-01-01')
);

/* `escuelait`.`books` */
$books = array(
  array('id' => '1','name' => 'Frankenstein','description' => 'La novela narra la historia de Víctor Frankenstein, un joven suizo, estudiante de medicina en Ingolstadt, obsesionado por conocer "los secretos del cielo y la tierra". En su afán por desentrañar "la misteriosa alma del hombre", Víctor crea un cuerpo a partir de la unión de distintas partes de cadáveres diseccionados.','author' => '5','stock' => '275','price' => '4200.00'),
  array('id' => '2','name' => 'Moby Dick','description' => 'La historia de la obsesiva persecución de una ballena por el Capitán Ahab se ha convertido en ítem imprescindible de la cultura universal. El lector no encontrará obra más filosófica, tratado sobre el mar más erudito y, algo no menos importante, novela de aventuras más épica que la presente.','author' => '8','stock' => '428','price' => '3599.99'),
  array('id' => '3','name' => 'Los miserables','description' => 'Jean Valjean, un ex convicto al que encerraron durante veinte años por robar un pedazo de pan, se convierte en un hombre ejemplar que lucha contra la miseria y la injusticia y que empeña su vida en cuidar a la hija de una mujer que ha debido prostituirse para salvar a la niña. Así, Jean Valjean se ve obligado a cambiar varias veces de nombre, es apresado, se fuga y reaparece. Al mismo tiempo, debe eludir al comisario Javert, un policía inflexible que lo persigue convencido de que tiene cuentas pendientes con la justicia.','author' => '6','stock' => '382','price' => '2659.20'),
  array('id' => '4','name' => 'Oliver Twist','description' => '','author' => '7','stock' => '283','price' => '2870.40'),
  array('id' => '5','name' => 'La tienda de antigüedades','description' => '','author' => '7','stock' => '492','price' => '1557.60'),
  array('id' => '6','name' => 'La pequeña Dorrit','description' => '','author' => '7','stock' => '527','price' => '3372.00')
);

/* `escuelait`.`books_by_genres` */
$books_by_genres = array(
  array('id' => '2','book' => '1','genre' => '5'),
  array('id' => '1','book' => '1','genre' => '13'),
  array('id' => '7','book' => '2','genre' => '9'),
  array('id' => '8','book' => '2','genre' => '10')
);

/* `escuelait`.`contacts` */
$contacts = array(
);

/* `escuelait`.`courses` */
$courses = array(
  array('id' => '1','name' => 'MySQL','description' => 'Introduccion a Bases de Datos Relaciones'),
  array('id' => '2','name' => 'MATEMATICAS','description' => 'Operaciones artimeticologicas'),
  array('id' => '3','name' => 'NTICs','description' => 'Nuevas Tecnologias de la Informatica y la Comunicacion'),
  array('id' => '4','name' => 'FISICA','description' => 'velocidad, aceleracion, gravedad, mru y mruv'),
  array('id' => '5','name' => 'QUIMICA','description' => 'formulas soluciones, acidos, anion, cation'),
  array('id' => '6','name' => 'BIOLOGIA','description' => ''),
  array('id' => '7','name' => 'HTML5','description' => 'Fundamentos Web con HTML y CSS'),
  array('id' => '8','name' => 'SOCIALES','description' => 'Presidencias, Revoluciones y Movimientos sociales'),
  array('id' => '9','name' => 'GEOGRAFIA','description' => 'Paises y capitales del Mundo, fallas geograficas y Climas'),
  array('id' => '10','name' => 'CCNA1','description' => 'Fundamentos de Redes'),
  array('id' => '11','name' => 'CCNA2','description' => 'Enrutamiento y Conmutacion'),
  array('id' => '12','name' => 'CCNA3','description' => 'Redes Empresariales')
);

/* `escuelait`.`courses_assignment` */
$courses_assignment = array(
  array('id' => '1','course' => '1','teacher' => '1','start_date' => '2023-07-18','end_date' => '2023-09-01','day' => 'M,V','start_time' => '10:00:00','end_time' => '12:00:00'),
  array('id' => '2','course' => '7','teacher' => '1','start_date' => '2023-07-18','end_date' => '2023-08-22','day' => 'M,J','start_time' => '20:00:00','end_time' => '22:00:00'),
  array('id' => '3','course' => '4','teacher' => '2','start_date' => '2023-07-12','end_date' => '2023-08-09','day' => 'X,V','start_time' => '10:00:00','end_time' => '12:00:00'),
  array('id' => '4','course' => '6','teacher' => '2','start_date' => '2023-07-27','end_date' => '2023-08-24','day' => 'L,J','start_time' => '14:00:00','end_time' => '16:00:00')
);

/* `escuelait`.`courses_detail` */
$courses_detail = array(
  array('id' => '12','student' => '1','course' => '2'),
  array('id' => '17','student' => '1','course' => '3'),
  array('id' => '5','student' => '1','course' => '4'),
  array('id' => '8','student' => '2','course' => '1'),
  array('id' => '19','student' => '2','course' => '3'),
  array('id' => '4','student' => '2','course' => '4'),
  array('id' => '9','student' => '3','course' => '1'),
  array('id' => '20','student' => '4','course' => '3'),
  array('id' => '6','student' => '5','course' => '1'),
  array('id' => '13','student' => '6','course' => '2'),
  array('id' => '3','student' => '6','course' => '4'),
  array('id' => '7','student' => '7','course' => '1'),
  array('id' => '15','student' => '7','course' => '2'),
  array('id' => '10','student' => '8','course' => '1'),
  array('id' => '11','student' => '8','course' => '2'),
  array('id' => '2','student' => '8','course' => '4'),
  array('id' => '16','student' => '9','course' => '3'),
  array('id' => '14','student' => '10','course' => '2'),
  array('id' => '18','student' => '10','course' => '3'),
  array('id' => '1','student' => '10','course' => '4')
);

/* `escuelait`.`exams` */
$exams = array(
  array('id' => '1','student' => '2','course' => '2','note' => '7.52','module' => '5'),
  array('id' => '2','student' => '1','course' => '1','note' => '9.98','module' => '2'),
  array('id' => '3','student' => '6','course' => '4','note' => '6.13','module' => '4'),
  array('id' => '4','student' => '6','course' => '2','note' => '6.50','module' => '1'),
  array('id' => '5','student' => '6','course' => '1','note' => '6.58','module' => '3'),
  array('id' => '6','student' => '10','course' => '2','note' => '9.73','module' => '3'),
  array('id' => '7','student' => '5','course' => '2','note' => '4.02','module' => '4'),
  array('id' => '8','student' => '6','course' => '3','note' => '3.19','module' => '2'),
  array('id' => '9','student' => '2','course' => '2','note' => '5.64','module' => '4'),
  array('id' => '10','student' => '10','course' => '1','note' => '4.37','module' => '2'),
  array('id' => '11','student' => '4','course' => '4','note' => '7.89','module' => '1'),
  array('id' => '12','student' => '8','course' => '1','note' => '7.87','module' => '5'),
  array('id' => '13','student' => '6','course' => '1','note' => '9.70','module' => '2'),
  array('id' => '14','student' => '9','course' => '2','note' => '8.82','module' => '2'),
  array('id' => '15','student' => '1','course' => '1','note' => '8.56','module' => '2'),
  array('id' => '16','student' => '5','course' => '2','note' => '8.78','module' => '2'),
  array('id' => '17','student' => '3','course' => '1','note' => '8.29','module' => '3'),
  array('id' => '18','student' => '4','course' => '2','note' => '7.05','module' => '4'),
  array('id' => '19','student' => '6','course' => '4','note' => '5.73','module' => '1'),
  array('id' => '20','student' => '9','course' => '1','note' => '7.74','module' => '3'),
  array('id' => '21','student' => '3','course' => '1','note' => '9.58','module' => '2'),
  array('id' => '22','student' => '10','course' => '3','note' => '7.02','module' => '4'),
  array('id' => '23','student' => '4','course' => '2','note' => '9.83','module' => '3'),
  array('id' => '24','student' => '2','course' => '4','note' => '3.67','module' => '4'),
  array('id' => '25','student' => '5','course' => '1','note' => '9.51','module' => '2'),
  array('id' => '26','student' => '6','course' => '1','note' => '5.78','module' => '2'),
  array('id' => '27','student' => '10','course' => '2','note' => '3.59','module' => '1'),
  array('id' => '28','student' => '3','course' => '2','note' => '9.23','module' => '2')
);

/* `escuelait`.`literary_genres` */
$literary_genres = array(
  array('id' => '1','name' => 'Accion'),
  array('id' => '2','name' => 'Aventura'),
  array('id' => '3','name' => 'Biografico'),
  array('id' => '4','name' => 'Catastrofe'),
  array('id' => '5','name' => 'Ciencia Ficcion'),
  array('id' => '7','name' => 'Comedia'),
  array('id' => '6','name' => 'Cosmos'),
  array('id' => '8','name' => 'Documental'),
  array('id' => '9','name' => 'Drama'),
  array('id' => '10','name' => 'Fantasia'),
  array('id' => '12','name' => 'Psicologia'),
  array('id' => '11','name' => 'Suspenso'),
  array('id' => '13','name' => 'Terror')
);

/* `escuelait`.`payments` */
$payments = array(
  array('id' => '8','name' => 'cheque'),
  array('id' => '4','name' => 'credito personal'),
  array('id' => '7','name' => 'deposito'),
  array('id' => '1','name' => 'efectivo'),
  array('id' => '5','name' => 'pago virtual'),
  array('id' => '2','name' => 'tarjeta credito'),
  array('id' => '3','name' => 'tarjeta debito'),
  array('id' => '6','name' => 'transferencia')
);

/* `escuelait`.`students` */
$students = array(
  array('id' => '1','userId' => '13','active' => '1'),
  array('id' => '2','userId' => '8','active' => '1'),
  array('id' => '3','userId' => '15','active' => '1'),
  array('id' => '4','userId' => '12','active' => '1'),
  array('id' => '5','userId' => '9','active' => '1'),
  array('id' => '6','userId' => '11','active' => '1'),
  array('id' => '7','userId' => '10','active' => '1'),
  array('id' => '8','userId' => '17','active' => '1'),
  array('id' => '9','userId' => '14','active' => '1'),
  array('id' => '10','userId' => '16','active' => '1')
);

/* `escuelait`.`teachers` */
$teachers = array(
  array('id' => '1','user' => '2','signed' => '2018-11-08 07:35:59','active' => '1'),
  array('id' => '2','user' => '4','signed' => '2023-08-22 22:07:10','active' => '1')
);

/* `escuelait`.`users` */
$users = array(
  array('user_id' => '1','username' => 'c215714n','userpass' => 'root'),
  array('user_id' => '2','username' => 'cristian','userpass' => 'pass'),
  array('user_id' => '4','username' => 'Messi','userpass' => 'e7745'),
  array('user_id' => '5','username' => 'Waldo','userpass' => 'Wa7974'),
  array('user_id' => '6','username' => 'Roman','userpass' => 'm7845'),
  array('user_id' => '7','username' => 'Bob','userpass' => 'o9354'),
  array('user_id' => '8','username' => 'Bret','userpass' => 'B7547'),
  array('user_id' => '9','username' => 'Antonette','userpass' => 't2217'),
  array('user_id' => '10','username' => 'Samantha','userpass' => 'a2588'),
  array('user_id' => '11','username' => 'Karianne','userpass' => 'ri5216'),
  array('user_id' => '12','username' => 'Kamren','userpass' => 'a7407'),
  array('user_id' => '13','username' => 'Leopoldo_Corkery','userpass' => 'po3753'),
  array('user_id' => '14','username' => 'Elwyn.Skiles','userpass' => 'w3255'),
  array('user_id' => '15','username' => 'Maxime_Nienow','userpass' => 'axi8077'),
  array('user_id' => '16','username' => 'Delphine','userpass' => 'l2372'),
  array('user_id' => '17','username' => 'Moriah.Stanton','userpass' => '.S9669'),
  array('user_id' => '19','username' => 'd477714n','userpass' => 'root4ccess')
);

/* `escuelait`.`users_data` */
$users_data = array(
  array('id' => '1','firstname' => 'Lionel','lastname' => 'Messi','birthdate' => '1987-06-24','gender' => 'M','id_type' => 'DNI','uid' => '33016244','address' => NULL,'email' => 'lionel@messi.com','userId' => '4'),
  array('id' => '2','firstname' => 'Roberto','lastname' => 'Pantalones Cuadrados','birthdate' => '1986-07-14','gender' => 'O','id_type' => 'PA','uid' => 'A1356021','address' => NULL,'email' => 'sponge_sqrpnts@gmail.com','userId' => '7'),
  array('id' => '3','firstname' => 'Juan Roman','lastname' => 'Riquelme','birthdate' => '1978-06-24','gender' => 'M','id_type' => 'CUIT','uid' => '20-26752869-2','address' => NULL,'email' => 'Riquelme_feliz10@gmail.com','userId' => '6'),
  array('id' => '4','firstname' => 'Cristian Damian','lastname' => 'Racedo','birthdate' => '1991-04-18','gender' => 'PnD','id_type' => 'CUIT','uid' => '20-35336446-5','address' => NULL,'email' => 'cristiandracedo@hotmail.com','userId' => '1'),
  array('id' => '5','firstname' => 'Bret','lastname' => 'Leanne Graham','birthdate' => NULL,'gender' => NULL,'id_type' => 'PA','uid' => '1-770-736-8031','address' => 'Kulas LightApt. 556,Gwenborough','email' => 'Sincere@april.biz','userId' => '8'),
  array('id' => '6','firstname' => 'Antonette','lastname' => 'Ervin Howell','birthdate' => NULL,'gender' => NULL,'id_type' => 'PA','uid' => '010-692-6593 x09125','address' => 'Victor Plains Suite 879, Wisokyburgh','email' => 'Shanna@melissa.tv','userId' => '9'),
  array('id' => '7','firstname' => 'Samantha','lastname' => 'Clementine Bauch','birthdate' => NULL,'gender' => NULL,'id_type' => 'PA','uid' => '1-463-123-4447','address' => 'Douglas Extension Suite 847','email' => 'Nathan@yesenia.net','userId' => '10'),
  array('id' => '8','firstname' => 'Karianne','lastname' => 'Patricia Lebsack','birthdate' => NULL,'gender' => NULL,'id_type' => 'PA','uid' => '493-170-9623 x156','address' => 'Hoeger Mall Apt. 692, South Elvis','email' => 'Julianne.OConner@kory.org','userId' => '11'),
  array('id' => '9','firstname' => 'Kamren','lastname' => 'Chelsey Dietrich','birthdate' => NULL,'gender' => NULL,'id_type' => 'PA','uid' => '(254)954-1289','address' => 'Skiles Walks Suite 351, Roscoeview','email' => 'Lucio_Hettinger@annie.ca','userId' => '12'),
  array('id' => '10','firstname' => 'Leopoldo_Corkery','lastname' => 'Mrs. Dennis Schulist','birthdate' => NULL,'gender' => NULL,'id_type' => 'PA','uid' => '1-477-935-8478 x6430','address' => 'Norberto Crossing Apt. 950m, South Christy','email' => 'Karley_Dach@jasper.info','userId' => '13')
);
