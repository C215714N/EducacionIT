/*Tabla Alumnos*/
	-- Personajes Street Fighters
	INSERT INTO alumnos(nombre, apellido)
	VALUES	('Abel',''),
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
    UPDATE alumnos
	    SET correo = CONCAT(nombre, apellido,'@capcom.com'), ## actualizacion de correos
			direccion = CONCAT ('Street Fighters ',LENGTH(nombre), id_alumno, LENGTH(apellido)); ## actualizacion de direcciones
	
    -- Personajes King of Fighters
    INSERT INTO alumnos(nombre, apellido)
	VALUES 	('Adelheid','Bernstein'),
			('Alba', 'Meira'),
			('Alfred', 'Airhawk'),
			('Andy', 'Bogard'),
			('Anidas','Nests'),
			('Aoi', 'Kusanagi'),
			('Armor', 'Ralf'),
			('Ash', 'Crimson'),
			('Asuka', 'Maria'),
			('Athena', 'Asamiya'),
			('Aya','Hermione'),
			('Baitang',''),
			('Bandeiras', 'Hattori'),
			('Benimaru', 'Nikaido'),
			('Billy', 'Kane'),
			('Blue', 'Mary'),
			('Bonne', 'Jenet'),
			('Botan',''),
			('Brian', 'Battler'),
			('Candy', 'Diamond'),
			('Chae', 'Lim'),
			('Chang', 'Koehan'),
			('Chin', 'Gentsai'),
			('Chizuru', 'Kagura'),
			('Choi', 'Bounge'),
			('Chris',''),
			('Clark', 'Steel'),
			('Cool', 'Choi'),
			('Cool', 'Guy'),
			('Cosplayer', 'Kyoko'),
			('Diana',''),
			('Dr.', 'Makishima'),
			('Duck', 'King'),
			('Duke','Edwards'),
			('Duo', 'Lon'),
			('Eiji', 'Kisaragi'),
			('Elisabeth', 'Blanctorche'),
			('Fiolina', 'Germi'),
			('Foxy',''),
			('G','Mantle'),
			('Gai', 'Tendo'),
			('Gaidel',''),
			('Gang','il'),
			('Glaugan',''),
			('God', 'Rugal'),
			('Goeniko',''),
			('Goro', 'Daimon'),
			('Gustab', 'Munchausen'),
			('Hanzo', 'Hattori'),
			('Haohmaru',''),
			('Heavy','D!'),
			('Heidern',''),
			('Hein',''),
			('Hinako', 'Shijo'),
			('Hokutomaru',''),
			('Honki ni Natta', 'Mr. Karate'),
			('Hotaru', 'Futaba'),
			('Hwa', 'Jai'),
			('Hyena',''),
			('Igniz',''),
			('Iori', 'Yagami'),
			('Isolde',''),
			('Jean',''),
			('Jeff', 'Bogard'),
			('Jhun', 'Hoon'),
			('Jivatma',''),
			('Joe', 'Higashi'),
			('Jokyojo',''),
			('Jun', 'Kagami'),
			('Junko', 'Sendo'),
			('Jyazu',''),
			('Kaede',''),
			('Kang', 'Baedal'),
			('Kaoru', 'Watabe'),
			('Kasumi', 'Todoh'),
			('Keisuke', 'Sendo'),
			('Kim', 'Dong Kwan'),
			('Kim', 'Hae-Ryeong'),
			('Kim', 'Jae Hoon'),
			('Kim', 'Kaphwan'),
			('Kim', 'Sue II'),
			('King', 'Lion'),
			('Kogoro', 'Daimon'),
			('Krizalid',''),
			('Kukri',''),
			('Kula','Diamond'),
			('Kyo','Kusanagi'),
			('Kyoji','Sendo'),
			('Laurence','Blood'),
			('Leona','Heidern'),
			('Li', 'Xiangfei'),
			('Lien', 'Neville'),
			('Lillien', 'Knights'),
			('Lilly', 'Kane'),
			('Lin',''),
			('Ling',''),
			('Love','Heart'),
			('Luan', 'Chat Sai'),
			('Lucky', 'Glauber'),
			('Luise', 'Meyrink'),
			('Luong',''),
			('Magaki',''),
			('Magaki',''),
			('Mai', 'Shiranui'),
			('Maki','Kagura'),
			('Makoto','Mizoguchi'),
			('Malin',''),
			('Mature',''),
			('Maxima',''),
			('May','Lee'),
			('Meitenkun',''),
			('Mian',''),
			('Mian',''),
			('Mignon', 'Beart'),
			('Miss',' X'),
			('Misty',''),
			('Miu','Kurosaki'),
			('Mizuchi',''),
			('Moe', 'Habana'),
			('Momoko',''),
			('Moriya', 'Minakata'),
			('Mr', 'Big'),
			('Mr', 'Karate'),
			('Mr', 'Karate II'),
			('Mui', 'Mui'),
			('Mukai',''),
			('Nagase',''),
			('Najd',''),
			('Nakoruru',''),
			('Nameless',''),
			('Nelson',''),
			('Neo','Geo'),
			('Nightmare','Geese'),
			('Ninon','Beart'),
			('Orochi','Chris'),
			('Orochi','Iori'),
			('Orochi','Leona'),
			('Orochi','Shermie'),
			('Orochi','Yashiro'),
			('Oswald','');
	UPDATE alumnos
		SET	correo = CONCAT(alumnos.nombre,alumnos.apellido, '@snk.com'),	## actualizacion de correos
			direccion = CONCAT('King of Fighters ', LENGTH(nombre), LENGTH(apellido))	## actualizacion de direcciones
        WHERE correo IS NULL OR direccion IS NULL;	## condicion: correo o direccion sea NULL
	
    -- actualizaciones generales
    UPDATE alumnos
		SET	num_doc = FLOOR(10000000 + RAND() * 99999999);	## numero aleatorio entre 10 y 100 millones
	UPDATE alumnos SET 
    tipo_doc = 									## actualizacion tipo documento
		CASE									## INICIO del Condicional
			WHEN num_doc <= 54000000 THEN 'dni' ## dni para los numeros menores a 54 millones
            WHEN num_doc <= 80000000 THEN 'ci' 	## ci para los numeros menores a 80 millones
            ELSE 'lc' 							## lc para los numeros restantes
		END;

