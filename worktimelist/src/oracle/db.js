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
const { ChildComponent } = require('ka-table/Models/ChildComponent');


app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json());

var router = express.Router();

// 오라클 자동 커밋 설정
oracledb.autoCommit = true;

// 철한 시작 -----------------------------------------------------------
// 데이터 조회
app.get('/getWorkData', function(request, response) {
    console.log(' --- getWorkData --- ')
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
        let query = 'SELECT * FROM worktime_tbl';
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
    function doRelease(connection, rowList) {
        connection.release(function(err, rows) {
            if(err) {
                console.error(err.message);
            }
            // DB 종료 까지 모두 완료되었을시 응답 데이터 반환
            console.log('list size:' + rowList.length );
            console.log(rowList);
            
        });
    }

});
app.get('/' , function(request, response) {
    console.log('-------------------- get Data ----------------')
    oracledb.getConnection({
        user:dbConfig.user,
        password:dbConfig.password,
        connectString:dbConfig.connectString 

    });

});

// 근무 변경 신청 시작 --------------------------------------------------------------------------- 
// 데이터 입력 
router.post('/insertReqModiy', function(request, response) {
    console.log('------ reqModifyInsert ------')   // nodemon 콘솔에서 확인 
    oracledb.getConnection({
        user : dbConfig.user,
        password : dbConfig.password,
        connectString : dbConfig.connectString
    },
    function(err, connection) {
        if(err) {
            console.log('접속실패 ', err);
            console.error(err.message);
            return;
        }

        console.log('접속 성공 REACT DB 접근 성공 !!!');
        let query = "INSERT INTO wrok_tbl_test (skdcode , skdmonth, empcode) VALUES (:empDept , :empDept , 'leech')";
       
        var binddata = [
            request.body.empDept,  
            request.body.empDept
        ]
        
        connection.execute(query, binddata , function(err, result) {
            if(err) {
                console.error(err.message);
                doRelease(connection);
                return;
            }   
            console.log('Row Insert : ' + result.rowsAffected);  // 데이터
            doRelease(connection, result.rows); // connection 해제
            response.redirect('/');  // 리스트 결과 다시 가져온다 
       
       });

    });

    // DB 연결 해제
    function doRelease(connection, result) {
        connection.release(function(err, rows){
            if(err) {
                console.log(err.message);
            }

            // DB 종료까지 모두 완료되었을 시 응답 데이터 반환
            //console.err("list size" + rowList.length);
            //console.log(rowList);    // nodemon 콘솔창에 select 결과 

        });

    }
});

// 직원정보가져오기
app.get('/getEmpInfo', function(request, response) {
    console.log('---------- getEmpInfo 값 가져오기 !!! -----------')   // nodemon 콘솔에서 확인 
    oracledb.getConnection({
        user : dbConfig.user,
        password : dbConfig.password,
        connectString : dbConfig.connectString
    },
    function(err, connection) {
        if(err) {
            console.log('접속실패 ', err);
            console.error(err.message);
            return;
        }
        console.log('접속 성공');
        let query = "SELECT empcode, skdmonth FROM work_tbl_test WHERE empcode='reacttest'";
       
        connection.execute(query, [] , {outFormat:oracledb.OBJECT} , function(err, result) {
             if(err) {
                 console.error(err.message);
                 dbRelease(connection);
                 return;
             }   
             console.log(result.rows);  // 데이터
             dbRelease(connection, result.rows); // connection 해제
             response.send(result.rows);
        });

    });

    // DB 연결 해제
    function dbRelease(connection, rowList) {
        connection.release(function(err, rows){
            if(err) {
                console.log(err.message);
            }
            // DB 종료까지 모두 완료되었을 시 응답 데이터 반환
            console.err("list size" + rowList.length);
            console.log(rowList);    // nodemon 콘솔창에 select 결과 
        });
    }

})
// 철한 종료 -------------------------------------------------------------

