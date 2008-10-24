create table artist(
  id   integer primary key,
  name varchar(50)
);
create unique index artist_name_index on artist(name);

create table file(
  id        integer primary key,
  path      varchar(400),
  title     varchar(50),
  id_artist integer,
  album     varchar(50),
  year      integer,
  track     integer
);
create unique index file_path_index on file(path);

create table playlist(
  id   integer primary key,
  name varchar(50)
);
insert into playlist (id, name) values (1, '__last__');

create table file_playlist(
  id_file     integer,
  id_playlist integer,
  ord         integer,
  primary key (id_file, id_playlist),
  foreign key (id_file) references file(id),
  foreign key (id_playlist) references playlist(id)
);

create table options(
  id         integer primary key,
  start_path varchar(400)
);
insert into options (id, start_path) values (1, '');
