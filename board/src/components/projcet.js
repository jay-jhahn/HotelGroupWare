import { Component } from "react";
import { Input, Table, TableBody, TableCell, TableHead, TableRow } from '@material-ui/core';
import '../css/Board.css';

class BoardInput extends Component{
    render(){
        return(
            <div>
            <Table>
                <TableHead>
                    <TableRow className="TableRow">
                        <TableCell>휴가신청일 : </TableCell>
                        <TableCell>
                            <Input type="date" name=""/>
                        </TableCell>
                        <TableCell>휴가구분 : </TableCell>
                        <TableCell>
                            <select>
                                <option value="">휴가</option>
                                <option value="">연차</option>
                                <option value="">반차</option>
                                <option value="">병가</option>
                            </select>
                        </TableCell>
                    </TableRow>
                    <TableRow>
                        <TableCell>전일/반일 : </TableCell>
                        <TableCell>
                            <select>
                                <option value="">전일</option>
                                <option value="">반일</option>
                            </select>
                        </TableCell>
                        <TableCell>성명 : </TableCell>
                        <TableCell>
                            <input type="text" name="" />
                        </TableCell>
                    </TableRow>
                    <TableRow>
                        <TableCell>휴가기간 : </TableCell>
                        <TableCell>
                            <Input type="date" name=""/>  ~  <Input type="date" name=""/>
                        </TableCell>
                        <TableCell>휴가일수 : </TableCell>
                        <TableCell>
                            <input type="number" name="" min="1"/> 일
                        </TableCell>
                    </TableRow>
                    <TableRow>
                    <TableCell>휴가사유 : </TableCell>
                        <TableCell colSpan="4">
                            <textarea></textarea>
                        </TableCell>
                    </TableRow>
                </TableHead>
            </Table>
            <br></br>
            <button onClick="">신청</button>
            <button onClick="window.location='/BoardList">취소</button>
            </div>
        );
    }
}
export default BoardInput;