// 예진 시작 -------------------------------------------------------------
// 데이터 조회 Holiday 시작-----------------------------------------------
app.get('/api/holidayList', function(request, response) {
    console.log(' --- holidayList --- ')
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
        let query = 'select e.empname, h.*, d.deptName from emp_tbl e JOIN holiday_tbl h ON e.empCode = h.empcode JOIN dept_tbl d ON e.deptCode = d.deptCode';

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
    function doRelease(connection, rowList) {
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
// 예진 Holiday 끝 -------------------------------------------------------- 
// 예진 Board 시작 -------------------------------------------------------- 
// 데이터 입력
router.post('/api/boardAdd', function(request, response) {
    console.log(' --- boardList insert --- ') // nodemon 콘솔에서 확인
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
        let query = 'insert into board_tbl(boardNo, empCode, deptCode, boardPwd, boardTitle, boardContent, readCnt, writeDate, updateDate, boardState) '
                     + 'VALUES(board_seq.nextval, :empCode, :deptCode, :boardPwd, :boardTitle, :boardContent, 0, sysdate, sysdate, :boardState)';
        var binddata = [
            request.body.empCode,
            request.body.deptCode,
            request.body.boardPwd,
            request.body.boardTitle,
            request.body.boardContent,
            request.body.boardState
        ]
        connection.execute(query, binddata, function(err, result) {
            if(err) {
                console.error(err.message);
                doRelease(connection);
                return;
            }
            console.log('Row Insert : ' + result.rowsAffected);  // 데이터
            doRelease(connection, result.rowsAffected);  // connection 해제
            response.redirect('/BoardInput/'+request.body.deptCode+'/'+request.body.empCode);
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

// 데이터 조회 ------------------------------------------------------------
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
    function doRelease(connection, rowList) {
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
            response.redirect('/yejinComponent/'+request.body.deptName+'/7');     // 리스트 결과 다시 뿌려준다.
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
            if(err) {
                console.error(err.message);
                doRelease(connection);
                return;
            }
            console.log('Row Update : ' + result.rowsAffected);  // 데이터
            doRelease(connection, result.rowsAffected);  // connection 해제
            response.redirect('/yejinComponent/'+request.body.deptName+'/'+result.rowsAffected);     // index.html에서 App.js랜더링해서 리스트 결과 다시 뿌려준다.
        });
    });

    // 디비 연결해제
    function doRelease(connection, result) {
        
        connection.release(function(err, rows) {
            if(err) {
                console.error(err.message);
                // DB 종료 까지 모두 완료되었을시 응답 데이터 반환
                // response.send(result);
                
            }
        });
        
    }
});


// 예진 Board 끝 ----------------------------------------------------
// 예진 종료 --------------------------------------------------------

// 상원 시작 ---------------------------------------------------------
// PCard 조회
app.get('/api/PCardList', function(request, response) {
    console.log('---PCardList select---')
    oracledb.getConnection( {
        user : dbConfig.user,
        password : dbConfig.password,
        connectString : dbConfig.connectString
    },
    function(err, connection) {
        if(err){
            console.log('접속 실패', err);
            console.error(err.message);
            return;
        }
        console.log('접속 성공');
        let query = 'SELECT rowNum rNum, w.* FROM (SELECT * FROM welfare_tbl WHERE empCode is null ORDER BY welfareCode) w';
        connection.execute(query, [], {outFormat:oracledb.OBJECT}, function(err, result) {
            if(err) {
                console.error(err.message);
                doRelease(connection); // 접속해제
                return;
            }
            console.log(result.rows);   // 데이터 뭘 가져왔는지 뿌리기
            doRelease(connection, result.rows); // connection 해제
            response.send(result.rows); // 화면으로 보내기
        });
    });

    // 디비 연결해제
    function doRelease(connection, rowList) {
        connection.release(function(err, rows) {
            if(err) {
                console.error(err.message);
            }

            // DB 종료까지 모두 완료되었을 시 응답 데이터 반환
            console.log('list size:' + rowList.length);
            console.log(rowList);
        });
    }
});

// -----------------------------------------------------
// 쿠폰에 직원코드 추가
router.post('/api/PCardEmpInsert', function(request, response) {
    console.log('---PCardEmpInsert update---')   // nodemon : 콘솔에서 확인
    oracledb.getConnection( {
        user : dbConfig.user,
        password : dbConfig.password,
        connectString : dbConfig.connectString
    },
    function(err, connection) {
        if(err){
            console.log('접속 실패', err);
            console.error(err.message);
            return;
        }
        console.log('접속 성공');
        // 바인드 작업 : PrepareStatement와 비슷
        let query = 'UPDATE welfare_tbl SET empCode = :empCode WHERE welfareCode = :welfareCode';
        var binddata = [
            request.body.empCode,
            request.body.welfareCode
        ];

        connection.execute(query, binddata, {outFormat:oracledb.OBJECT}, function(err, result) {
            if(err) {
                console.error(err.message);
                doRelease(connection); // 접속해제
                return;
            }
            console.log('Row Insert : ' + result.rowsAffected);   // 데이터 뭘 가져왔는지 뿌리기
            doRelease(connection, result.rowsAffected); // connection 해제
            response.redirect('/PcardMain'); // 화면으로 보내기
        });
    });

    // 디비 연결해제
    function doRelease(connection, rowList) {
        connection.release(function(err, rows) {
            if(err) {
                console.error(err.message);
            }

            // DB 종료까지 모두 완료되었을 시 응답 데이터 반환
            // response.send("" + result); // 작성시 에러났음
        });
    }
});
// 상원 종료 

// 석원 시작 -------------------------------------------------------
// ---------------------------------------
// 데이터 조회
app.get('/api/HallList', function(request, response) {
    console.log('--- boardList select ---')
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
        let query = 'SELECT * FROM res_tbl ORDER BY resCode DESC';
        connection.execute(query, [], {outFormat:oracledb.OBJECT}, function(err, result) {
            if(err) {
                console.error(err.message);
                doRelease(connection);
                return;
            }
            console.log(result.rows);   // 데이터
            deRelease(connection, result.rows);     // connection 해제
            response.send(result.rows);
        });
    });
    // 디비 연결해제
    function deRelease(connection, rowList) {
        connection.release(function(err, rows) {
            if(err) {
                console.error(err.message);
            }

            // DB 종료까지 모두 완료되었을 시 
            console.log('list size : ' + rowList.length);
            console.log(rowList);
        });
    }
})
// 데이터 삭제
router.post('/api/HallDelete', function(request, response) {
    console.log('--- boardList delete ---')
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
        // PrepareStatement
        let query = 'delete FROM RES_tbl where resCode=:resCode';
                  
        var binddate = [
            request.body.resCode
        ]

        connection.execute(query, binddate, function(err, result) {
            if(err) {
                console.error(err.message);
                doRelease(connection);
                return;
            }
            console.log('Row delete: ' + result.rowsAffected);   // 데이터
            deRelease(connection, result.rows);     // connection 해제
            response.redirect('/'); // index.html에서 Add.js 렌더링해서 리스트 결과 다시뿌려준다.
        });
    });

    // 디비 연결해제
    function deRelease(connection, result) {
        connection.release(function(err, rows) {
            if(err) {
                console.error(err.message);
            }

            // DB 종료까지 모두 완료되었을시 응답 데이터 반환
            // response.send(""+ result); 
        });
    }
})
// 석원 종료 -------------------------------------------------------

