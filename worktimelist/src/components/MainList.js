import React, { Component} from 'react';
import "ka-table/style.css";
import "../css/Board.css";
import moment from 'moment';  // 날짜 타입
import { ITableProps, kaReducer, Table } from "ka-table";
import { hideDetailsRow, showDetailsRow } from "ka-table/actionCreators";
import '../css/App.css';
import {BrowserRouter as Router} from 'react-router-dom';
import BoardList from './BoardList';
import { json } from 'body-parser';


class MainList extends Component {
    constructor(props) {
        super(props)
       
    }


    state = {
        board : ''
    }
    componentDidMount() {
        
        this.callApi()                        
            .then(res => this.setState({board: res}))  
            .catch(err => console.log(err));
    }


    callApi = async () => {
        const response = await fetch('/api/boardList');  
        const body = await response.json();
        return body;
    }
    


    render(){
        return (
            <Router>
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
                                            updateDate={b.UPDATEDATE} empCode={b.EMPCODE}
                                            readCnt={b.READCNT} writeDate={b.WRITEDATE} boardNo={b.BOARDNO}
                                            boardState={b.BOARDSTATE} boardPwd={b.BOARDPWD} deptCode={b.DEPTCODE} deptName={this.props.deptName} cnt={this.props.cnt}/>
                                            }) : ''
                                        }
                                    </table>
                                </div>
                            </div>
                        </div>
                
                {/* {
                    (this.props.deptName) === '객실부'
                    ?    <div id="root">
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
                                            boardFile1={b.BOARDFILE1} boardFile2={b.BOARDFILE2} 
                                            updateDate={b.UPDATEDATE} empCode={b.EMPCODE}
                                            readCnt={b.READCNT} writeDate={b.WRITEDATE} boardNo={b.BOARDNO}
                                            boardState={b.BOARDSTATE} boardPwd={b.BOARDPWD} deptCode={b.DEPTCODE} deptName={this.props.deptName} cnt={this.props.cnt}/>
                                            }) : ''
                                        }
                                    </table>
                                </div>
                            </div>
                        </div>
                    : (this.props.deptName) === '사무부'
                        ? <div id="root">
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
                                            boardFile1={b.BOARDFILE1} boardFile2={b.BOARDFILE2} 
                                            updateDate={b.UPDATEDATE} empCode={b.EMPCODE}
                                            readCnt={b.READCNT} writeDate={b.WRITEDATE} boardNo={b.BOARDNO}
                                            boardState={b.BOARDSTATE} boardPwd={b.BOARDPWD} deptCode={b.DEPTCODE} deptName={this.props.deptName} cnt={this.props.cnt}/>
                                        }) : ''
                                        }
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                    : <b>없음!!!!!!</b>
                    
                 } */}
                 
            </Router>

        )
    }

}

export default MainList;