/*Tabla Profesores*/
	-- Personajes Street Fighters
	INSERT INTO profesores (nombre, apellido)
    VALUES	('Akuma','Gouki'),
			('Tsukushi','Kasugano'),
            ('Sheng','Long'),
            ('Gouketsu','Sensei');
    UPDATE profesores
	    SET correo = CONCAT(nombre, apellido,'@capcom.com'), ## actualizacion de correos
			direccion = CONCAT ('Street Fighters ',LENGTH(nombre), id_profesor, LENGTH(apellido)); ## actualizacion de direcciones
            
	-- Personajes King of Fighters
	INSERT INTO profesores (nombre, apellido)
	VALUES	('Omega','Rugal'),
			('Leopold','Goenitz'),
			('Orochi','Yamata'),
            ('Evil', 'Ash'),			
            ('Geese', 'Howard');
	UPDATE profesores
		SET	correo = CONCAT(nombre, apellido, '@snk.com'),	## actualizacion de correos
			direccion = CONCAT('King of Fighters ', LENGTH(nombre), LENGTH(apellido))	## actualizacion de direcciones
        WHERE correo IS NULL OR direccion IS NULL;	## condicion: correo o direccion sea NULL
	
    -- Actualizaciones Generales
	UPDATE profesores
		SET	num_doc = FLOOR(10000000 + RAND() * 99999999);	## numero aleatorio entre 10 y 100 millones
	UPDATE profesores SET 
    tipo_doc = 									## actualizacion tipo documento
		CASE									## INICIO del Condicional
			WHEN num_doc <= 54000000 THEN 'dni' ## dni para los numeros menores a 54 millones
            WHEN num_doc <= 80000000 THEN 'ci' 	## ci para los numeros menores a 80 millones
            ELSE 'lc' 							## lc para los numeros restantes
		END;									## FIN del Condicional

/*Tabla Cursos*/
	INSERT INTO cursos (nombre, carga_horaria)
		VALUES	('Fundamentos Web', 12),
				('Maquetacion Web', 18),
				('Maquetado Avanzado', 15),
				('Responsive Web Design', 12),
				('Angular 2', 12),
				('ReactJS', 12),
				('Introduccion MySQL', 12),
				('Introduccion a Redes', 36),
				('Switching and Routing', 30);

SELECT * FROM alumnos LIMIT 100;
SELECT * FROM profesores LIMIT 10;
SELECT * FROM cursos LIMIT 5;
