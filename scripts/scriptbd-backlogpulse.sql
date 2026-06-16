SQL
-- Habilitar la extensión para generación de identificadores únicos universales (UUID)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Creación de la Tabla Principal de Cuentas de Usuario
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    display_name VARCHAR(100) NOT NULL,
    weekly_hours INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT chk_weekly_hours CHECK (weekly_hours >= 0)
);

-- Creación de la Tabla Central de Biblioteca e Instancias de Videojuegos
CREATE TABLE user_games (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    external_game_id VARCHAR(100) NOT NULL,
    title VARCHAR(255) NOT NULL,
    image_url VARCHAR(500),
    status VARCHAR(30) NOT NULL,
    platform VARCHAR(100) NOT NULL,
    genre VARCHAR(100) NOT NULL,
    community_hours_main INT NOT NULL DEFAULT 0,
    community_hours_completionist INT NOT NULL DEFAULT 0,
    started_at TIMESTAMP,
    finished_at TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT chk_game_status CHECK (status IN ('PENDING', 'IN_PROGRESS', 'COMPLETED', 'COMPLETIONIST_100')),
    CONSTRAINT chk_hours_main CHECK (community_hours_main >= 0),
    CONSTRAINT chk_hours_completionist CHECK (community_hours_completionist >= 0)
);

-- Creación de la Tabla de Métricas Cuantitativas de Sesiones de Juego
CREATE TABLE game_sessions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_game_id UUID NOT NULL,
    duration_minutes INT NOT NULL,
    played_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (user_game_id) REFERENCES user_games(id) ON DELETE CASCADE,
    CONSTRAINT chk_session_duration CHECK (duration_minutes > 0)
);

-- Creación de la Tabla de Diarios Reflexivos y Analíticas de Bienestar Emocional
CREATE TABLE journal_entries (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_game_id UUID NOT NULL,
    game_session_id UUID,
    session_notes TEXT,
    enjoyment_index INT NOT NULL,
    fatigue_index INT NOT NULL,
    logged_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (user_game_id) REFERENCES user_games(id) ON DELETE CASCADE,
    FOREIGN KEY (game_session_id) REFERENCES game_sessions(id) ON DELETE SET NULL,
    CONSTRAINT chk_enjoyment_range CHECK (enjoyment_index >= 1 AND enjoyment_index <= 5),
    CONSTRAINT chk_fatigue_range CHECK (fatigue_index >= 1 AND fatigue_index <= 5)
);

-- Creación de la Tabla de Objetivos y Metas Personales Locales
CREATE TABLE personal_goals (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_game_id UUID NOT NULL,
    goal_description TEXT NOT NULL,
    is_completed BOOLEAN NOT NULL DEFAULT FALSE,
    completed_at TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (user_game_id) REFERENCES user_games(id) ON DELETE CASCADE
);
