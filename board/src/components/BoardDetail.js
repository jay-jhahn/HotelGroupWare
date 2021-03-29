import React, {Component} from 'react';
import {Table, TableCell, TableRow, TableHead, Input } from '@material-ui/core';
import "ka-table/style.css";
import moment from 'moment';  // 날짜 타입
import '../css/Board.css';
import { Link, BrowserRouter as Router, Route, Switch} from 'react-router-dom';

function fetchData1(boardNo, readCnt) {
    return ('/api/boardCount?boardNo='+boardNo+'&readCnt='+readCnt);

}


class BoardDetail extends Component{

    constructor(props) {
        super(props)
        this.state = {
            value : ''
        }
        this.state = {
            value : '',
            show_update: "none",
            show_delete: "none",
            show_detail: "block"
            
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
        fetch('/api/boardCount?boardNo='+boardNo+'&readCnt='+readCnt);
        
       
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
        show_delete: "block"
    });
}

    render(){
        return(
            <div>
                <form >
                    <input type="hidden" name="boardNo" value={this.props.boardNo} />
                    <div className="list" style={{display: this.state.show_detail}} >  
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
                    <div className="delete" style={{display: this.state.show_delete}}>
                        <form action="/api/boardDelete" method="POST">
                            <input type="hidden" name="boardNo" value={this.props.boardNo} />
                            <Table>
                                <TableRow>
                                    <TableCell></TableCell>
                                    <TableCell></TableCell>
                                    <TableCell>
                                        <span align="center">삭제하시겠습니까?</span>
                                    </TableCell>
                                    <TableCell>
                                        <input class="btnC" type="submit" value="삭제" color="primary" />
                                    </TableCell>
                                </TableRow>
                            </Table>
                        </form>
                    </div>
                </div>
        );
    }
}
export default BoardDetail;