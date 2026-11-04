const express = require('express');
const cors = require('cors');
const db = require('./db');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
    res.json({ message: 'API de SISMATEC funcionando' });
});

app.get('/api/test-db', async (req, res) => {
    try {
        const result = await db.query('SELECT COUNT(*) FROM producto');
        res.json({
            message: 'Conexión a BD exitosa',
            totalProductos: result.rows[0].count
        });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`);
});