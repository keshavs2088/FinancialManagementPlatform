import app from "./app.js";
import pool from "./config/database.js";

const PORT = process.env.PORT || 3000;

try {
  await pool.query("SELECT NOW()");
  console.log("PostgreSQL connected successfully");

  app.listen(PORT, () => {
    console.log(`FMP server running on http://localhost:${PORT}`);
  });
} catch (error) {
  console.error("Failed to connect to PostgreSQL:", error.message);
  process.exit(1);
}
