const UserService = require('../services/user.services');
const UserModel = require('../model/user.model');


exports.register = async (req, res, next) => {
    try {
        const { email, password, first_name, last_name } = req.body;

        const successRes = await UserService.registerUser(email, password, first_name, last_name);

        res.json({ status: true, success: "Registered Successfully" });
    } catch (error) {
        next(error);
    }

};


exports.login = async (req, res, next) => {
    try {
        const { email, password } = req.body;

        const user = await UserService.checkUser(email);

        if (!user) {
            throw new Error("user doesn't exist");
        }

        const isMatch = await user.comparePassword(password); // Assuming this method exists in UserModel

        if (isMatch === false) {
            throw new Error("Invalid Password");
        }

        let tokenData = { _id: user._id, email: user.email };

        const token = await UserService.generateToken(tokenData, 'yourSecretKey', '1h'); // Replace with your secret key

        res.status(200).json({ status: true, token: token });
    } catch (error) {
        next(error);
    }
};