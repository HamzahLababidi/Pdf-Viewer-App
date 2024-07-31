const router = require('express').Router();
const PdfController = require('../controller/pdf.controller');

router.post('/storePdf', PdfController.createPdf)

module.exports = router;