// 성언 시작 ----------------------------------------------------------
// 데이터 조회
app.get('/api/RecordList', function(request, response) {
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
        let query = 'select b.recordCode, e.empName, d.deptname, b.sales_dis, b.week_res_dis, b.ori_dis, b.res_can_dis, b.vip_dis, b.price_dis, b.res_dis, b.unique_dis, b.writedate '
                    +'from busiLog_tbl b ' 
                    +'JOIN emp_tbl e ' 
                    +'ON b.empCode = e.empCode ' 
                    +'JOIN dept_tbl d ' 
                    +'ON e.deptCode = d.deptCode ' 
                    +'ORDER BY b.recordCode DESC';
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
// 데이터 입력
router.post('/api/RecordInsert', function(request, response) {
    console.log(' --- boardList insert --- ') // nodemon 콘솔에서 확인
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
        let query = 'insert into busiLog_tbl(recordCode, empCode, sales_dis, week_res_dis, ori_dis, res_can_dis, vip_dis,  price_dis, res_dis, unique_dis) '
                     + 'VALUES(busiLog_seq.nextval, :empCode, :sales_dis, :week_res_dis, :ori_dis, :res_can_dis, :vip_dis, :price_dis, :res_dis, :unique_dis)';
        var binddata = [            
            request.body.empCode,
            request.body.sales_dis,
            request.body.week_res_dis,
            request.body.ori_dis,
            request.body.res_can_dis,
            request.body.vip_dis,
            request.body.price_dis,
            request.body.res_dis,
            request.body.unique_dis
        ]
        connection.execute(query, binddata, function(err, result) {
            if(err) {
                console.error(err.message);
                doRelease(connection);
                return;
            }
            console.log('Row Insert : ' + result.rowsAffected);  // 데이터
            doRelease(connection, result.rowsAffected);  // connection 해제
            response.redirect('/Record');
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
router.post('/api/RecordUpdate', function(request, response) {
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
        let query = 'update busiLog_tbl set sales_dis = :sales_dis, week_res_dis = :week_res_dis, ori_dis = :ori_dis, price_dis = :price_dis, vip_dis = :vip_dis, res_can_dis  = :res_can_dis,  res_dis = :res_dis, unique_dis = :unique_dis where recordCode = :recordCode';
        var binddata = [
            request.body.sales_dis,
            request.body.week_res_dis,
            request.body.ori_dis,
            request.body.price_dis,
            request.body.vip_dis,
            request.body.res_can_dis,            
            request.body.res_dis,
            request.body.unique_dis,
            request.body.recordCode
        ]
        


        connection.execute(query, binddata, function(err, result) {
            if(err) {
                console.error(err.message);
                doRelease(connection);
                return;
            }
            console.log('Row Update : ' + result.rowsAffected);  // 데이터
            doRelease(connection, result.rowsAffected);  // connection 해제
            response.redirect('/Record');     // 리스트 결과 다시 뿌려준다.
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
router.post('/api/RecordDelete', function(request, response) {
    console.log(' --- boardList delete --- ') // nodemon 콘솔에서 확인
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
        // PrepareStatement - :컬럼명과 binddata 갯수와 이름이 일치해야 함
        let query = 'delete from busiLog_tbl where recordCode = :recordCode';
        var binddata = [
            request.body.recordCode
        ]



        connection.execute(query, binddata, function(err, result) {
            if(err) {
                console.error(err.message);
                doRelease(connection);
                return;
            }
            console.log('Row Update : ' + result.rowsAffected);  // 데이터
            doRelease(connection, result.rowsAffected);  // connection 해제
            response.redirect('/Record');     // index.html에서 Add.js랜더링해서 리스트 결과 다시 뿌려준다.
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
// 성언 종료 -----------------------------------------------------------

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


