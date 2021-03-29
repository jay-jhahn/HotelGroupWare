var oracledb = require('oracledb')
var dbConfig = require('./dbConfig')  // 경로 주의

// express 기본모듈
var express = require('express');
var http = require('http');
var path = require('path');

// 익스프레스 객체 생성
var app = express();

// 기본 속성 설정 => 두개 포트번호가 반드시 일치해야 함
// package.json에 추가 => "proxy":"http://localhost:5000",
app.set('port', process.env.PORT || 5000);  // PORT || 포트번호 => 포트 중복안되게


var bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json());

var router = express.Router();

// 오라클 자동 커밋 설정
oracledb.autoCommit = true;

// -----------------------------------------------------------
// 데이터 조회
app.get('/api/boardList', function(request, response) {
    console.log(' --- boardList select --- ')
    oracledb.getConnection({
        user : dbConfig.user,
        password : dbConfig.password,
        connectString : dbConfig.connectString
    },
    function(err, connection) {
        if(err) {
            console.log('접속 실패', err);
            console.error(err.message);
            return;
        }
        console.log('접속 성공');
        let query = 'select * from board_tbl ORDER BY boardState desc, writedate desc';
        connection.execute(query, [], {outFormat:oracledb.OBJECT}, function(err, result) {
            if(err) {
                console.error(err.message);
                doRelease(connection);
                return;
            }
            console.log(result.rows);  // 데이터
            doRelease(connection, result.rows);  // connection 해제
            response.send(result.rows);

        });
    });
    // 디비 연결해제
    function doRelease(connection, result) {
        connection.release(function(err, rows) {
            if(err) {
                console.error(err.message);
            }
            // DB 종료 까지 모두 완료되었을시 응답 데이터 반환
            console.log('list size:' + rowList.length);
            console.log(rowList);
            
        });
    }

});

// -----------------------------------------------------------
// 조회수 증가
router.post('/api/boardCount', function(request, response) {
    console.log(' --- boardList update count --- ') // nodemon 콘솔에서 확인
    oracledb.getConnection({
        user : dbConfig.user,
        password : dbConfig.password,
        connectString : dbConfig.connectString
    },
    function(err, connection) {
        if(err) {
            console.log('접속 실패', err);
            console.error(err.message);
            return;
        }
        console.log('접속 성공');
        // prepareStatement
        let query = 'update board_tbl set readCnt = readCnt+1 where boardNo = :boardNo';
        var binddata = [
            request.body.boardNo
        ]
        
        
        connection.execute(query, binddata, function(err, result) {
            if(err) {
                console.error(err.message);
                doRelease(connection);
                return;
            }
            console.log('Row Update : ' + result.rowsAffected);  // 데이터
            doRelease(connection, result.rowsAffected);  // connection 해제
            response.redirect('/');
            
        });
    });
    // 디비 연결해제
    function doRelease(connection, result) {
        connection.release(function(err, rows) {
            if(err) {
                console.error(err.message);
                // DB 종료 까지 모두 완료되었을시 응답 데이터 반환
                // response.send("" + result);
            }
        });
    }
});

// -----------------------------------------------------------
// 데이터 수정
router.post('/api/boardUpdate', function(request, response) {
    console.log(' --- boardList update --- ') // nodemon 콘솔에서 확인
    oracledb.getConnection({
        user : dbConfig.user,
        password : dbConfig.password,
        connectString : dbConfig.connectString
    },
    function(err, connection) {
        if(err) {
            console.log('접속 실패', err);
            console.error(err.message);
            return;
        }
        console.log('접속 성공');
        // prepareStatement
        let query = 'update board_tbl set boardContent = :boardContent, boardFile1 = :boardFile1, boardFile2 = :boardFile2, updateDate = sysdate where boardNo = :boardNo';
        var binddata = [
            request.body.boardContent,
            request.body.boardFile1,
            request.body.boardFile2,
            request.body.boardNo
        ]



        connection.execute(query, binddata, function(err, result) {
            if(err) {
                console.error(err.message);
                doRelease(connection);
                return;
            }
            console.log('Row Update : ' + result.rowsAffected);  // 데이터
            doRelease(connection, result.rowsAffected);  // connection 해제
            response.redirect('/');     // 리스트 결과 다시 뿌려준다.
        });
    });
    // 디비 연결해제
    function doRelease(connection, result) {
        connection.release(function(err, rows) {
            if(err) {
                console.error(err.message);
                // DB 종료 까지 모두 완료되었을시 응답 데이터 반환
                // response.send("" + result);
            }
        });
    }
});

