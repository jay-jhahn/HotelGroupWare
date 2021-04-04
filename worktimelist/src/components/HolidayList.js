import React, {Component} from 'react';
import {Table, TableCell, TableRow, TableHead, Input, Checkbox } from '@material-ui/core';
import "ka-table/style.css";
import moment from 'moment';  // 날짜 타입
// import '../css/default.css';
import '../css/Board.css';
import { Link, BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import dbConfig from '../oracle/dbConfig';
import HolidayMain from './HolidayMain';
import axios from 'axios';

class HolidayList extends Component {

    constructor(props) {
        super(props)
       
        this.state = {
            value : '',
            show_update: "none",
            show_delete: "none",
            show_detail: "none"
        }
    }

    // 상세버튼 클릭
    displayShowClick(){
        if(this.state.show_detail === "block") {
            this.setState({
                show_detail: "none",
                show_delete: "none",
                show_update: "none"
            })
        }else{
            this.setState({
                show_detail: "block",
                show_delete: "none",
                show_update: "none"
            }) 
        }
    }
    state = {
        detail : ''
    }

    componentDidMount() {
        this.callApi()                        
            .then(res => this.setState({holiday: res}))    // arrow function : 화살표 함수 : 변수를 전달하면서 기능구현
            .catch(err => console.log(err));
    }

    callApi = async () => {
        const response = await fetch('/api/holidayList');  // await fetch('url')로 json 형식으로 가져온 리스트(boardList)를 받아와서 response에 담는다.
        const body = await response.json();
        return body;
    }
    
    render() {
        return(
            <Router>
                <tbody class="ka-tbody">
                    <tr class="ka-tr ka-row">
                        <td class="ka-cell">
                            <div class="ka-cell-text">
                                <input type="button" class="btnD" value="상세" onClick={()=>this.displayShowClick()}></input>
                            </div>
                        </td>
                        <td class="ka-cell">
                            <div class="ka-cell-text">{this.props.deptName}</div>
                        </td>
                        <td class="ka-cell">
                            <div class="ka-cell-text">{this.props.empName}</div>
                        </td>
                        <td class="ka-cell">
                            <div class="ka-cell-text">{this.props.kindHoliday}</div>
                        </td>
                        <td class="ka-cell">
                            <div class="ka-cell-text">{this.props.state}</div>
                        </td>
                    </tr> 
                    <tr>
                        <td colSpan="5">
                                <div className="list" style={{display: this.state.show_detail}} display="block" >  
                                    <Table>
                                        <TableHead>
                                            <TableRow className="TableRow">
                                                <TableCell><b>부서 : {this.props.deptName}</b></TableCell>
                                            </TableRow>
                                            <TableRow>
                                                <TableCell><b>이름 : {this.props.empName}</b></TableCell>
                                            </TableRow>
                                            <TableRow>
                                                <TableCell>
                                                {
                                                    (this.props.kindHoliday) === 0
                                                    ? <b>휴무 종류 : 연자 </b>
                                                    : (this.props.kindHoliday) === 1
                                                        ? <b>휴무 종류 : 병가 </b>
                                                        : (this.props.kindHoliday) === 2
                                                            ? <b>휴무 종류 : 오전반차 </b>
                                                            : <b>휴무 종류 : 오후반차 </b>
                                                }
                                                </TableCell> 
                                            </TableRow>
                                            <TableRow>
                                                <TableCell><b>휴무 신청일 : {moment(this.props.startHoliday).format('YYYY-MM-DD')} </b></TableCell>
                                            </TableRow>
                                            <TableRow>
                                                <TableCell><b>휴무 종료일 : {moment(this.props.endHoliday).format('YYYY-MM-DD')} </b></TableCell>
                                            </TableRow>
                                            <TableRow>
                                                <TableCell><b>사유 : </b><textarea>{this.props.reasonHoliday}</textarea></TableCell>
                                            </TableRow>
                                            <TableRow>
                                            <TableCell>
                                                {
                                                    (this.props.kindHoliday) === 0
                                                    ? <b>휴무 처리 상태 : 진행중 </b>
                                                    : (this.props.kindHoliday) === 1
                                                        ? <b>휴무 처리 상태 : 승인 </b>
                                                        : <b>휴무 처리 상태 : 반려 </b>
                                                }
                                                </TableCell> 
                                            </TableRow>
                                        </TableHead>
                                    </Table>
                                </div>
                        </td>
                    </tr>   
                </tbody> 
            </Router>
        )         
    }
}
export default HolidayList;























