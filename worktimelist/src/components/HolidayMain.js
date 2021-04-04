import React, { Component} from 'react';
//import{Table, TableCell, TableHead, TableRow, AppBar} from '@material-ui/core';
import "ka-table/style.css";
import moment from 'moment';  // 날짜 타입
import { ITableProps, kaReducer, Table } from "ka-table";
import { hideDetailsRow, showDetailsRow } from "ka-table/actionCreators";
import '../css/App.css';
import {BrowserRouter as Router} from 'react-router-dom';
import HolidayList from './HolidayList';

class HolidayMain extends Component {

    state = {
        holiday : ''
    }
   
    componentDidMount() {
        this.callApi()                        
            .then(res => this.setState({holiday: res}))    // arrow function : 화살표 함수 : 변수를 전달하면서 기능구현
            .catch(err => console.log(err));
    }


    callApi = async () => {
        const response = await fetch('/api/holidayList');  
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
                                                        <span>부서</span>
                                                    </div>                                                
                                                </div>
                                            </div>
                                        </th>
                                        <th class="ka-thead-cell ka-thead-background "scope="col">
                                            <div class="ka-thead-cell-wrapper">
                                                <div class="ka-thead-cell-content-wrapper">
                                                    <div class="ka-thead-cell-content">
                                                        <span>이름</span>
                                                    </div>                                                
                                                </div>
                                            </div>
                                        </th>
                                        <th class="ka-thead-cell ka-thead-background "scope="col">
                                            <div class="ka-thead-cell-wrapper">
                                                <div class="ka-thead-cell-content-wrapper">
                                                    <div class="ka-thead-cell-content">
                                                        <span>종류</span>
                                                    </div>                                                
                                                </div>
                                            </div>
                                        </th>
                                        <th class="ka-thead-cell ka-thead-background "scope="col">
                                            <div class="ka-thead-cell-wrapper">
                                                <div class="ka-thead-cell-content-wrapper">
                                                    <div class="ka-thead-cell-content">
                                                        <span>상태</span>
                                                    </div>                                                
                                                </div>
                                            </div>
                                        </th>
                                    </tr>
                                </thead>
                                
                                {this.state.holiday ? this.state.holiday.map((h, index) => {
                                    return <HolidayList key={index} holidayCode={h.HOLIDAYLIST} scdCode={h.SEDCODE}
                                    empCode={h.EMPCODE} deptCode={h.DEPTCODE} kindHoliday={h.KINDHOLIDAY}
                                    startHoliday={h.STARTHOLIDAY} endHoliday={h.ENDHOLIDAY} reasonHoliday={h.REASONHOLIDAY} 
                                    state={h.STATE} availableHoliday={h.AVAILABLEHOLIDAY} remainHoliday={h.REMAINHOLIDAY} 
                                    usedHoliday={h.USEDHOLIDAY} empName={h.EMPNAME} deptName={h.DEPTNAME} />
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

export default HolidayMain;