// -----------------------------------------------------------
// 데이터 삭제
router.post('/api/boardDelete', function(request, response) {
    console.log(' --- boardList delete --- ') // nodemon 콘솔에서 확인
    oracledb.getConnection({
        user : dbConfig.user,
        password : dbConfig.password,
        connectString : dbConfig.connectString
    },
    async function(err, connection) {
        if(err) {
            console.log('접속 실패', err);
            console.error(err.message);
            return;
        }
        console.log('접속 성공');
        // PrepareStatement - :컬럼명과 binddata 갯수와 이름이 일치해야 함
        let query = 'delete from board_tbl where boardNo = :boardNo';
        var binddata = [
            request.body.boardNo
        ]

        connection.execute(query, binddata, function(err, result) {
            if(err) {
                console.error(err.message);
                doRelease(connection);
                return;
            }
            console.log('Row Update : ' + result.rowsAffected);  // 데이터
            doRelease(connection, result.rowsAffected);  // connection 해제
            response.redirect('/');     // index.html에서 Add.js랜더링해서 리스트 결과 다시 뿌려준다.
        });
    });
    // 디비 연결해제
    function doRelease(connection, result) {
        connection.release(function(err, rows) {
            if(err) {
                console.error(err.message);
                // DB 종료 까지 모두 완료되었을시 응답 데이터 반환
                // response.send("" + result);
            }
        });
    }
});

// -----------------------------------------------------------
// 데이터 삭제 비밀번호 확인
router.post('/api/boardDeletePwdCheck', function(request, response) {
    console.log(' --- boardList boardDeletePwdCheck --- ') // nodemon 콘솔에서 확인
    oracledb.getConnection({
        user : dbConfig.user,
        password : dbConfig.password,
        connectString : dbConfig.connectString
    },
    async function(err, connection) {
        if(err) {
            console.log('접속 실패', err);
            console.error(err.message);
            return;
        }
        console.log('접속 성공');
        // PrepareStatement - :컬럼명과 binddata 갯수와 이름이 일치해야 함
        let query = 'delete from board_tbl where boardNo = :boardNo and boardPwd = :boardPwd';
        var binddata = [
            request.body.boardNo,
            request.body.boardPwd
        ]
        
        connection.execute(query, binddata, function(err, result) {
            check(result.rowsAffected);
            if(err) {
                console.error(err.message);
                doRelease(connection);
                return;
            }
            console.log('Row Update : ' + result.rowsAffected);  // 데이터
            
            doRelease(connection, result.rowsAffected);  // connection 해제
            response.redirect('/');     // index.html에서 Add.js랜더링해서 리스트 결과 다시 뿌려준다.
        });
    });

    // 디비 연결해제
    function doRelease(connection, result) {
        
        connection.release(function(err, rows) {
            if(err) {
                
                console.error(err.message);
                // DB 종료 까지 모두 완료되었을시 응답 데이터 반환
                // response.send("" + result);
                
            }
        });
        
    }
});
// -----------------------------------------------------------
// 라우터 객체를 app 객체에 등록
app.use('/', router);

// 등록되지 않은 패스에 대해 페이지 오류 응답
app.all('*', function(req, res){
    res.status(404).send('<h3>ERROR - 페이지를 찾을 수 없습니다.</h3>')
});

// express 서버 시작
http.createServer(app).listen(app.get('port'), function() {
    console.log('Express Server listening in port' + app.get('port'));
});


