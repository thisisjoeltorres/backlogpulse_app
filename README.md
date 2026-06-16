# 🎮 BacklogPulse
### Gestor Analítico de Videojuegos Pendientes — Proyecto de Aula

> Ingeniería del Software I · Universidad de Pamplona · 2026

---

## 📋 Descripción General

**BacklogPulse** es un sistema de software multiplataforma orientado al seguimiento analítico, la organización y la gestión saludable de videojuegos pendientes (*backlog*). Su propósito central es reducir la fatiga por decisión del videojugador y promover su bienestar psicológico mediante herramientas de proyección temporal, bitácoras reflexivas y paneles de analíticas emocionales.

El proyecto fue diseñado exclusivamente para títulos en solitario (*single-player*), priorizando la introspección del jugador sobre la competencia social.

---

## 🎯 Objetivo General

Diseñar y estructurar un ecosistema de software multiplataforma que permita al videojugador organizar algorítmicamente su biblioteca de juegos pendientes, proyectar fechas estimadas de completado y registrar variables emocionales de cada sesión de juego para evaluar su bienestar a lo largo del tiempo.

---

## ⚙️ Funcionalidades Principales

- **Autenticación segura** — Registro e inicio de sesión con OAuth2 y tokens JWT.
- **Catálogo externo** — Búsqueda e importación de videojuegos desde APIs de la industria (RAWG / IGDB).
- **Gestión de biblioteca** — Estados mutuamente excluyentes: `Pendiente`, `En Progreso`, `Completado` y `100% Completacionista`.
- **Motor predictivo** — Cálculo automático de semanas y fecha estimada de finalización basado en la disponibilidad horaria del usuario y los tiempos promedio de la comunidad.
- **Bitácora de sesión** — Diario reflexivo por sesión con registro de notas de texto libre.
- **Métricas de bienestar** — Escalas discretas (1–5) de *Nivel de Disfrute* y *Nivel de Fatiga* por sesión.
- **Panel analítico** — Gráficos correlacionales que evalúan los patrones de consumo y el bienestar emocional del jugador.
- **Metas personales** — Logros y objetivos propios por juego con seguimiento de estado.

---

## 🏗️ Arquitectura del Sistema

El sistema sigue los principios de **Clean Architecture**, separando responsabilidades en tres capas:

```
/lib
├── core/           # Utilidades globales, seguridad, red, tema visual
├── features/       # Módulos por dominio (auth, catalog, backlog, journal, analytics)
│   ├── domain/     # Entidades, casos de uso (lógica pura)
│   ├── data/       # Repositorios, fuentes de datos, modelos
│   └── presentation/ # Vistas, BLoCs, widgets
└── main.dart       # Punto de entrada multiplataforma
```

### Stack Tecnológico Proyectado

| Capa | Tecnología |
|---|---|
| Frontend / Mobile | Flutter + Dart |
| Backend / API REST | Node.js + NestJS |
| Base de Datos | PostgreSQL |
| Autenticación | JWT + OAuth2 |
| APIs Externas | RAWG API / IGDB |
| CI/CD | GitHub Actions *(planeado)* |

---

## 🗄️ Modelo de Base de Datos

El esquema relacional está compuesto por **5 tablas** normalizadas:

| Tabla | Descripción |
|---|---|
| `USERS` | Usuarios registrados y su disponibilidad horaria semanal |
| `USER_GAMES` | Biblioteca personal con metadatos del catálogo externo |
| `GAME_SESSIONS` | Sesiones de juego individuales con duración en minutos |
| `JOURNAL_ENTRIES` | Bitácoras reflexivas vinculadas a sesiones específicas |
| `PERSONAL_GOALS` | Metas y logros personales por videojuego |

---

## 📐 Diagramas UML y C4

El proyecto incluye los siguientes artefactos de modelado:

- **Diagrama de Casos de Uso** — 5 casos de uso con relaciones de asociación e `<<include>>`
- **Diagrama de Contenedores C4 (Nivel 2)** — Flutter App · API Server · PostgreSQL · API Externa
- **Diagrama Entidad-Relación (DER)** — 5 tablas con cardinalidades formales

---

## 📄 Documentación

El proyecto cuenta con un documento **SRS (Software Requirements Specification)** que incluye:

- Propósito, alcance y glosario del sistema
- 15 Requisitos Funcionales (RF01–RF15)
- 10 Requisitos No Funcionales (RNF01–RNF10)
- Matriz de Trazabilidad de Requisitos
- Fichas técnicas de casos de uso críticos

---

## 👤 Autor

**Joel A. Torres** · `1149459256`
Ingeniería del Software I — Cod. `167411`
Universidad de Pamplona, Sede Villa del Rosario
Docente: Prof. Geovanny Rubiano Torres

---

## 📅 Estado del Proyecto

> 🚧 **Fase de Diseño y Documentación** — Proyecto de aula en progreso. No contiene código fuente funcional en esta entrega.