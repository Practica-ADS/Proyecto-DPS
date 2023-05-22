const express = require("express");
const app = express();
const mysql = require("mysql");
const cors =require("cors");

app.use(cors());
app.use (express.json());

const db = mysql.createConnection({
    host:"localhost",
    user: "root",
    password: "",
    database: "clinica_dental"

});
app.post("/create", (req,res)=>{
    const nombre  = req.body.nombre;
    const apellido  = req.body.apellido;
    const edad  = req.body.edad;

    db.query('INSERT INTO pacientes (nombre, apellido, edad) VALUES (?,?,?)',[nombre,apellido,edad],
    (err,result)=>{
        if(err){
            console.log(err);
        }
        else{
            res.send("Paciente registrado con exito");
        }

    }
    
    )

});

app.listen(3001,()=>{console.log("Utilizando el puerto 3301")});
