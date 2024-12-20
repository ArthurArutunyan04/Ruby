CREATE TABLE IF NOT EXISTS student (
    id SERIAL PRIMARY KEY,
    surname TEXT NOT NULL,
    name TEXT NOT NULL,
    patronymic TEXT NOT NULL,
    phone_number TEXT NOT NULL,
    email TEXT NOT NULL,
    telegram TEXT NOT NULL,
    git TEXT NOT NULL,
    date_birth DATE NOT NULL
);
