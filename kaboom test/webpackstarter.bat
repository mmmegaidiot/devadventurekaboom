@echo off
echo Application Directory
echo %~dp0
chdir %~dp0
echo Current Working Directory
echo %cd%


echo Install NPM modules

call npm init -y
call npm install webpack webpack-cli --save-dev
call npm install html-webpack-plugin --save-dev
call npm install css-loader style-loader --save-dev
call npm i webpack-dev-server --save-dev
call npm i json --save-dev


echo creating file structure
md src
md build
cd src
md assets

echo creating /src/index.js

echo import './style.css';>index.js
echo console.log(`Hello World`);>>index.js
cd ..

echo creating webpack.config.js file in root

echo const path = require('path')>webpack.config.js 
echo const mode = process.env.NODE_ENV == "production" ? "production" : "development" >> webpack.config.js
echo const HtmlWebpackPlugin = require('html-webpack-plugin')>>webpack.config.js
echo. >>webpack.config.js
echo module.exports = {>>webpack.config.js
echo   entry: {>>webpack.config.js  
echo     index: path.resolve(__dirname, './src/index.js')>>webpack.config.js 
echo   },>>webpack.config.js 
echo   output: {>>webpack.config.js" 
echo       path: path.resolve(__dirname, './build'),>>webpack.config.js 
echo       filename: '[name].bunde.js'>>webpack.config.js 
echo     },>>webpack.config.js 
echo   mode: mode,>>webpack.config.js
echo   module: {>>webpack.config.js 
echo     rules: [>>webpack.config.js 
echo     {>>webpack.config.js 
echo         test: /\.css$/,>>webpack.config.js 
echo         use: ['style-loader', 'css-loader']>>webpack.config.js 
echo     },>>webpack.config.js 
echo     {>>webpack.config.js
echo         test: /\.(?:ico^|gif^|png^|jpg^|jpeg)$/i, >>webpack.config.js 
echo         type: 'asset/resource',>>webpack.config.js 
echo     },>>webpack.config.js 
echo     ],>>webpack.config.js 
echo     },>>webpack.config.js 
echo   plugins: [ >>webpack.config.js  
echo      new HtmlWebpackPlugin({ >>webpack.config.js  
echo      template: path.resolve(__dirname, "./src/template.html") >>webpack.config.js  
echo   }) >>webpack.config.js  
echo   ],>>webpack.config.js  
echo } >>webpack.config.js 

echo creating /src/template.html

cd src
echo ^<!DOCTYPE html^> >template.html
echo ^<html^> >>template.html
echo ^<head^> >>template.html
echo ^<meta charset="UTF-8"^> >>template.html
echo ^<title^>Hello World^</title^> >>template.html
echo ^</head^> >>template.html
echo ^<body^> >>template.html
echo   hello world! >>template.html
echo ^</body^> >>template.html
echo ^</html^> >>template.html

echo creating /src/style.css

echo /*style.css*/ >style.css

cd ..
call npx json -I -f package.json -e "this.scripts.build=\"webpack\""
call npx json -I -f package.json -e "this.scripts.start=\"webpack serve\""
call npx json -I -f package.json -e "this.main=\"./src/index.js\""




echo COMPLETED!!!!