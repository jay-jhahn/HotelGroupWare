import React, {Component} from 'react';
import {Table, TableCell, TableRow, TableHead, Input, Checkbox } from '@material-ui/core';
import "ka-table/style.css";
import moment from 'moment';  // 날짜 타입
// import '../css/default.css';
import '../css/Board.css';
import { Link, BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import dbConfig from '../oracle/dbConfig';
import axios from 'axios';

class BoardList extends Component {

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
    displayShowClick(boardNo, readCnt){
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
            axios({
                method:"POST",
                url: '/api/boardCount',
                data:{
                    "boardNo": boardNo
                }
            }).then((res)=>{
                console.log(res);
            }).catch(error=>{
                console.log(error);
                throw new Error(error);
            });
        }
    }
          
    // 수정버튼 클릭
    displayUpdateClick = (e) => {
        if(this.state.show_update === "block") {
            this.setState({
                show_detail: "none",
                show_delete: "none",
                show_update: "none"
            })
        }else{
            this.setState({
                show_detail: "none",
                show_delete: "none",
                show_update: "block"
            }) 
        }
    }   

    // 삭제버튼 클릭
    displayDeleteClick = (e) => {
        this.setState({
            show_detail: "none",
            show_update: "none",
            show_delete: "block",
        });
    }

    // 수정메세지
    updateMsg =()=>{
        alert('수정 성공!')
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
    }
   
    render() {
      
        return(
            <Router>
                {/* {
                    (this.props.cnt) === '0'
                    ? alertSuccess
                    : (this.props.cnt) === '1'
                        ? alertFailure
                        : <b>하하하{this.props.cnt}</b>
                }, */}
                
                
                {
                        (this.props.deptName) === '객실부'
                        ?(this.props.deptCode) === 'RO'
                            ? <tbody class="ka-tbody">
                            <tr class="ka-tr ka-row">
                                <td class="ka-cell">
                                    <div class="ka-cell-text">
                                        <input type="button" class="btnD" value="상세" onClick={()=>this.displayShowClick(this.props.boardNo, this.props.readCnt)}></input>
                                    </div>
                                </td>
                                <td class="ka-cell">
                                    <div class="ka-cell-text">{this.props.boardTitle}</div>
                                </td>
                                <td class="ka-cell">
                                    <div class="ka-cell-text">{this.props.boardContent}</div>
                                </td>
                                <td class="ka-cell">
                                    <div class="ka-cell-text">{this.props.readCnt}</div>
                                </td>
                                <td class="ka-cell">
                                    <div class="ka-cell-text">{moment(this.props.writeDate).format('YYYY-MM-DD hh:mm')}</div>
                                </td>
                                <td class="ka-cell">
                                    <div class="ka-cell-text">{moment(this.props.updateDate).format('YYYY-MM-DD hh:mm')}</div>
                                </td>
                            </tr> 
                            <tr>
                                <td colSpan="5">
                                    <form action="/api/boardUpdate" method="POST" onSubmit={this.updateMsg}>
                                        <input type="hidden" name="boardNo" value={this.props.boardNo} />
                                        <input type="hidden" name="deptName" value={this.props.deptName} />
                                        <div className="list" style={{display: this.state.show_detail}} display="block" >  
                                            <Table>
                                                <TableHead>
                                                    <TableRow className="TableRow">
                                                        <TableCell><b>제목 : {this.props.boardTitle}</b></TableCell>
                                                    </TableRow>
                                                    <TableRow>
                                                        <TableCell><b>내용 : </b></TableCell>
                                                    </TableRow>
                                                    <TableRow>
                                                    <TableCell>
                                                            <div>
                                                                {this.props.boardContent}
                                                            </div>
                                                        </TableCell>
                                                    </TableRow>
                                                    <TableRow>
                                                        <TableCell><img src={this.props.boardFile1}></img></TableCell>
                                                    </TableRow>
                                                    <TableRow>
                                                        <TableCell><img src={this.props.boardFile2}></img></TableCell>
                                                    </TableRow>
                                                    <TableRow>
                                                        <TableCell><b>등록일 : </b>{moment(this.props.writeDate).format('YYYY-MM-DD hh:mm')}</TableCell>
                                                    </TableRow>
                                                    <TableRow>
                                                        <TableCell><b>수정일 : </b>{moment(this.props.updateDate).format('YYYY-MM-DD hh:mm')}</TableCell>
                                                    </TableRow>
                                                </TableHead>
                                            </Table>
                                            <br></br>
                                            <input type="button" class="btnC" value="수정" onClick={this.displayUpdateClick}></input>                                    
                                            <input type="button" class="btnC" value="삭제" onClick={this.displayDeleteClick}></input>
                                        </div>
                                        <div className="list" style={{display: this.state.show_update}}>
                                        <Table>
                                            <TableHead>
                                                <TableRow className="TableRow">
                                                    <TableCell><b>제목 : {this.props.boardTitle}</b></TableCell>
                                                </TableRow>
                                                <TableRow>
                                                    <TableCell><b>내용 : </b></TableCell>
                                                </TableRow>
                                                <TableRow>
                                                <TableCell>
                                                        <textarea name="boardContent">
                                                            {this.props.boardContent}
                                                        </textarea>
                                                    </TableCell>
                                                </TableRow>
                                                <TableRow>
                                                    <TableCell>
                                                        <input type="file" name="boardFile1"/>
                                                        <input type="file" name="boardFile2"/>
                                                        </TableCell>
                                                    </TableRow>
                                                </TableHead>
                                            </Table>
                                            <br></br>
                                            <input type="submit" class="btnC" value="수정하기"></input>                                     
                                        </div>
                                    </form>
                                    {/* 삭제 화면 */}
                                    {/* onSubmit={this.updateMsg} */}
                                    <div className="delete" style={{display: this.state.show_delete}} >
                                        <form action="/api/boardDeletePwdCheck" method="POST">
                                            <input type="hidden" name="boardNo" value={this.props.boardNo} />
                                            <input type="hidden" name="deptName" value={this.props.deptName} />
                                            <Table>
                                                <TableRow>
                                                    <TableCell></TableCell>
                                                    <TableCell></TableCell>
                                                    <TableCell>
                                                        <span align="center">삭제할 게시물의 비밀번호를 입력해주세요!</span>
                                                    </TableCell>
                                                    <TableCell>
                                                        <input type="password" name="boardPwd" />
                                                    </TableCell>
                                                    <TableCell>
                                                        <input type="submit" class="btnC" value="삭제" />
                                                        {/* <button class="btnC" value="삭제" color="primary" onClick={()=>this.deleteMsg(this.props.boardNo, this.props.boardPwd)}>삭제</button> */}
                                                    </TableCell>
                                                </TableRow>
                                            </Table>
                                        </form>
                                    </div>
                                </td>
                            </tr>   
                        </tbody> 
                        : <b></b>
                        
                    :(this.props.deptName) === '사무부'
                        ?(this.props.deptCode) === 'OF'
                            ? <tbody class="ka-tbody">
                            <tr class="ka-tr ka-row">
                                <td class="ka-cell">
                                    <div class="ka-cell-text">
                                        <input type="button" class="btnD" value="상세" onClick={()=>this.displayShowClick(this.props.boardNo, this.props.readCnt)}></input>
                                    </div>
                                </td>
                                <td class="ka-cell">
                                    <div class="ka-cell-text">{this.props.boardTitle}</div>
                                </td>
                                <td class="ka-cell">
                                    <div class="ka-cell-text">{this.props.boardContent}</div>
                                </td>
                                <td class="ka-cell">
                                    <div class="ka-cell-text">{this.props.readCnt}</div>
                                </td>
                                <td class="ka-cell">
                                    <div class="ka-cell-text">{moment(this.props.writeDate).format('YYYY-MM-DD hh:mm')}</div>
                                </td>
                                <td class="ka-cell">
                                    <div class="ka-cell-text">{moment(this.props.updateDate).format('YYYY-MM-DD hh:mm')}</div>
                                </td>
                            </tr> 
                            <tr>
                                <td colSpan="5">
                                    <form action="/api/boardUpdate" method="POST" onSubmit={this.updateMsg}>
                                        <input type="hidden" name="boardNo" value={this.props.boardNo} />
                                        <input type="hidden" name="deptName" value={this.props.deptName} />
                                        <div className="list" style={{display: this.state.show_detail}} display="block" >  
                                            <Table>
                                                <TableHead>
                                                    <TableRow className="TableRow">
                                                    <TableCell><b>제목 : {this.props.boardTitle}</b></TableCell>
                                                    </TableRow>
                                                    <TableRow>
                                                        <TableCell><b>내용 : </b></TableCell>
                                                    </TableRow>
                                                    <TableRow>
                                                    <TableCell>
                                                            <div>
                                                                {this.props.boardContent}
                                                            </div>
                                                        </TableCell>
                                                    </TableRow>
                                                    <TableRow>
                                                        <TableCell><b>등록일 : </b>{moment(this.props.writeDate).format('YYYY-MM-DD hh:mm')}</TableCell>
                                                    </TableRow>
                                                    <TableRow>
                                                        <TableCell><b>수정일 : </b>{moment(this.props.updateDate).format('YYYY-MM-DD hh:mm')}</TableCell>
                                                    </TableRow>
                                                </TableHead>
                                            </Table>
                                            <br></br>
                                            <input type="button" class="btnC" value="수정" onClick={this.displayUpdateClick}></input>                                    
                                            <input type="button" class="btnC" value="삭제" onClick={this.displayDeleteClick}></input>
                                        </div>
                                        <div className="list" style={{display: this.state.show_update}}>
                                        <Table>
                                            <TableHead>
                                                <TableRow className="TableRow">
                                                    <TableCell><b>제목 : {this.props.boardTitle}</b></TableCell>
                                                </TableRow>
                                                <TableRow>
                                                    <TableCell><b>내용 : </b></TableCell>
                                                </TableRow>
                                                <TableRow>
                                                <TableCell>
                                                        <textarea name="boardContent">
                                                            {this.props.boardContent}
                                                        </textarea>
                                                    </TableCell>
                                                </TableRow>
                                                <TableRow>
                                                    <TableCell>
                                                        <input type="file" name="boardFile1"/>
                                                        <input type="file" name="boardFile2"/>
                                                        </TableCell>
                                                    </TableRow>
                                                </TableHead>
                                            </Table>
                                            <br></br>
                                            <input type="submit" class="btnC" value="수정하기"></input>                                     
                                        </div>
                                    </form>
                                    {/* 삭제 화면 */}
                                    {/* onSubmit={this.updateMsg} */}
                                    <div className="delete" style={{display: this.state.show_delete}} >
                                        <form action="/api/boardDeletePwdCheck" method="POST">
                                        <input type="hidden" name="deptName" value={this.props.deptName} />
                                            <input type="hidden" name="boardNo" value={this.props.boardNo} />
                                            <Table>
                                                <TableRow>
                                                    <TableCell></TableCell>
                                                    <TableCell></TableCell>
                                                    <TableCell>
                                                        <span align="center">삭제할 게시물의 비밀번호를 입력해주세요!</span>
                                                    </TableCell>
                                                    <TableCell>
                                                        <input type="password" name="boardPwd" />
                                                    </TableCell>
                                                    <TableCell>
                                                        <input type="submit" class="btnC" value="삭제" />
                                                        {/* <button class="btnC" value="삭제" color="primary" onClick={()=>this.deleteMsg(this.props.boardNo, this.props.boardPwd)}>삭제</button> */}
                                                    </TableCell>
                                                </TableRow>
                                            </Table>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </tbody> 
                        : <b></b>
                    : <b></b>
                    }
                    
                   
            </Router>
        )         
    }
}

export default BoardList;