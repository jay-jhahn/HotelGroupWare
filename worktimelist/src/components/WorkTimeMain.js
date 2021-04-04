import React, {Component} from 'react';
import {Table, TableCell, TableRow, TableHead, Input, Checkbox } from '@material-ui/core';
import "ka-table/style.css";
import moment from 'moment';  // 날짜 타입
// import '../css/default.css';
import '../css/Board.css';
import { Link, BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import dbConfig from '../oracle/dbConfig';
import axios from 'axios';

class WorkTimeMain extends Component {

    constructor(props) {
        super(props)
        this.state = {
            value : '',
            show_detail: "none"
        }
    }

    // 상세버튼 클릭
    displayShowClick(boardNo, readCnt){
        if(this.state.show_detail === "block") {
            this.setState({
                show_detail: "none",
            })
        } else {
            this.setState({
                show_detail: "block",
            }) 
            axios({
                method:"POST",
                url: '/api/boardCount',
                data:{
                    "boardNo": boardNo,
                  
                }
            }).then((res)=>{
                console.log(res);
            }).catch(error=>{
                console.log(error);
                throw new Error(error);
            });
        }
    }
    
    state = {
        detail : ''
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

    render() { 
        let regdate = this.props.writeDate;
        return(   
            <Router>
                <tbody class="ka-tbody">
                    <tr class="ka-tr ka-row">
                        
                        <td class="ka-cell">
                            <div class="ka-cell-text">
                                <input type="button" class="btnD" value="상세" onClick={()=>this.displayShowClick(this.props.boardNo, this.props.readCnt)}></input>
                            </div>
                        </td>

                        <td class="ka-cell">
                            <div class="ka-cell-text"> { this.props.empCode } </div>
                        </td>
                        <td class="ka-cell">
                            <div class="ka-cell-text"> { this.props.deptCode } </div>
                        </td>
                        <td class="ka-cell">
                            <div class="ka-cell-text"> {moment(this.props.startWork).format('YYYY-MM-DD hh:mm')}</div>
                        </td>
                        <td class="ka-cell">
                            <div class="ka-cell-text">{moment(this.props.endWork).format('YYYY-MM-DD hh:mm')}</div>
                        </td>
                        <td class="ka-cell">
                            <div class="ka-cell-text">    
                            {                         
                                moment(this.props.startWork).format('YYYY-MM-DD hh:mm').substring(11 , 13) + moment(this.props.startWork).format('YYYY-MM-DD hh:mm').substring(14 , 16)  > parseInt('0700') ?
                                '지각' : '' 
                            }   
                                
                            {
                                 
                                 
                            }

                            </div>
                        </td>
                    </tr> 
                    <tr>
                        <td colSpan="5">
                            <form action="#" method="POST" onSubmit={this.updateMsg}>
                                <input type="hidden" name="boardNo" value={this.props.boardNo} />
                                <div className="list" style={{display: this.state.show_detail}} display="block" >  
                                    <Table>
                                        <TableHead>
                                            <TableRow className="TableRow">
                                                <TableCell><b> 직원이름&nbsp;&nbsp;&nbsp;: </b>&nbsp;&nbsp;&nbsp;{this.props.empCode}</TableCell>
                                                <TableCell><b> 근무 일 &nbsp;&nbsp;&nbsp;: </b>&nbsp;&nbsp;&nbsp;{this.props.workDay}</TableCell>
                                            </TableRow>
                                            <TableRow>
                                                <TableCell><b> 부서코드&nbsp;&nbsp;&nbsp;: </b>&nbsp;&nbsp;&nbsp;{this.props.deptCode}</TableCell>
                                                <TableCell><b> 연차 &nbsp;&nbsp;&nbsp;: </b>&nbsp;&nbsp;&nbsp;{this.props.workDay}</TableCell>
                                            </TableRow>
                                            <TableRow>
                                                <TableCell><b> 출근시간&nbsp;&nbsp;&nbsp;: </b>&nbsp;&nbsp;&nbsp;{moment(this.props.startWork).format('YYYY-MM-DD hh:mm')}</TableCell>
                                                <TableCell><b> 휴무 &nbsp;&nbsp;&nbsp;: </b>&nbsp;&nbsp;&nbsp;{this.props.workDay}</TableCell>
                                            </TableRow>
                                            <TableRow>
                                                <TableCell><b> 퇴근시간&nbsp;&nbsp;&nbsp;: </b>&nbsp;&nbsp;&nbsp;{moment(this.props.endWork).format('YYYY-MM-DD hh:mm')}</TableCell>
                                                <TableCell><b> 지각 &nbsp;&nbsp;&nbsp;: </b>&nbsp;&nbsp;&nbsp;{ this.props.state }</TableCell>
                                                <TableCell><b> 결근 &nbsp;&nbsp;&nbsp;: </b>&nbsp;&nbsp;&nbsp;{ this.props.state }</TableCell>
                                            </TableRow>
                                        </TableHead>
                                    </Table>
                                    <br></br>
                                </div>
                            </form>
                        </td>
                    </tr>   
                </tbody> 
            </Router>
        )         
    }
}
export default WorkTimeMain;