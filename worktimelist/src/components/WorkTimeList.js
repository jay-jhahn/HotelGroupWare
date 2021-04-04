import React, { Component} from 'react';
//import{Table, TableCell, TableHead, TableRow, AppBar} from '@material-ui/core';
import "ka-table/style.css";
import "../css/Board.css";
import moment from 'moment';  // 날짜 타입
import { ITableProps, kaReducer, Table } from "ka-table";
import { hideDetailsRow, showDetailsRow } from "ka-table/actionCreators";
import '../css/App.css';
import {BrowserRouter as Router} from 'react-router-dom';
import WorkTimeMain from './WorkTimeMain';

class WorkTimeList extends Component {
    
    state = {
        board : ''
    }
    
    componentDidMount() {
        this.callApi()                        
            .then(res => this.setState({board: res}))    
            .catch(err => console.log(err));
    }

    callApi = async () => {
        const response = await fetch('/getWorkData'); 
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
                                                        <span> 직원 이름 </span>
                                                    </div>                                                
                                                </div>
                                            </div>
                                        </th>
                                        <th class="ka-thead-cell ka-thead-background "scope="col">
                                            <div class="ka-thead-cell-wrapper">
                                                <div class="ka-thead-cell-content-wrapper">
                                                    <div class="ka-thead-cell-content">
                                                        <span> 소속 부서 </span>
                                                    </div>                                                
                                                </div>
                                            </div>
                                        </th>
                                        <th class="ka-thead-cell ka-thead-background "scope="col">
                                            <div class="ka-thead-cell-wrapper">
                                                <div class="ka-thead-cell-content-wrapper">
                                                    <div class="ka-thead-cell-content">
                                                        <span> 출근 시간 </span>
                                                    </div>                                                
                                                </div>
                                            </div>
                                        </th>
                                        <th class="ka-thead-cell ka-thead-background "scope="col">
                                            <div class="ka-thead-cell-wrapper">
                                                <div class="ka-thead-cell-content-wrapper">
                                                    <div class="ka-thead-cell-content">
                                                        <span> 퇴근 시간 </span>
                                                    </div>                                                
                                                </div>
                                            </div>
                                        </th>
                                        <th class="ka-thead-cell ka-thead-background "scope="col">
                                            <div class="ka-thead-cell-wrapper">
                                                <div class="ka-thead-cell-content-wrapper">
                                                    <div class="ka-thead-cell-content">
                                                        <span> 지각 / 결근 </span>
                                                    </div>                                                
                                                </div>
                                            </div>
                                        </th>
                                    </tr>
                                </thead>
                                
                                {this.state.board ? this.state.board.map((b, index) => {
                                    return <WorkTimeMain key={index} 
                                            empCode={b.EMPCODE} 
                                            deptCode={b.DEPTCODE}
                                            startWork={b.STARTWORK} 
                                            endWork={b.ENDWORK} 
                                            state={b.STATE}
                                    />
                                }) : ''
                                }
                            </table>
                        </div>
                    </div>
                </div>
            </Router>
        )
    }

}

export default WorkTimeList;