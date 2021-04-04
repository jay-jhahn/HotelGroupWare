import React, { Component } from 'react';
import '../css/App.css';
import { Table, TableCell, TableRow } from '@material-ui/core';
import { Link, BrowserRouter as Router, Route  } from 'react-router-dom';


class ReqModify extends Component {

    constructor(props) {
        super(props)
            this.state={
                show_calendar: "false"
            }
    }
    
    componentDidMount() {
        this.callApi()
            .then(empcode => this.setState({ empName: empcode }), skdmonth => this.setState({ empDept: skdmonth }) ) 
            .catch(err => console.log(err));
    }

    callApi = async () => {
        const response = await fetch('/getEmpInfo');  // await fetch('url')로 json 형식으로 가져온 리스트(boardList)를 받아온다 받아와서 response 에 담는다 ;
        const body = await response.json();
        return body;
    }

    showCalendar = (e) => {
        this.setState ({
            show_calendar: !this.state.show_calendar,
        });
    }

    noShowCalendar = (e) => {
        this.setState ({
            show_calendar: "none"
        });
    }

    render () {
        return (
        <Router>
            <div className="header">
                <form action="/insertReqModiy" method="post">
                    <Table>
                        <TableRow>
                            <TableCell> 직원 이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="text" name="empName" placeholder={ this.state.empName } readOnly /></TableCell>
                        </TableRow>
                        
                        <TableRow>   
                            <TableCell> 소속 부서&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <input type="text" name="empDept" placeholder={ this.state.empDept } readOnly /></TableCell>
                        </TableRow>   

                        <TableRow>
                            <TableCell> 변경 일자 선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="date" name="modifyDate" onClick={this.noShowCalendar} /></TableCell>
                        </TableRow>

                        <h3> 스케줄 조정 변경 내역</h3>
                            <TableRow>
                                <TableCell> 신청내역 리스트 뿌리기 !!! </TableCell> 
                            </TableRow>

                            <TableRow>
                                <TableCell> 신청내역 리스트 뿌리기 !!! </TableCell> 
                            </TableRow>

                            <TableRow>
                                <TableCell> 신청내역 리스트 뿌리기 !!! </TableCell> 
                            </TableRow>   

                        <TableRow>
                            <TableCell > 근무선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
                                <select> 
                                    <option> 근무선택 </option>
                                    <option> 주간근무 </option>
                                    <option> 오후근무 </option>
                                    <option> 야간근무 </option>
                                </select>
                            </TableCell>
                        </TableRow>

                        <TableRow>
                            <TableCell> 변경 사유&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
                                <textarea className="textAreaSize"/> 
                            </TableCell>
                        </TableRow>

                        <TableRow>
                            <td colSpan="3">  
                                <input type="submit" value="신청 하기" variant="contained" color="primary" className="selectButton" /> 
                             </td>
                        </TableRow>
                    </Table>
                </form>
             </div>
        </Router>
        );
    }
}

export default ReqModify;






























