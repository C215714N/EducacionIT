/*Tabla Alumnos*/
	TRUNCATE alumnos; ## reiniciamos la tabla Alumnos
	INSERT INTO alumnos(nombre, apellido)
	VALUES	
		('Abel',''),
		('Ace',''),
		('Adon',''),
		('Akuma',''),
		('Alex',''),
		('Area',''),
		('Balrog',''),
		('Blair','Dame'),
		('Blanka',''),
		('C.','Viper'),
		('Cammy',''),
		('Charlie','Nash'),
		('Chun-Li',''),
		('Dan','Hibiki'),
		('Darun',''),
		('Decapre',''),
		('Dee','Jay'),
		('Dhalsim',''),
		('Doctrine','Dark'),
		('Dudley',''),
		('Eagle',''),
		('Edmond','Honda'),
		('El Fuerte',''),
		('Elena',''),
		('Eliza','Masters'),
		('Fei','Long'),
		('Geki',''),
		('Gen',''),
		('Gill',''),
		('Gou','Hibiki'),
		('Gouken',''),
		('Guile',''),
		('Guy',''),
		('Hakan',''),
		('Hayate',''),
		('Hugo','Andore'),
		('Ibuki',''),
		('Ingrid',''),
		('Juli',''),
		('Juni',''),
		('Juri','Han'),
		('Kairi',''),
		('Karin','Kanzuki'),
		('Ken','Masters'),
		('Lee',''),
		('M','Bison'),
		('Maki','Genryusai'),
		('Makoto',''),
		('Mike',''),
		('Necro',''),
		('Oro',''),
		('Poison',''),
		('Rainbow','Mika'),
		('Remy',''),
		('Rolento','Schugerg'),
		('Rose',''),
		('Rufus',''),
		('Ryu',''),
		('Sagat',''),
		('Sakura','Kasugano'),
		('Sawada',''),
		('Sean','Matsuda'),
		('Seth',''),
		('Sharon',''),
		('Hawk','Thunder'),
		('Toro',''),
		('Cody','Travers'),
		('Twelve',''),
		('Urien',''),
		('Vega',''),
		('Rosso','Vulcano'),
		('Yang',''),
		('Yun',''),
		('Zangief','');
	SELECT * FROM alumnos;

    UPDATE alumnos 
	    SET 
	    	correo = CONCAT(alumnos.nombre,alumnos.apellido,'@capcom.com') ## actualizacion de correos
	;
	INSERT INTO alumnos
		VALUES
			('Adelheid', 'Bernstein')
			('Alba', 'Meira')
			('Alfred', 'Airhawk')
			('Andy', 'Bogard')
			('Anidas','Nests')
			('Aoi', 'Kusanagi')
			('Armor', 'Ralf')
			('Ash', 'Crimson')
			('Asuka', 'Maria')
			('Athena', 'Asamiya')
			('Aya','Hermione')
			('Baitang','')
			('Bandeiras', 'Hattori')
			('Bao','')
			('Benimaru', 'Nikaido')
			('Billy', 'Kane')
			('Blue', 'Mary')
			('Bonne', 'Jenet')
			('Botan',)
			('Brian', 'Battler')
			('Candy', 'Diamond')
			('Chae', 'Lim')
			('Chang', 'Koehan')
			('Chin', 'Gentsai')
			('Chizuru', 'Kagura')
			('Choi', 'Bounge')
			('Chris','')
			('Clark', 'Steel')
			('Cool', 'Choi')
			('Cool', 'Guy')
			('Cosplayer', 'Kyoko')
			('Diana',)
			('Dr.', 'Makishima')
			('Duck', 'King')
			('Duke','Edwards')
			('Duo', 'Lon')
			('Eiji', 'Kisaragi')
			('Elisabeth', 'Blanctorche')
			('Evil', 'Ash')
			('Fiolina', 'Germi')
			('Foxy','')
			('G','Mantle')
			('Gai', 'Tendo')
			('Gaidel','')
			('Gang','il')
			('Gato')
			('Geese', 'Howard')
			('Glaugan','')
			('God', 'Rugal')
			('Goeniko',)
			('Goro', 'Daimon')
			('Gustab', 'Munchausen')
			('Hanzo', 'Hattori')
			('Haohmaru','')
			('Heavy','D!')
			('Heidern','')
			('Hein','')
			('Hinako', 'Shijo')
			('Hokutomaru','')
			('Honki ni Natta', 'Mr. Karate')
			('Hotaru', 'Futaba')
			('Hwa', 'Jai')
			('Hyena','')
			('Igniz','')
			('Iori', 'Yagami')
			('Isolde','')
			('Jean','')
			('Jefe','')
			('Jeff', 'Bogard')
			('Jhun', 'Hoon')
			('Jivatma','')
			('Joe', 'Higashi')
			('Jokyojo','')
			('Jun', 'Kagami')
			('Junko', 'Sendo')
			('Jyazu','')
			('Kaede','')
			('Kang', 'Baedal')
			('Kaoru', 'Watabe')
			('Kasumi', 'Todoh')
			('Keisuke', 'Sendo')
			('Kim', 'Dong Kwan')
			('Kim', 'Hae-Ryeong')
			('Kim', 'Jae Hoon')
			('Kim', 'Kaphwan')
			('Kim', 'Sue II')
			('King', 'Lion')
			('Kogoro', 'Daimon')
			('Krizalid','')
			('Kukri','')
			('Kula','Diamond')
			('Kyo','Kusanagi')
			('Kyoji','Sendo')
			('Laurence','Blood')
			('Leona','Heidern')
			('Leopold','Goenitz')
			('Li', 'Xiangfei')
			('Lien', 'Neville')
			('Lillien', 'Knights')
			('Lilly', 'Kane')
			('Lin','')
			('Ling','')
			('Love','Heart')
			('Luan', 'Chat Sai')
			('Lucky', 'Glauber')
			('Luise', 'Meyrink')
			('Luong','')
			('Magaki','')
			('Magaki','')
			('Mai', 'Shiranui')
			('Maki','Kagura')
			('Makoto','Mizoguchi')
			('Malin','')
			('Mature','')
			('Maxima','')
			('May','Lee')
			('Meitenkun','')
			('Mian','')
			('Mian','')
			('Mignon', 'Beart')
			('Miss',' X')
			('Misty','')
			('Miu','Kurosaki')
			('Mizuchi','')
			('Moe', 'Habana')
			('Momoko')
			('Moriya', 'Minakata')
			('Mr', 'Big')
			('Mr', 'Karate')
			('Mr', 'Karate II')
			('Mui', 'Mui')
			('Mukai','')
			('Nagase','')
			('Najd','')
			('Nakoruru','')
			('Nameless','')
			('Nelson')
			('Neo','Geo')
			('Nightmare','Geese')
			('Ninon','Beart')
			('Omega','Rugal')
			('Orochi','')
			('Orochi','Chris')
			('Orochi','Iori')
			('Orochi','Leona')
			('Orochi','Shermie')
			('Orochi','Yashiro')
			('Oswald','')

	UPDATE alumnos
		SET correo = CONCAT(alumnos.nombre,alumnos.apellido, '@snk.com') ## Actualizamos correos
		WHERE correo IN ('', null); ## solamente si estan vacios o completados con nada

	UPDATE alumnos
		SET
			tipo_doc = "dni" ## Actualizamos el tipo_doc
	    	num_doc = CONCAT(2,LENGTH(alumnos.nombre),LENGTH(alumnos.apellido),DEC(alumnos.nombre,DEC(alumnos.apellido))); ## Actualizamos el num_doc
/*Tabla Profesores*/
	TRUNCATE profesores;
	INSERT INTO profesores
	VALUES

