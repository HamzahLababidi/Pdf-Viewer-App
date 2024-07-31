const app = require('./app');
const db = require('./config/db');
const UserModel = require('./model/user.model');
const PdfModel = require('./model/pdf.model');


const port = 3000

app.get('/', (req, res) => {
    res.send("helloa");
});

app.listen(port, () => {
    console.log('Server is listening to port http://localhost:' + port);
});

