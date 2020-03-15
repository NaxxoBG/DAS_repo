create table man (
	m_id int primary key,
    `name` varchar(255),
    birthdate date
);

create table woman (
	w_id int primary key,
    `name` varchar(255),
    birthdate date
);

create table marriage (
m_id int primary key,
w_id int,
`start` date,
`end` date,
foreign key (m_id) references man(m_id),
foreign key (w_id) references woman(w_id)
);
