var plant = require('./plants');
var express = require('express');
var bodyParser = require('body-parser');
var cors = require('cors');
var config = require('./dbconfig');
var app = express();
var router = express.Router();
const auth = require('basic-auth')
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());
app.use('/api', router);

config.connect(function(){
    console.log("Connected");
});

router.use((request,response,next)=>{
   console.log('middleware');
   next();
})

router.route('/plants/uid').post(async(request,response)=>{
   var localName =request.body.local_name;
   console.log(`${localName}`);
   var res1= await config.query(`Select uid from demodata where local_name = ($1) or 
   scientific_name=($1)`,[localName],
   (err, res)=>{
        console.log(request.body);
       if(!err){
           console.log("getName");
           console.log(res.rows);
         return response.json(res.rows);
       }
       else{
           console.log(err);
           return null;
       }
   });
 })
router.route('/plants/details').get(async(request,response)=>{
    var res1= await config.query("Select * from demodata",
    (err, res)=>{
 
        if(!err){
            console.log("details");
            console.log(res.rows);
            return response.json(res.rows);
        }
        else{
            console.log("error");
            return null;
        }
 
    });
})    
router.route('/plants/name').post(async(request,response)=>{
    var uid = request.body.uid;
   console.log(`${uid}`);
    var res1= config.query(`Select scientific_name, local_name from demodata where uid= ($1)`,[uid],
    (err, res)=>{
         console.log(request.body);
        if(!err){
            console.log("getName");
            console.log(res.rows);
          return response.json(res.rows);
        }
        else{
            console.log(err);
            return null;
        }
    });
})
router.route('/plants/insert').post(async(request,response)=>{
    var srno = request.body.srno;
   console.log(`${srno}`);
    var uid = request.body.uid;
   console.log(`${uid}`);
   var local_name = request.body.local_name;
   console.log(`${local_name}`);
   var scientific_name = request.body.scientific_name;
   console.log(`${scientific_name}`);
    var sql="insert into demodata (srno,uid,local_name,scientific_name) values (($1),($2),($3),($4))";
    config.query(sql,[srno,uid,local_name,scientific_name],function(err,result){
        if(!err){
            console.log("records inserted \n"+result.rowCount+" rows affected.")
        }
        else{
            console.log(err.message)
        }
    })

})

var port = process.env.PORT || 8090;
app.listen(port);
console.log('Plant API is runnning at ' + port);
