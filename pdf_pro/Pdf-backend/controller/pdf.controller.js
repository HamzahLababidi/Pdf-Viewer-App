const PdfServices = require('../services/pdf.services');

exports.createPdf = async (req, res, next) => {
    try {
        const { userId, title, description, link } = req.body;

        let pdf = await PdfServices.createPdf(userId, title, description, link);

        res.json({ status: true, success: pdf });
    } catch (error) {
        next(error);
    }
}