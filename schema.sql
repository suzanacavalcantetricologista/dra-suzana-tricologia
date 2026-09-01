CREATE TABLE IF NOT EXISTS admin_users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  username TEXT NOT NULL UNIQUE,
  password_hash TEXT NOT NULL,
  password_salt TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS bookings (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  service TEXT NOT NULL,
  date TEXT NOT NULL,
  time TEXT NOT NULL,
  name TEXT NOT NULL,
  phone TEXT NOT NULL,
  notes TEXT DEFAULT '',
  status TEXT NOT NULL DEFAULT 'Pendente',
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX IF NOT EXISTS idx_bookings_date_time ON bookings(date,time);

CREATE TABLE IF NOT EXISTS reviews (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  rating INTEGER NOT NULL CHECK(rating BETWEEN 1 AND 5),
  comment TEXT NOT NULL,
  photo TEXT,
  status TEXT NOT NULL DEFAULT 'Pendente',
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS settings (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS treatments (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  active INTEGER NOT NULL DEFAULT 1
);

INSERT OR IGNORE INTO settings(key,value) VALUES
('availability','{"0":{"on":false,"start":"09:00","end":"12:00"},"1":{"on":true,"start":"09:00","end":"18:00"},"2":{"on":true,"start":"09:00","end":"18:00"},"3":{"on":true,"start":"09:00","end":"18:00"},"4":{"on":true,"start":"09:00","end":"18:00"},"5":{"on":true,"start":"09:00","end":"18:00"},"6":{"on":true,"start":"09:00","end":"12:00"}}'),
('promo','{"active":true,"title":"SOS Queda Capilar","description":"Para pacientes de primeira vez: avaliação especializada, tricoscopia, investigação das possíveis causas, orientação individualizada e planejamento inicial. São 4 encontros no total: avaliação + 3 sessões de tratamento capilar.","showPrice":true,"oldPrice":"","price":"R$ 500"}'),
('content','{"heroHeadline":"Seu cabelo merece ser compreendido antes de ser tratado.","heroSubtext":"Queda, afinamento, oleosidade, coceira, descamação ou redução do volume podem ter diferentes causas. Por isso, aqui o tratamento não começa com um procedimento. Começa com uma investigação.","careTitle":"Não existe um tratamento perfeito para todo mundo. Existe o tratamento adequado para cada caso.","careText":"Cada couro cabeludo é único. Durante o atendimento, avaliamos sua história, suas queixas, o couro cabeludo e os fios para compreender suas necessidades antes de definir qualquer protocolo."}'),
('about','{"title":"Uma trajetória construída com coragem, experiência e propósito.","text":"Com 30 anos de experiência como cabeleireira, Suzana Cavalcante construiu sua vida profissional acompanhando de perto a relação das pessoas com os cabelos e com a autoestima.\n\nDepois dos 50 anos, decidiu dar um novo passo na própria história: formou-se em Estética e aprofundou sua atuação em Tricologia. Hoje, reúne a experiência prática de décadas com um olhar técnico e individualizado para oferecer um atendimento acolhedor, cuidadoso e focado nas necessidades de cada pessoa."}'),
('appearance','{"heroPosition":"center","heroImage":null}');

INSERT OR IGNORE INTO treatments(id,name,description,active) VALUES
(1,'Queda Capilar','Investigação e cuidados direcionados aos diferentes fatores que podem estar relacionados à queda.',1),
(2,'Oleosidade e Saúde do Couro Cabeludo','Protocolos voltados ao equilíbrio e cuidado do couro cabeludo.',1),
(3,'Afinamento e Rarefação','Acompanhamento e estratégias individualizadas de acordo com as características observadas.',1),
(4,'Detox e Terapia Capilar','Cuidados direcionados à higienização, equilíbrio e preparação do couro cabeludo.',1),
(5,'Microagulhamento Capilar','Quando indicado, pode fazer parte de protocolos específicos de terapia capilar.',1),
(6,'Realinhamento Capilar','Cuidado pensado para alinhar beleza, saúde dos fios e resultado estético com responsabilidade.',1);
