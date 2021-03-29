module.exports = 
{
    user : process.env.MODE_ORACLEDB_USER || "hms",
    password : process.env.MODE_ORACLEDB_PASSWOR || "kosmo",
    connectString : process.env.MODE_ORACLEDB_CONNECTIONSTRING || "192.168.0.31"
}