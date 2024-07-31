const mongoose = require('mongoose');
const db = require('../config/db');
const UserModel = require('../model/user.model');

const { Schema } = mongoose;

const PdfSchema = new Schema({
    userId: {
        type: Schema.Types.ObjectId,
        ref: UserModel.modelName,
    },
    title: {
        type: String,
        require: true,
        lowercase: true,
    },
    description: {
        type: String,
        require: true,
        lowercase: true,
    },
    link: {
        type: String,
        require: true,
    }

});


const PdfModel = db.model('pdf', PdfSchema);

module.exports = PdfModel;