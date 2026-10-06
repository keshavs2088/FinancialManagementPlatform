import dotenv from "dotenv";
import { runner } from "node-pg-migrate";

dotenv.config({ path: "../.env" });

const databaseUrl =
  `postgresql://${process.env.POSTGRES_USER}:` +
  `${encodeURIComponent(process.env.POSTGRES_PASSWORD)}@` +
  `${process.env.POSTGRES_HOST}:` +
  `${process.env.POSTGRES_PORT}/` +
  `${process.env.POSTGRES_DB}`;

await runner({
  databaseUrl,
  dir: "migrations",
  direction: "up",
  migrationsTable: "pgmigrations",
});
