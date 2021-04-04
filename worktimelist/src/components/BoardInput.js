import React, {Component} from 'react';
import {Table, TableCell, TableRow, TableHead, Input, Checkbox } from '@material-ui/core';
import "ka-table/style.css";
import '../css/Board.css';
import { Link, BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import dbConfig from '../oracle/dbConfig';
//import axios from 'axios';



class BoardInput extends Component {
    
    msg =()=>{
        alert('작성성공!')//띄워짐
      }

    render() {
        const {params} = this.props.match;
        return(
            <Router>
               
                <form action='/api/boardAdd' method="POST" onSubmit={this.msg}>
                    <input type="hidden" name="empCode" value={params.empCode} />
                    <input type="hidden" name="deptCode" value={params.deptCode} />
                    <Table>
                        <TableHead>
                            <TableRow className="TableRow">
                                <TableCell>제목 : {params.empCode}{params.deptCode}</TableCell>
                                <TableCell>
                                    <Input type="text" name="boardTitle"/>
                                </TableCell>
                            </TableRow>
                            <TableRow>
                                <TableCell>비밀번호 : </TableCell>
                                <TableCell>
                                    <Input type="password" name="boardPwd"/>
                                </TableCell>
                            </TableRow>
                            <TableRow>
                                <TableCell>내용 : </TableCell>
                                    <TableCell colSpan="4">
                                    <textarea name="boardContent"></textarea>
                                </TableCell>
                            </TableRow>
                            <TableRow>
                                <TableCell>필독 체크 : </TableCell>
                                    <TableCell colSpan="4">
                                    <Checkbox name="boardState" value="1"></Checkbox>
                                </TableCell>
                            </TableRow>
                        </TableHead>
                    </Table>
                    <br></br>
                    <input type="submit" class="btnC" value="등록"></input>      
                </form>                              
            </Router>
        )         
    }
}
export default BoardInput;