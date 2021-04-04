import React, { Component } from 'react';
import { Table, TableCell, TableRow, TableHead } from '@material-ui/core';
import {BrowserRouter as Router} from 'react-router-dom';    
import '../css/default.css';
import "ka-table/style.css";
import '../css/Hall.css';

class HallList extends Component {
    constructor(props) {
        super(props);
        this.state = {
            value: '',
            show_update: "none",
            show_delete: "none",
            show_detail: "none"
        }
    }

    // 상세버튼 클릭
    displayShowClick = (e) => {
        if (this.state.show_detail === "block") {
            this.setState({
                show_detail: "none",
                show_delete: "none",
                show_update: "none"
            })

        } else {
            this.setState({
                show_detail: "block",
                show_delete: "none",
                show_update: "none"
            })
        }
    }

    // 수정 버튼 클릭
    displayUpdateClick = (e) => {
        this.setState({
            show_update: "block",
            show_delete: "none"
        })
    }

    // 삭제 버튼 클릭
    displayDeleteClick = (e) => {
        this.setState({
            show_update: "none",
            show_delete: "none"
        })
    }

    // Input : @material-ui/core에서 제공하는 input box로 라인형태로 제공
    // input : html 태그
    // hidden:  <input type="hidden" name="board_no" value={this.props.board_no} /> ==>where 절에서 key 비교하기위해 hidden으로 board_no을 가지고 있는다
    render() {

        // let regdate = this.props.board_regdate;
        return (
            <Router>
                <tbody class="ka-tbody" boarder="border-style:solid 1px">
                    <tr class="ka-tr ka-row">
                        <td class="ka-cell">
                            <div class="ka-cell-text">
                                <input type="button" class="btnD" value="상세" onClick={this.displayShowClick}></input>
                            </div>
                        </td>
                        <td class="ka-cell">
                            <div class="ka-cell-text">{this.props.guestName}</div>
                            <div class="ka-cell-text">{this.props.eventTitle}</div>
                            <div class="ka-cell-text">{this.props.eventDate}</div>
                        </td>
                    </tr>
                    <tr>
                        <td colSpan="5">
                            <form action="/api/HallDelete" method="POST">
                                <input type="hidden" name="resCode" value={this.props.resCode} />
                                <div className="list" style={{ display: this.state.show_detail }} display="block">
                                    <Table>
                                        <TableHead>
                                            <tr className="TableRow" className="textsize">
                                                <td><b>행사명 : {this.props.eventTitle}</b></td>
                                                <td><b>예약날짜 : {this.props.eventDate}</b></td>
                                                <td className="tdsize"><b>예약시간  {this.props.checkIn}</b></td>
                                                <td><b>아웃시간  {this.props.checkOut}</b></td>
                                            </tr>
                                            <br/>
                                            <tr>
                                                <td><b>예약인원 : {this.props.resCount}</b></td>
                                                <td><b>연회장음식메뉴 : {this.props.eventMenu}</b></td>
                                                <td><b>연회장음식메뉴상세 : {this.props.eventMenu1}</b></td>
                                                <td><b>DECORATION CAKE : {this.props.eventCake}</b></td>
                                            </tr>
                                            <br/>
                                            <tr>
                                                <td><b>플라워 : {this.props.eventFlower}</b></td>
                                                <td><b>ICE-CARVING : {this.props.eventIce}</b></td>
                                                <td><b>MIST MACHINE : {this.props.eventMist}</b></td>
                                                <td><b>기타사항 : {this.props.eventNotes}</b></td>
                                            </tr>
                                            <br/>
                                            <tr>
                                                <td><b colSpan="2">연회장음식메뉴상세 : {this.props.eventMenu1}</b></td>
                                                <td><b>연회장테이블세팅 : {this.props.eventTableSet}</b></td>
                                            </tr>
                                        </TableHead>
                                    </Table>
                                    <br></br>
                                    <input type="submit" class="btnC" value="삭제">

                                    </input>
                                </div>
                            </form>
                            {/* 삭제 화면 */}
                            <div className="delete" style={{ display: this.state.show_delete }}>
                                <form action="/api/HallDelete" method="POST">
                                    <input type="hidden" name="rescordCode" value={this.props.recordCode} />
                                    <Table>
                                        <TableRow>
                                            <TableCell>
                                                <input class="btnC" type="submit" value="삭제" color="primary" />
                                            </TableCell>
                                        </TableRow>
                                    </Table>
                                </form>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </Router>
        )
    }
}

export default HallList;