import React, { Component } from 'react';
import { Table, TableBody, TableCell, TableRow} from '@material-ui/core';
import "ka-table/style.css";
import {Link} from 'react-router-dom';
import '../css/Record.css'

class RecordWrite extends Component {
    constructor(props){
        super(props)
        this.state = {
            value : ''
        }
    }

    render() {
        return(
            <div>
                <form action='/api/RecordInsert' method="POST">      
                    <div className="title1"> 
                        <h1 align="center">업무일지 작성</h1>
                    </div>
                    <Table>
                        <th className="thead1">                                                   
                            <tr class="ka-tr ka-row">
                                <td class="ka-cell">직원아이디</td>                                
                                <input type="text" name="empCode" className="text1" placeholder="정확히 입력"></input>
                            </tr>                       
                        </th>
                        <TableBody>
                            <TableRow>
                                <TableCell>객실 종류별 판매 실적</TableCell>
                                <TableCell>향후 일주일간 예약현황</TableCell>
                                <TableCell>단체객 현황</TableCell>
                            </TableRow>
                            <TableRow>
                                <TableCell>
                                    <textarea name="sales_dis" className="textarea1" placeholder="객실별로 정리할것!"></textarea>
                                </TableCell>
                                <TableCell>
                                    <textarea name="week_res_dis" className="textarea1" placeholder="요일별로 정리할것!"></textarea>
                                </TableCell>
                                <TableCell>
                                    <textarea name="ori_dis" className="textarea1" placeholder="대표자 성함, 인원 표기할것!"></textarea>
                                </TableCell>                                
                            </TableRow>
                            <TableRow>
                                <TableCell>특별요금 적용 현황</TableCell>
                                <TableCell>VIP 현황</TableCell>
                                <TableCell>예약 무단취소 명단</TableCell>
                            </TableRow>
                            <TableRow>
                                <TableCell>
                                    <textarea name="price_dis" className="textarea1" placeholder="이름별로 정리할것!"></textarea>
                                </TableCell>
                                <TableCell>
                                    <textarea name="vip_dis" className="textarea1" placeholder="당일 방문자"></textarea>
                                </TableCell>
                                <TableCell>
                                    <textarea name="res_can_dis" className="textarea1" placeholder="당일 무단취소 명단"></textarea>
                                </TableCell>                                
                            </TableRow>
                            <TableRow>
                                <TableCell>예약자 명단</TableCell>
                                <TableCell>특이사항</TableCell>
                                <TableCell></TableCell>                                
                            </TableRow>
                                <TableCell>
                                    <textarea name="res_dis" className="textarea1" placeholder="당일 취소명단 제외"></textarea>
                                </TableCell>
                                <TableCell>
                                    <textarea name="unique_dis" className="textarea1" placeholder="인수인계사항"></textarea>
                                </TableCell>
                            <TableRow>
                                <TableCell></TableCell>
                                <TableCell></TableCell>                            
                                <TableCell>
                                    <input class="btnC" type="submit" value="글작성" color="primary"  />                                
                                    <Link to="/Record">
                                        <input class="btnC" type="button" value="취소" color="primary"  />                                
                                    </Link>
                                </TableCell>
                            </TableRow>
                        </TableBody>
                    </Table>
                </form>
            </div>
        );
    }
}
export default RecordWrite;