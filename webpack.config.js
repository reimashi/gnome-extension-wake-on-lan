const webpack = require("webpack");

module.exports = {
    mode: "development",
    entry: "./src/main.js",
    output: {
        path: __dirname,
        filename: './dist/code.js'
    },
    module: {
        rules: [
            {
                use: {
                    loader:'babel-loader',
                    options: { presets: ['es2015'] }
                },
                test: /\.js$/,
                exclude: /node_modules/
            }
        ]
    },
};
