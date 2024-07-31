const mongoose = require('mongoose');

const connection = mongoose.createConnection('mongodb://localhost:27017/PDFUser').on('open', () => {
    console.log("mongodb connected");
}).on('error', () => {
    console.log("mongodb failed to connect");
});

module.exports = connection;