import React, {Component} from 'react';
import {Table, TableCell, TableRow, TableHead } from '@material-ui/core';
import "ka-table/style.css";
import moment from 'moment';  // 날짜 타입
import '../css/Record.css';
import { BrowserRouter as Router} from 'react-router-dom';

class RecordList extends Component {
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
    displayShowClick = (e) => {
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

    
    render() {    
        return(
            <Router>
                <tbody class="ka-tbody">                        
                    <tr class="ka-tr ka-row">
                        <td class="ka-cell">
                            <div class="ka-cell-text">
                                <input type="button" class="btnD" value="상세" onClick={this.displayShowClick}></input>
                            </div>
                        </td>
                        <td class="ka-cell">
                            <div class="ka-cell-text">{this.props.recordCode}</div>
                        </td>
                        <td class="ka-cell">
                            <div class="ka-cell-text">{this.props.deptname}</div>
                        </td>
                        <td class="ka-cell">
                            <div class="ka-cell-text">{this.props.empName}</div>
                        </td>
                        <td class="ka-cell">
                            <div class="ka-cell-text">{moment(this.props.writeDate).format('YYYY-MM-DD hh:mm')}</div>
                        </td>
                    </tr> 
                    <tr>
                        <td colSpan="5">
                            <form action="/api/RecordUpdate" method="POST">
                                <input type="hidden" name="recordCode" value={this.props.recordCode} />
                                <div className="list" style={{display: this.state.show_detail}} display="block">
                                    <Table className="card2">
                                        <TableHead>                                                                                       
                                            <TableRow>                                                
                                                <TableCell className="cell1" colSpan="4" align="center"><b>업무일지내용</b></TableCell>                                                                                                                                                    
                                            </TableRow>
                                            <TableRow>
                                                <TableCell rowSpan="1" className="cell3">
                                                    <h5>실적</h5>
                                                </TableCell>
                                                <TableCell className="cell5">
                                                    <h5>객실 종류별 판매 실적</h5>
                                                </TableCell>
                                                <TableCell>
                                                    <textarea className="textarea2" value={this.props.sales_dis}></textarea>
                                                </TableCell>
                                            </TableRow>                                          
                                            <TableRow> 
                                                <TableCell rowSpan="4" className="cell3">
                                                    <h5>현황</h5>
                                                </TableCell>
                                                <TableCell>
                                                    <h5>향후<br></br> 일주일간 <br></br>예약 현황</h5>
                                                </TableCell>
                                                <TableCell>
                                                     <textarea className="textarea2" value={this.props.week_res_dis}></textarea>
                                                </TableCell>
                                            </TableRow>                                          
                                            <TableRow>                                                    
                                                <TableCell>
                                                    <h5>단체객 현황</h5>
                                                </TableCell>
                                                <TableCell>
                                                     <textarea className="textarea2" value={this.props.ori_dis}></textarea>
                                                </TableCell>
                                            </TableRow>               
                                            <TableRow>                                                 
                                                <TableCell>
                                                    <h5>특별요금 <br></br>적용 현황</h5>
                                                </TableCell>
                                                <TableCell>
                                                    <textarea className="textarea2" value={this.props.price_dis}></textarea>
                                                </TableCell>                                                
                                            </TableRow>
                                            <TableRow>                                                 
                                                <TableCell>
                                                    <h5>vip 현황</h5>
                                                </TableCell>
                                                <TableCell>
                                                     <textarea className="textarea2" value={this.props.vip_dis}></textarea>
                                                </TableCell>
                                            </TableRow>                                                      
                                            <TableRow>       
                                                <TableCell rowSpan="2" className="cell3">
                                                    <h5>명단</h5>
                                                </TableCell>                                                                                     
                                                <TableCell>
                                                    <h5>예약 <br></br>무단취소 <br></br>명단</h5>
                                                </TableCell>
                                                <TableCell>
                                                     <textarea className="textarea2" value={this.props.res_can_dis }></textarea>
                                                </TableCell>
                                            </TableRow>  
                                            <TableRow>
                                                <TableCell>
                                                    <h5>예약자 명단</h5>
                                                </TableCell>
                                                <TableCell>
                                                     <textarea className="textarea2" value={this.props.res_dis}></textarea>
                                                </TableCell>
                                            </TableRow>                                          
                                            <TableRow>
                                                <TableCell className="cell3">
                                                    <h5>비고</h5>
                                                </TableCell>                                                 
                                                <TableCell>
                                                    <h5>특이사항</h5>
                                                </TableCell>
                                                <TableCell>
                                                     <textarea className="textarea2" value={this.props.unique_dis}></textarea>
                                                </TableCell>
                                                <TableCell></TableCell>                                                
                                            </TableRow>
                                        </TableHead>
                                    </Table>
                                    <br></br>
                                    <input type="button" class="btnC" value="수정" onClick={this.displayUpdateClick}></input>                                    
                                    <input type="button" class="btnC" value="삭제" onClick={this.displayDeleteClick}></input>
                                </div>
                                <div className="list" style={{display: this.state.show_update}}>
                                    <Table>
                                            <TableRow>
                                                 <TableCell className="cell1" colSpan="4" align="center"><b>업무일지내용</b></TableCell>                                                                                                    
                                            </TableRow>
                                            <TableRow>
                                                <TableCell rowSpan="1" className="cell3">
                                                    <h5>실적</h5>
                                                </TableCell>
                                                <TableCell className="cell5">
                                                    <h5>객실 종류별 판매 실적</h5>
                                                </TableCell>
                                                <TableCell>
                                                     <textarea className="textarea2" name="sales_dis">{this.props.sales_dis}</textarea>
                                                </TableCell>
                                            </TableRow>                                          
                                            <TableRow> 
                                                <TableCell rowSpan="4" className="cell3">
                                                    <h5>현황</h5>
                                                </TableCell>
                                                <TableCell>
                                                    <h5>향후<br></br> 일주일간 <br></br>예약 현황</h5>
                                                </TableCell>
                                                <TableCell>
                                                      <textarea className="textarea2" name="week_res_dis">{this.props.week_res_dis}</textarea>
                                                </TableCell>
                                            </TableRow>                                          
                                            <TableRow>                                                    
                                                <TableCell>
                                                    <h5>단체객 현황</h5>
                                                </TableCell>
                                                <TableCell>
                                                     <textarea className="textarea2" name="ori_dis">{this.props.ori_dis}</textarea>
                                                </TableCell>
                                            </TableRow>               
                                            <TableRow>                                                 
                                                <TableCell>
                                                    <h5>특별요금 <br></br>적용 현황</h5>
                                                </TableCell>
                                                <TableCell>
                                                     <textarea className="textarea2" name="price_dis">{this.props.price_dis}</textarea>
                                                </TableCell>                                                
                                            </TableRow>
                                            <TableRow>                                                 
                                                <TableCell>
                                                    <h5>vip 현황</h5>
                                                </TableCell>
                                                <TableCell>
                                                     <textarea className="textarea2" name="vip_dis">{this.props.vip_dis}</textarea>
                                                </TableCell>
                                            </TableRow>                                                      
                                            <TableRow>       
                                                <TableCell rowSpan="2" className="cell3">
                                                    <h5>명단</h5>
                                                </TableCell>                                                                                     
                                                <TableCell>
                                                    <h5>예약 <br></br>무단취소 <br></br>명단</h5>
                                                </TableCell>
                                                <TableCell>
                                                    <textarea className="textarea2" name="res_can_dis">{this.props.res_can_dis}</textarea>
                                                </TableCell>
                                            </TableRow>  
                                            <TableRow>
                                                <TableCell>
                                                    <h5>예약자 명단</h5>
                                                </TableCell>
                                                <TableCell>
                                                      <textarea className="textarea2" name="res_dis">{this.props.res_dis}</textarea>
                                                </TableCell>
                                            </TableRow>                                          
                                            <TableRow>
                                                <TableCell className="cell3">
                                                    <h5>비고</h5>
                                                </TableCell>                                                 
                                                <TableCell>
                                                    <h5>특이사항</h5>
                                                </TableCell>
                                                <TableCell>
                                                     <textarea className="textarea2" name="unique_dis">{this.props.unique_dis}</textarea>
                                                </TableCell>
                                                <TableCell></TableCell>                                                
                                            </TableRow>                      
                                    </Table>
                                    <br></br>
                                    <input type="submit" class="btnC" value="수정하기"></input>                                    
                                </div>
                            </form>
                            {/* 삭제 화면 */}
                            <div className="delete" style={{display: this.state.show_delete}}>
                                <form action="/api/RecordDelete" method="POST">
                                    <input type="hidden" name="recordCode" value={this.props.recordCode} />
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
                        </td>
                    </tr>   
                </tbody> 
            </Router>              
        )         
    }
}
export default RecordList;

















