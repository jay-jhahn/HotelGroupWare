import React, { Component} from 'react';
//import{Table, TableCell, TableHead, TableRow, AppBar} from '@material-ui/core';
import Header from './Header';
import "ka-table/style.css";
import "../css/Board.css";
import moment from 'moment';  // 날짜 타입
import { ITableProps, kaReducer, Table } from "ka-table";
import { hideDetailsRow, showDetailsRow } from "ka-table/actionCreators";
import '../css/App.css';
import {BrowserRouter as Router} from 'react-router-dom';
import BoardList from './BoardList';

class MainList extends Component {

    // callApi : fetch()를 통해 select -> response -> componentDidMount() res -> setState(board) -> state.board가 수정 -> BoardList에 props 형태로 전달
    state = {
        board : ''
    }

    // 생명주기
    /* componentDidAmont() 메서드 : 컴포넌트가 마운트 된 직후 호출되며, 데이터로딩과 같은 작업 등에 재정의
    예 ) List에 특정 item들을 출력하고자 할때 item에 들어갈 Data가 Server에 존재한다면 Server에서 읽어와서
    item 데이터가 state에 존재시 이 state에 데이터를 setting하는 작업
    마운트 즉 React 컴포넌트가 실제 DOM에 삽입된 후 서버로부터 데이터를 읽어와서 setState후 화면에 rerendering */
    componentDidMount() {
        this.callApi()                        
            .then(res => this.setState({board: res}))    // arrow function : 화살표 함수 : 변수를 전달하면서 기능구현
            .catch(err => console.log(err));
    }

    /*
        async/await는 Promise를 더욱 쉽게 사용할 수 있도록 해주는 ESB(ES2017) 문법이다.
        이 문법을 사용하기 위해서 함수의 앞부분에 async 키워드를 추가하고,
        해당 함수 내부에서 Promise의 앞부분에 await 키워드를 사용한다.
        이렇게 하면 Promise가 끝날때까지 기다리고, 결과값을 특정 변수에 담을 수 있다.
        Promise는 콜백지옥 같은 코드가 형성되지 않게 하는 방안으로서 ES6에 도입된 기능이다.

        function increase(number) {
            const promise = new Promise((resolve, reject) => {  // resolve는 성공, reject는 실패
                ...
                async function runTasks() {

                }
            })
        }
    */

    callApi = async () => {
        const response = await fetch('/api/boardList');  // await fetch('url')로 json 형식으로 가져온 리스트(boardList)를 받아와서 response에 담는다.
        const body = await response.json();
        return body;
    }


    render(){
        return (
            <Router>
                {/* <div display="flex" alignitems="center" justify="center">
                    <AppBar position="static">
                        <div><Header /></div>
                    </AppBar>
                    <br/> */}
                <div id="root">
                    <div class="ka">
                        <div class="ka-table-wrapper">
                            <table class="ka-table">
                                <thead class="ka-thead">
                                    <tr class="ka-tr ka-thead-row">
                                        <th class="ka-thead-cell ka-thead-background "scope="col">
                                            <div class="ka-thead-cell-wrapper">
                                                <div class="ka-thead-cell-content-wrapper">
                                                    <div class="ka-thead-cell-content">
                                                        <span></span>
                                                    </div>                                                
                                                </div>
                                            </div>
                                        </th>                                        
                                        <th class="ka-thead-cell ka-thead-background "scope="col">
                                            <div class="ka-thead-cell-wrapper">
                                                <div class="ka-thead-cell-content-wrapper">
                                                    <div class="ka-thead-cell-content">
                                                        <span>제목</span>
                                                    </div>                                                
                                                </div>
                                            </div>
                                        </th>
                                        <th class="ka-thead-cell ka-thead-background "scope="col">
                                            <div class="ka-thead-cell-wrapper">
                                                <div class="ka-thead-cell-content-wrapper">
                                                    <div class="ka-thead-cell-content">
                                                        <span>내용</span>
                                                    </div>                                                
                                                </div>
                                            </div>
                                        </th>
                                        <th class="ka-thead-cell ka-thead-background "scope="col">
                                            <div class="ka-thead-cell-wrapper">
                                                <div class="ka-thead-cell-content-wrapper">
                                                    <div class="ka-thead-cell-content">
                                                        <span>조회수</span>
                                                    </div>                                                
                                                </div>
                                            </div>
                                        </th>
                                        <th class="ka-thead-cell ka-thead-background "scope="col">
                                            <div class="ka-thead-cell-wrapper">
                                                <div class="ka-thead-cell-content-wrapper">
                                                    <div class="ka-thead-cell-content">
                                                        <span>등록일</span>
                                                    </div>                                                
                                                </div>
                                            </div>
                                        </th>
                                        <th class="ka-thead-cell ka-thead-background "scope="col">
                                            <div class="ka-thead-cell-wrapper">
                                                <div class="ka-thead-cell-content-wrapper">
                                                    <div class="ka-thead-cell-content">
                                                        <span>수정일</span>
                                                    </div>                                                
                                                </div>
                                            </div>
                                        </th>
                                    </tr>
                                </thead>
                                
                                {this.state.board ? this.state.board.map((b, index) => {
                                    return <BoardList key={index} boardTitle={b.BOARDTITLE} boardContent={b.BOARDCONTENT}
                                    boardFile1={b.BOARDFILE1} boardFile2={b.BOARDFILE2} updateDate={b.UPDATEDATE}
                                    readCnt={b.READCNT} writeDate={b.WRITEDATE} boardNo={b.BOARDNO} boardState={b.BOARDSTATE} boardPwd={b.BOARDPWD}/>
                                }) : ''
                                }
                               
                            </table>
                        </div>
                    </div>
                    
                    {/* // <Table>
                    //     <TableHead>
                    //         <TableRow>
                    //             <TableCell><b>부서</b></TableCell>
                    //             <TableCell><b>이름</b></TableCell>
                    //             <TableCell><b>시간</b></TableCell>
                    //             <TableCell><b></b></TableCell>
                    //         </TableRow>
                    //     </TableHead>
                    // </Table> */}
                    {/* setState()애 의해 board값이 select한 결과로 변경 후,  BoardList에 porps 형태로 board_tbl 테이블의 게시판 정보 데이터 전달 */}
                    {/*  값들은 반드시 대문자 컬럼 */}
                    
                </div>
            </Router>

        )
    }

}

export default MainList;