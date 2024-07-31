const PdfModel = require('../model/pdf.model');


class PdfServices {
    static async createPdf(userId, title, description, link) {
        const createPdf = new PdfModel({ userId, title, description, link })
        return await createPdf.save();
    }
}

module.exports = PdfServices;